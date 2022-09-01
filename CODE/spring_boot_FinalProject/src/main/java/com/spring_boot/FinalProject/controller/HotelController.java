package com.spring_boot.FinalProject.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot.FinalProject.model.StayVO;
import com.spring_boot.FinalProject.service.HotelService;

@Controller
public class HotelController {
	
	@Autowired
	HotelService hotelService;
	
	
	// 숙박예약 가기(검색)
	@RequestMapping("/petHotel")
	public String viewPetHotel() {
		return "subPage/petHotel";
	}	
	
	// 호텔 검색 리스트 가기(검색)
	@RequestMapping("/petHotelList/area={area}&period={period}&count={count}")
	public String viewHotelList(@PathVariable("area") String area,
								@PathVariable("period") String period,
								@PathVariable("count") String count,			
								Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("area", area);
		map.put("period", period);
		map.put("count", count);
		
		String[] listPeriod = period.split(" ~ ");
		
		for(String i : listPeriod)
			System.out.println(i);
		
		model.addAttribute("map", map);
		
		
		
		//ArrayList<StayVO> lists = hotelService.selectHotel(map);
		
		//model.addAttribute("lists", lists);
		
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
