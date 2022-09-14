package com.spring_boot.FinalProject.controller;

import java.io.File;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.OptionalDouble;

import javax.servlet.http.HttpSession;

import com.spring_boot.FinalProject.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot.FinalProject.model.CartVO;
import com.spring_boot.FinalProject.model.FacilityVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.OrderVO;
import com.spring_boot.FinalProject.model.RoomVO;
import com.spring_boot.FinalProject.model.StayVO;
import com.spring_boot.FinalProject.model.UserVO;
import com.spring_boot.FinalProject.model.UtilVO;
import com.spring_boot.FinalProject.service.GEOService;
import com.spring_boot.FinalProject.service.HotelService;
import com.spring_boot.FinalProject.service.OrderService;
import com.spring_boot.FinalProject.service.UserService;
import com.spring_boot.FinalProject.service.UtilService;

@Controller
public class HotelController { 
	@Autowired
	GEOService geoService;
	
	@Autowired
	APIController apiController;
	
	@Autowired
	HotelService hotelService;
	
	@Autowired
	UtilService utilService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	OrderService orderService;
	
	
	// 업체등록
	@ResponseBody
	@RequestMapping("/registerHotel")
	public String registerHotel(@RequestParam("uploadFile") MultipartFile file,
								@RequestParam HashMap<String, Object> param,
								@RequestParam ("service") String[]services,
								@RequestParam ("provide") String[]provides,
								@RequestParam ("additional") String[]additionals, Model model) throws IOException {
		
		String userId = (String)param.get("userId");
		String name = (String)param.get("inputHotelName");
		String zipcode = (String)param.get("zipcode");
		String address1 = (String)param.get("address1");
		String address2 = (String)param.get("address2");
		String telNumber = (String)param.get("inputPhone");
		int price = Integer.parseInt((String)param.get("inputPrice"));
		int maxManCnt = Integer.parseInt((String)param.get("inputLimitPerson"));
		int maxPetCnt = Integer.parseInt((String)param.get("inputLimitPet"));
		String facility1 = "";
		String facility2 = "";
		String facility3 = ""; 
		String period = (String)param.get("daterange");
		String sessionFile = (String)param.get("uploadFile");
		String comment = (String)param.get("stayRule");
		
		for(int i =0; i<services.length; i++) {
			facility1 += services[i] + ",";
		}
		for(int i =0; i<provides.length; i++) {
			facility2 += provides[i] + ",";
		}
		for(int i =0; i<additionals.length; i++) {
			facility3 += additionals[i] + ",";
		}
		  
		
		  InsertHotelVO vo = new InsertHotelVO(); 
		  vo.setUserId(userId);
		  vo.setName(name); 
		  vo.setZipcode(zipcode); 
		  vo.setAddress1(address1);
		  vo.setAddress2(address2); 
		  vo.setTelNumber(telNumber);
		  vo.setMaxManCnt(maxManCnt);
		  vo.setMaxPetCnt(maxPetCnt); 
		  vo.setFacility1(facility1);
		  vo.setFacility2(facility2);
		  vo.setFacility3(facility3);
		  vo.setPrice(price);
		  vo.setPeriod(period); 
		  vo.setComment(comment);
		  
		  
		  // 1. 파일 저장 경로 설정 : 실제 서비스 되는 위치(프로젝트 외부에 저장)
		  String uploadPath = apiController.uploadCompanyPathImg(); // c:대소문자 상관없으며 마지막에 '/' 있어야 한다
		  
		  // 2. 원본 파일 이름 설정
		  String originalFileName = file.getOriginalFilename(); 
		  //이미지가 추가되었을 때
		  if(!originalFileName.equals("")) { 
		  // 3. 파일 이름이 중복되지 않도록 파일 이름 변경
		  
		  // 업체명과 조합하여 파일명 생성
		  String savedFileName = name + "_" + originalFileName;
		  
		  // 4. 파일 생성
		  File newFile = new File(uploadPath + savedFileName);
		  
		  // 5. 서버로 전송
		  file.transferTo(newFile);
		  
		  // 6. DB에 저장
		  vo.setServiceImg(savedFileName); } 

		  else { 
		  // 이미지가 추가되지 않은 경우 
		  // 기존 추가된 이미지가 있을 경우
			if(!sessionFile.equals(""))
			  vo.setServiceImg(sessionFile); }
			 
		  hotelService.insertHotel(vo);
			
		return "success";
	}
	
	// 숙박예약 가기(검색)
	@RequestMapping("/petHotel")
	public String viewPetHotel(Model model, @RequestParam HashMap<String, Object> map) {
		// 지역코드 검색
		ArrayList<UtilVO> lists = utilService.selectState();
		model.addAttribute("lists", lists);
		
		// 호텔펜션 테이블
		ArrayList<StayVO> stayList = hotelService.listAllHotel();
		model.addAttribute("stayList", stayList);
		
		ArrayList<StayVO> approveList = hotelService.selectYHotel();
		model.addAttribute("approveList", approveList);
		
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
	@RequestMapping("/petHotelRsv")
	public String viewHotelRsv(@RequestParam HashMap<String, Object> map,
							   HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("sid");
		UserVO user = userService.selectUser(userId);
		
		// 호텔
		StayVO stayList = hotelService.selectDetailHotel(map);
		String period = (String)map.get("rangepicker");
		String count = (String)map.get("countAll");
		System.out.println(count);
		map.put("period", period);
		map.put("count", count);
				
		// 카트
		 String price =  String.valueOf( map.get("total"));
	        String stayNo = String.valueOf(  map.get("stayNo"));
	        CartVO cartVO = new CartVO(period, Integer.parseInt(price), Integer.parseInt(stayNo), userId);
	        orderService.insertCart(cartVO);
	        
		String[] email = user.getUserEmail().split("@"); 
		
		model.addAttribute("user", user);
		model.addAttribute("stayList", stayList);
		model.addAttribute("email", email);
		model.addAttribute("map", map);
		
		
		return "subPage/petHotelRsv";
	}
	
	// 예약한 상품 저장
	@ResponseBody
	@RequestMapping("/insertRsv")
	public String insertRsv(@RequestParam HashMap<String, Object> map,
							HttpSession session, Model model) {
		
		
		String userId = (String) session.getAttribute("sid");
		String stayNo = (String) map.get("stayNo");
		String count = (String)map.get("count");
		
		String man = count.split(", ")[0];
		int manCnt = Integer.parseInt(man.substring(man.length()-1, man.length()));
		
		String pet = count.split(", ")[1];
		int petCnt = Integer.parseInt(pet.substring(pet.length()-1, pet.length()));
		
		String rcvPhone = (String)map.get("rcvPhone");
		
		OrderVO vo = new OrderVO();
		vo.setUserId(userId);
		vo.setStayNo(stayNo);
		vo.setManCnt(manCnt);
		vo.setPetCnt(petCnt);
		vo.setRcvPhone(rcvPhone);
		
		orderService.insertRsv(vo);		
		
		return "SUCCESS";
	}
	
}
