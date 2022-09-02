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

import com.spring_boot.FinalProject.model.FacilityVO;
import com.spring_boot.FinalProject.model.RoomVO;
import com.spring_boot.FinalProject.model.StayVO;
import com.spring_boot.FinalProject.model.UserVO;
import com.spring_boot.FinalProject.model.UtilVO;
import com.spring_boot.FinalProject.service.GEOService;
import com.spring_boot.FinalProject.service.HotelService;
import com.spring_boot.FinalProject.service.UserService;
import com.spring_boot.FinalProject.service.UtilService;

@Controller
public class HotelController { 
	@Autowired
	GEOService geoService;
	
	@Autowired
	HotelService hotelService;
	
	@Autowired
	UtilService utilService;
	
	@Autowired
	UserService userService;
	
	
	// 숙박예약 가기(검색)
	@RequestMapping("/petHotel")
	public String viewPetHotel(Model model) {
		// 지역코드 검색
		ArrayList<UtilVO> lists = utilService.selectState();
		model.addAttribute("lists", lists);
		
		return "subPage/petHotel";
	}	
	
	// 호텔 검색 리스트 가기(검색)
	@RequestMapping("/petHotelList/{num}")
	public String viewHotelList(@PathVariable String num,
								@RequestParam HashMap<String, Object> map,			
								Model model) {
		
		// 지역코드 검색
		ArrayList<UtilVO> areaLists = utilService.selectState();
		model.addAttribute("areaLists", areaLists);
		
		String areaCode = (String)map.get("areaCode");
		
		String count = (String)map.get("count");
		String period = (String)map.get("daterange");
		map.put("num", num);
		map.put("period", period);
		
		/* 지역값 구분 */
		//map.put("stateId", "1");
		map.put("stateId", areaCode);
		
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
	@RequestMapping("/petHotelDetail/stayNo={stayNo}")
	public String viewHotelDetail(@PathVariable("stayNo") String stayNo,
								  @RequestParam HashMap<String, Object> map,
								  HttpSession session, Model model) {
		
		map.put("stayNo", stayNo);
		
		String period = (String)map.get("daterange");
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
		model.addAttribute("map", map);

		// 지도 주소 좌표 호출(Naver GEOService)
		String address = vo.getStayAddress();
		String coordinate = geoService.geoAddress(address);
		model.addAttribute("coordinate", coordinate);
		
		// 펫 등록증 소유여부 확인
		String sid = (String)session.getAttribute("sid");
		String userId = userService.selectPetUser(sid);
		
		String petChkYn = "Y";
		if(userId == null) petChkYn = "N";
		
		model.addAttribute("petChkYn", petChkYn);
		
		
		return "subPage/petHotelDetail";
	}
	
	// 호텔 예약 페이지
	@RequestMapping("/petHotelRsv/stayNo={stayNo}&period={period}")
	public String viewHotelRsv(@PathVariable("stayNo") String stayNo,
							   @PathVariable("period") String period,
							   HttpSession session, Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String userId = (String) session.getAttribute("sid");
		UserVO user = userService.selectUser(userId);
		
		map.put("stayNo", stayNo);
		map.put("period", period);
		
		System.out.println(stayNo);
		// 호텔
		StayVO stayList = hotelService.selectDetailHotel(map);
		System.out.println(stayList);
		
		
		// 룸
		ArrayList<RoomVO> roomList = hotelService.selectDetailRoom(map);
		System.out.println(roomList);
		
		
		String[] email = user.getUserEmail().split("@"); 
		
		model.addAttribute("user", user);
		model.addAttribute("stayList", stayList);
		model.addAttribute("roomList", roomList);
		model.addAttribute("email", email);
		model.addAttribute("map", map);
		
		
		return "subPage/petHotelRsv";
	}
}
