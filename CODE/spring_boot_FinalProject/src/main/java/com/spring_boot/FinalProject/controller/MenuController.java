package com.spring_boot.FinalProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {
	// 숙박예약 가기
	@RequestMapping("/petHotel")
	public String viewPetHotel() {
		return "subPage/petHotel";
	}	
	
	// 공지사항 가기
	@RequestMapping("/notice")
	public String viewNotice() {
		return "subPage/notice";
	}
	
	// 공지사항 세부화면 가기
	@RequestMapping("/noticeDetail")
	public String viewNoticeDetail() {
		return "subPage/noticeDetail";
	}
	
	// 문의하기 가기
	@RequestMapping("/contact")
	public String viewContact() {
		return "subPage/contact";
	}
	
	// 문의 조회 가기
	@RequestMapping("/contactResult")
	public String viewContactResult() {
		return "subPage/contactResult";
	}
}
