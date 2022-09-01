package com.spring_boot.FinalProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HotelController {
	
	// 숙박예약 가기(검색)
	@RequestMapping("/petHotel")
	public String viewPetHotel() {
		return "subPage/petHotel";
	}	
	
	// 호텔 검색 리스트 가기(검색)
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
}
