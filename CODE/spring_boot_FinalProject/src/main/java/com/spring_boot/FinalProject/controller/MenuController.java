package com.spring_boot.FinalProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot.FinalProject.service.BoardService;

@Controller
public class MenuController {
	@Autowired
	BoardService boardService;
	
	// 프로모션 가기
	@RequestMapping("/promotion")
	public String viewPromotion() {
		return "subPage/promotion";
	} 
}
