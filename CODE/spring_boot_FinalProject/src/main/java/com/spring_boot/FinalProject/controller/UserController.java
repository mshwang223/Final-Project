package com.spring_boot.FinalProject.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot.FinalProject.model.PetCardVO;
import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.UserVO;
import com.spring_boot.FinalProject.service.UserService;

@Controller
public class UserController {
	@Autowired
	APIController apiController;
	
	@Autowired
	UserService userService;
	
	@Autowired
	PasswordEncoder pwEncoder;
	
	// 로그인 처리
	@ResponseBody
	@RequestMapping("/login")
	public String userLogin(@RequestParam("userId") String userId, 
							@RequestParam("userPw") String userPw,
							HttpSession session) {

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
		
		return "SUCCESS";
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
	public String viweMypage() {
		return "subPage/mypage";
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
		String 	petKind 	= (String)param.get("petKind");
		int 	petSize 	= Integer.parseInt((String)param.get("petSize"));
		String 	comment 	= (String)param.get("comment");
		String 	sessionFile = (String)param.get("sessionFile");

		PetVO vo = new PetVO();
		vo.setUserId(userId);
		vo.setPetName(petName);
		vo.setPetRace(petRace);
		vo.setPetKind(petKind);
		vo.setPetSize(petSize);
		vo.setComment(comment);			
		
		// 1. 파일 저장 경로 설정 : 실제 서비스 되는 위치(프로젝트 외부에 저장)
		String uploadPath = apiController.uploadPathImg();
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
		model.addAttribute("petKind", vo.getPetKind());
		model.addAttribute("petSize", vo.getPetSize());
		model.addAttribute("petCode", vo.getPetCode());
		model.addAttribute("createDate", vo.getCreateDate());

		return "subPage/signupPetComplete";
	}
	
	// 업체등록 페이지
	@RequestMapping("/insertHotel")
	public String viewInsertHotel() {
		return "subPage/insertHotel";
	}
}

