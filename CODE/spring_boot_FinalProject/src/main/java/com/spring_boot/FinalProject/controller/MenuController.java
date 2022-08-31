package com.spring_boot.FinalProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot.FinalProject.model.BoardVO;
import com.spring_boot.FinalProject.service.BoardService;

@Controller
public class MenuController {
	@Autowired
	BoardService boardService;
	
	
	// 숙박예약 가기
	@RequestMapping("/petHotel")
	public String viewPetHotel() {
		return "subPage/petHotel";
	}	
	
	// 호텔 검색 리스트 가기
	@RequestMapping("/petHotelList")
	public String viewHotelList() {
		return "subPage/petHotelList";
	}
	// 호텔 상세 페이지
	@RequestMapping("/petHotelDetail")
	public String viewHotelDetail() {
		return "subPage/petHotelDetail";
	}
	// 호텔 예약 페이지
	@RequestMapping("/petHotelRsv")
	public String viewHotelRsv() {
		return "subPage/petHotelRsv";
	}
	// 프로모션 가기
	@RequestMapping("/promotion")
	public String viewPromotion() {
		return "subPage/promotion";
	} 
}
