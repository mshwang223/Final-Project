package com.spring_boot.FinalProject.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
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

