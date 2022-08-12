package com.spring_boot.FinalProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {
	// 공지사항 가기
	@RequestMapping("/petHotel")
	public String viewPetHotel() {
		return "subPage/petHotel";
	}	
	
	// 공지사항 가기
	@RequestMapping("/notice")
	public String viewNotice() {
		return "subPage/notice";
	}
}
