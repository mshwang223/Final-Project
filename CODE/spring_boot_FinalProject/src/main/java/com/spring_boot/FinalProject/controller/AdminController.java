package com.spring_boot.FinalProject.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.service.BoardService;

@Controller
public class AdminController {
	
	@Autowired
	BoardService bService;
	
	// 관리자 페이지
	@RequestMapping("/admin")
	public String viewAdmin() {
		return "subPage/admin";
	}
	
	// 관리자-공지사항 세부화면 페이지
	@RequestMapping("/adminNoticeDetail")
	public String viewAdminNoticeDetail() {
		return "subPage/adminNoticeDetail";
	}
	
	// 관리자-공지사항 신규생성 페이지
	@RequestMapping("/adminNoticeNew")
	public String viewAdminNoticeNew() {
		return "subPage/adminNoticeNew";
	}	
	
	// 관리자-업체관리 조회
	@RequestMapping("/adminInsertHotel")
	public String viewAdminInsertHotel(Model model) {
		
		ArrayList <InsertHotelVO> regList = bService.selectRegistration();
		model.addAttribute("regList", regList);
		
		return "subPage/adminInsertHotel";
	}	
	
	// 관리자-업체관리 세부화면 페이지
	@RequestMapping("/adminInsertDetail/{regId}")
	public String viewAdminInsertDetail(@PathVariable String regId, Model model) {
		
		ArrayList <InsertHotelVO> regList = bService.selectRegistration();
		model.addAttribute("regList", regList);
		
		return "subPage/adminInsertDetail";
	}	
		

	
	
}
