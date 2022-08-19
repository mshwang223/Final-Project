package com.spring_boot.FinalProject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

		UserVO vo = userService.selectUser(userId, userPw);

		// vo가 null이면 로그인 실패
		if (vo == null) {
			return "FAIL";
		} else {
			/*
			if (!pwEncoder.matches(userPw, vo.getUserPw()))
				return "FAIL";
			*/
			
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

	// 회원 가입
	@RequestMapping("/signup")
	public String viewSignup() {
		return "subPage/signup";
	}

    // 마이 페이지
	@RequestMapping("/mypage")
	    public String viweMypage() {
		return "subPage/mypage";
	}
}

