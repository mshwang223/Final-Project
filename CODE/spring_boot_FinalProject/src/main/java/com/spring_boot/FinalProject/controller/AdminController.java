package com.spring_boot.FinalProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	// 관리자 페이지
	@RequestMapping("/admin")
	public String viewAdmin() {
		return "subPage/admin";
	}
}