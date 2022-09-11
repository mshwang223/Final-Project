package com.spring_boot.FinalProject.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_boot.FinalProject.model.PetCardVO;
import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.UserVO;
import com.spring_boot.FinalProject.service.HotelService;
import com.spring_boot.FinalProject.service.ImgService;
import com.spring_boot.FinalProject.service.UserService;

@Controller
public class UserController {
	@Autowired
	APIController apiController;
	
	@Autowired
	UserService userService;
	
	@Autowired
	PasswordEncoder pwEncoder;

	@Autowired
	ImgService imgService;
	
	@Autowired
	HotelService hotelService;

	
	// 로그인 처리
	@ResponseBody
	@RequestMapping("/login")
	public String userLogin(@RequestParam("userId") String userId, 
							@RequestParam("userPw") String userPw,
							HttpSession session) {
		// 포인트 적용
		userService.updatePoints(userId);
		
		// 로그인 후 접속일자 변경
		userService.updateActiveDate(userId);
		
		UserVO vo = userService.selectUser(userId);

		// vo가 null이면 로그인 실패
		if (vo == null) {
			return "FAIL";
		} else {

			if (!pwEncoder.matches(userPw, vo.getUserPw()))
				return "FAIL";
			
			// 세션저장
			session.setAttribute("sid", vo.getUserId());
			session.setAttribute("userName", vo.getUserName());
			session.setAttribute("userEmail", vo.getUserEmail());
			session.setAttribute("userImg", vo.getUserImg());
			session.setAttribute("author", vo.getUserAuthor());
			session.setAttribute("points", vo.getPoints());
			
			// 반환값
			return "SUCCESS";
		}
	}
	
	// 로그아웃 처리
	@RequestMapping("/logout1")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 이메일 확인
	@ResponseBody
	@RequestMapping("/confirmEmail")
	public String confrimEmail(@RequestParam("userId") String userId) {
		String userEmail = userService.confirmEmail(userId);
		
		return userEmail;
	}
	
	// 펫로그인 페이지 가기
	@RequestMapping("/petLogin")
	public String viewPetLogin() {
		return "subPage/petLogin";
	}	

	// 회원가입 페이지 가기
	@RequestMapping("/signup")
	public String viewSignup() {
		return "subPage/signup";
	}
	
	// 회원가입 기능
	@ResponseBody
	@RequestMapping("/join")
	public String userJoin(@RequestParam("userId") String userId,
						   @RequestParam("userPw") String userPw,
						   @RequestParam("userName") String userName,
						   @RequestParam("userEmail") String userEmail,
						   HttpSession session) {
		
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setUserPw(userPw);
		vo.setUserName(userName);
		vo.setUserEmail(userEmail);
		
		userService.insertUser(vo);
		
		// 세션저장
		session.setAttribute("sid", vo.getUserId());
		session.setAttribute("userName", vo.getUserName());
		session.setAttribute("userEmail", vo.getUserEmail());
		session.setAttribute("userImg", vo.getUserImg());
		session.setAttribute("author", vo.getUserAuthor());
		session.setAttribute("points", vo.getPoints());
		
		return "SUCCESS";
	}
	
	// 회원탈퇴 페이지 이동
	@RequestMapping("/unregisterForm")
	public String viewUnregisterForm() {
		return "subPage/unregisterForm";
	}
	
	// 회원탈퇴 처리
	@RequestMapping(value="/delete")
	public String delete(String userId, RedirectAttributes rttr,HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userName", (String)session.getAttribute("userName"));
		map.put("userAuthor", String.valueOf(session.getAttribute("author")));
		
		userService.insertOutUser(map);	// 탈퇴 후 내역 추가
		
		userService.deleteUser(userId);
		session.invalidate();
		rttr.addFlashAttribute("msg", "이용해주셔서 감사합니다.");
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping("/pwCheck")
	public int pwCheck(UserVO userVO) {
		
		String userPw = userService.pwCheck(userVO.getUserId());
		

		return 1;
	}
	
	// ID 중복 체크
	@ResponseBody
	@RequestMapping("/chkId")
	public String chkUserId(@RequestParam("userId") String userId) {
		String result = "";
		String id = userService.chkId(userId);
		
		if(id != null)
			result = "FIND";
		
		return result;
	}
	
	// Email 중복 체크
	@ResponseBody
	@RequestMapping("/chkEmail")
	public String chkUserEmail(@RequestParam("userEmail") String userEmail) {
		String result = "";
		String email = userService.chkEmail(userEmail);

		if(email != null)
			result = "FIND";
		
		return result;
	}	

    // 마이 페이지
	@RequestMapping("/mypage")
	public String viweMypage( HttpSession session,Model model) {
		String sid = (String) session.getAttribute("sid");
		if (sid == null) {
			return "ACCESS_DENIED";
		}
		UserVO userVO = userService.selectUser(sid);
		model.addAttribute("user",userVO);

		return "subPage/mypage";
	}
	
	 // 프로필 수정 페이지
    @RequestMapping(value = "/updateprofile", method = RequestMethod.GET)
    public String viewUpdateprofile(HttpSession session) {
        System.out.println("session = " + session.getAttribute("sid"));
        if (session.getAttribute("sid") == null) {
            return "redirect:/";
        }
        return "subPage/updateprofile";
    }
    
    // 회원 정보 수정
    @ResponseBody
    @RequestMapping(value = "/updateprofile", method = RequestMethod.POST)
    public String viewUpdateprofile(@RequestParam(required = false) String userPw, @RequestParam(required = false) String userEmail, HttpSession session) {
        String sid = (String) session.getAttribute("sid");

		System.out.println("fileup");
        if (sid == null) {
            return "ACCESS_DENIED";
        }
        if (userPw == null && userEmail == null) {
            return "VALIDATION";
        }
        try {
            userService.memberUpdate(sid, userPw, userEmail);
            UserVO userVO = userService.selectUser(sid);
			System.out.println("userVO = " + userVO);
			System.out.println("sid = " + sid);
            session.setAttribute("userEmail", userVO.getUserEmail());
        } catch (Exception e) {
            e.printStackTrace();
            return "ERROR";
        }
        return "SUCCESS";
    }
    
    // 회원 프로필 이미지
	@ResponseBody
    @RequestMapping(value = "/myProfileImg", method = RequestMethod.GET)
	public ResponseEntity<Resource> myProfileImg(HttpSession session) throws MalformedURLException {
		String sid = (String) session.getAttribute("sid");
		UserVO userVO = userService.selectUser(sid);

		return ResponseEntity.ok()
				.contentType(MediaType.IMAGE_PNG)
				.body(new UrlResource("file:" + imgService.getFullPath(userVO.getUserImg())));
	}

    // 회원 프로필 이미지 수정
    @RequestMapping(value = "/updateUserImg", method = RequestMethod.POST)
	public String updateUserImg(HttpSession session,MultipartFile userImg) throws IOException {
		String sid = (String) session.getAttribute("sid");
		if (sid == null) {
			return "redirect:/";
		}
		String imageName = imgService.storeImg(sid, userImg);
		userService.userImgUpdate(sid, imageName);

		session.setAttribute("userImg", imageName);
		
		return "redirect:/mypage";
	}

	// 펫등록 페이지
	@RequestMapping("/signupPet")
	public String viewSignupPet() {
		return "subPage/signupPet";
	}
	
	// 펫등록 기능
	@ResponseBody
	@RequestMapping("/joinPet")
	public String petJoin(@RequestParam("uploadFile") MultipartFile file,
						  @RequestParam HashMap<String, Object> param) throws IOException {
		
		String 	userId 		= (String)param.get("userId");
		String 	userName 	= (String)param.get("userName");
		String 	petName 	= (String)param.get("petName");
		String 	petRace 	= (String)param.get("petRace");
		int 	petAge 		= Integer.parseInt((String)param.get("petAge"));
		String 	petKind 	= (String)param.get("petKind");
		int 	petSize 	= Integer.parseInt((String)param.get("petSize"));
		String 	comment 	= (String)param.get("comment");
		String 	sessionFile = (String)param.get("sessionFile");

		PetVO vo = new PetVO();
		vo.setUserId(userId);
		vo.setPetName(petName);
		vo.setPetRace(petRace);
		vo.setPetAge(petAge);
		vo.setPetKind(petKind);
		vo.setPetSize(petSize);
		vo.setComment(comment);			
		
		// 1. 파일 저장 경로 설정 : 실제 서비스 되는 위치(프로젝트 외부에 저장)
		String uploadPath = apiController.uploadPetPathImg();
		// c:대소문자 상관없으며 마지막에 '/' 있어야 한다
				
		// 2. 원본 파일 이름 설정
		String originalFileName = file.getOriginalFilename();
		// 이미지가 추가되었을 때
		if(!originalFileName.equals("")) { 
			// 3. 파일 이름이 중복되지 않도록 파일 이름 변경
			
			// 사용자명과 조합하여 파일명 생성
			String savedFileName = userName + "_" + originalFileName;

			// 4. 파일 생성
			File newFile = new File(uploadPath + savedFileName);
					
			// 5. 서버로 전송
			file.transferTo(newFile);
					
			// 6. DB에 저장
			vo.setPetImg(savedFileName);
		} else {	// 이미지가 추가되지 않은 경우
			// 기존 추가된 이미지가 있을 경우
			if(!sessionFile.equals(""))
				vo.setPetImg(sessionFile);
		}
		
		// 임의 펫코드 생성
		String tmpCode1 = RandomStringUtils.randomAlphanumeric(5).toUpperCase();
		String tmpCode2 = RandomStringUtils.randomAlphanumeric(5).toUpperCase();
		String tmpCode3 = RandomStringUtils.randomAlphanumeric(5).toUpperCase();
		String tmpCode4 = userId.toUpperCase();
		
		String petCode = tmpCode1 + "-" + tmpCode2 + "-" + tmpCode3 + "-" + tmpCode4;
		
		vo.setPetCode(petCode);
		
		userService.insertPet(vo);
		
		return petCode;
	}
	
    // 펫등록 완료 페이지
	@RequestMapping("/signupPetComplete/{petCode}")
	public String viewSignupPetComplete(@PathVariable String petCode, Model model) {

		PetCardVO vo = userService.selectPet(petCode);
		
		model.addAttribute("petImg", vo.getPetImg());
		model.addAttribute("userName", vo.getUserName());
		model.addAttribute("petName", vo.getPetName());
		model.addAttribute("petAge", vo.getPetAge());
		model.addAttribute("petKind", vo.getPetKind());
		model.addAttribute("petSize", vo.getPetSize());
		model.addAttribute("petCode", vo.getPetCode());
		model.addAttribute("startDate", vo.getStartDate());
		model.addAttribute("endDate", vo.getEndDate());
		model.addAttribute("createDate", vo.getCreateDate());

		return "subPage/signupPetComplete";
	}
	
	// 업체등록 페이지
	@RequestMapping("/insertHotel")
	public String viewInsertHotel() {
		return "subPage/insertHotel";
	}
}

