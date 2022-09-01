package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot.FinalProject.model.FacilityVO;
import com.spring_boot.FinalProject.model.RoomVO;
import com.spring_boot.FinalProject.model.StayVO;

public interface IHotelService {

	// 숙박펜션 조회 기능
	ArrayList<StayVO> selectHotel(HashMap<String, Object> map);
	
	// 숙박펜션 세부화면 조회 기능
	StayVO selectDetailHotel(HashMap<String, Object> map);
	
	// 숙박펜션 세부화면 조회 기능
	ArrayList<RoomVO> selectDetailRoom(HashMap<String, Object> map);
	
	// 숙박펜션 편의시설1 세부화면 조회 기능
	ArrayList<FacilityVO> selectDetailFacility1(HashMap<String, Object> map);
	
	// 숙박펜션 편의시설2 세부화면 조회 기능
	ArrayList<FacilityVO> selectDetailFacility2(HashMap<String, Object> map);
	
	// 숙박펜션 편의시설3 세부화면 조회 기능
	ArrayList<FacilityVO> selectDetailFacility3(HashMap<String, Object> map);
}
