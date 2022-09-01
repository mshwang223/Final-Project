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
		
		/* 지역값 구분 */
		map.put("stateId", "1");
		
		/* 날짜값 구하기 */
		String[] listPeriod = period.split(" ~ ");
		String startDate = listPeriod[0].substring(0, listPeriod[0].length()-3);
		String endDate = listPeriod[1].substring(0, listPeriod[1].length()-3);
		
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		model.addAttribute("map", map);
		
		/* 인원수 구하기 */
		
		String[] listCount = count.split(", ");
		String maxManCnt = listCount[0].split("성인")[1];
		String maxPetCnt = listCount[1].split("반려동물")[1];
		
		map.put("maxManCnt", maxManCnt);
		map.put("maxPetCnt", maxPetCnt);

		System.out.println(map.keySet());
		System.out.println(map.values());
		ArrayList<StayVO> lists = hotelService.selectHotel(map);
		
		/* 조회 수 구하기 */
		if(lists.toString().equals("[]"))
			model.addAttribute("rowCnt", 0);
		else {
			int rowCnt = lists.get(0).getRowCnt();
			model.addAttribute("rowCnt", rowCnt);
		}
		
		for(StayVO list : lists)
			System.out.println("list = " + list.getStayName());
		
		model.addAttribute("lists", lists);
		
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
