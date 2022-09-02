package com.spring_boot.FinalProject.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot.FinalProject.model.FacilityVO;
import com.spring_boot.FinalProject.model.RoomVO;
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
	@RequestMapping("/petHotelList/{num}")
	public String viewHotelList(@PathVariable String num,
								@RequestParam HashMap<String, Object> map,			
								Model model) {
		
		String count =(String)map.get("count");
		String period = (String)map.get("daterange");
		map.put("num", num);
		map.put("period", period);
		
		/* 지역값 구분 */
		map.put("stateId", "1");
		
		/* 인원수 구하기 */
		
		String[] listCount = count.split(", ");
		String maxManCnt = listCount[0].split("성인")[1];
		String maxPetCnt = listCount[1].split("반려동물")[1];
		
		map.put("maxManCnt", maxManCnt);
		map.put("maxPetCnt", maxPetCnt);

		ArrayList<StayVO> lists = hotelService.selectHotel(map);
		
		/* 조회 수 구하기 */
		if(lists.toString().equals("[]"))
			model.addAttribute("rowCnt", 0);
		else {
			int rowCnt = lists.get(0).getRowCnt();
			model.addAttribute("rowCnt", rowCnt);
		}
		
		model.addAttribute("map", map);
		model.addAttribute("lists", lists);
		
		return "subPage/petHotelList";
	}
	
	// 호텔 상세 페이지
	@RequestMapping("/petHotelDetail/stayNo={stayNo}&period={period}")
	public String viewHotelDetail(@PathVariable("stayNo") String stayNo,
								  @PathVariable("period") String period,
								  Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("stayNo", stayNo);
		map.put("period", period);
		
		// 호텔펜션 테이블
		StayVO vo = hotelService.selectDetailHotel(map);
		
		model.addAttribute("list", vo);
		
		// 룸 테이블
		ArrayList<RoomVO> lists2 = hotelService.selectDetailRoom(map);
		
		model.addAttribute("lists2", lists2);
		
		// 시설 테이블
		ArrayList<FacilityVO> flist1 = hotelService.selectDetailFacility1(map);
		ArrayList<FacilityVO> flist2 = hotelService.selectDetailFacility2(map);
		ArrayList<FacilityVO> flist3 = hotelService.selectDetailFacility3(map);
		
		model.addAttribute("flist1", flist1);
		model.addAttribute("flist2", flist2);
		model.addAttribute("flist3", flist3);
		
		return "subPage/petHotelDetail";
	}
	
	// 호텔 예약 페이지
	@RequestMapping("/petHotelRsv")
	public String viewHotelRsv() {
		return "subPage/petHotelRsv";
	}
}
