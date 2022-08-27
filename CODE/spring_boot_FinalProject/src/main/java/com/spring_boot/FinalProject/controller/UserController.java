package com.spring_boot.FinalProject.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.UserVO;
import com.spring_boot.FinalProject.service.UserService;


@Controller
public class UserController {
	
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
	public String petJoin(@RequestParam HashMap<String, Object> param) {
		
		String 	userId 	= (String)param.get("userId");
		String 	petImg 	= (String)param.get("petImg");
		String 	petName = (String)param.get("petName");
		String 	petRace = (String)param.get("petRace");
		String 	petKind = (String)param.get("petKind");
		int 	petSize = Integer.parseInt((String)param.get("petSize"));
		String 	comment = (String)param.get("comment");
		
		PetVO vo = new PetVO();
		vo.setUserId(userId);
		vo.setPetImg(petImg);
		vo.setPetName(petName);
		vo.setPetRace(petRace);
		vo.setPetKind(petKind);
		vo.setPetSize(petSize);
		vo.setComment(comment);
		
		// 임의 펫코드 생성
		String tmpCode1 = RandomStringUtils.randomAlphanumeric(5);
		String tmpCode2 = RandomStringUtils.randomAlphanumeric(5);
		String tmpCode3 = RandomStringUtils.randomAlphanumeric(5);
		String tmpCode4 = userId;
		
		String petCode = tmpCode1 + "-" + tmpCode2 + "-" + tmpCode3 + "-" + tmpCode4;
		
		vo.setPetCode(petCode);
		
		userService.insertPet(vo);
		
		return "SUCCESS";
	}
	
	// 업체등록 페이지
	@RequestMapping("/insertHotel")
	public String viewInsertHotel() {
		return "subPage/insertHotel";
	}
}

