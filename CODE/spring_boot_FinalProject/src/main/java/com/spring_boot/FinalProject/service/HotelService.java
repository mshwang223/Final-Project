package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IHotelDAO;
import com.spring_boot.FinalProject.model.FacilityVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.RoomVO;
import com.spring_boot.FinalProject.model.StayVO;

@Service
public class HotelService implements IHotelService {
	
	@Autowired
	@Qualifier("IHotelDAO")
	IHotelDAO dao;

	// 호텔 등록
	@Override
	public void insertHotel(InsertHotelVO vo) {
		dao.insertHotel(vo);
		
	}	

	// 숙박펜션 조회 기능
	@Override
	public ArrayList<StayVO> selectHotel(HashMap<String, Object> map) {
		return dao.selectHotel(map);
	}
	
	// 숙박펜션 세부화면 조회 기능
	@Override
	public StayVO selectDetailHotel(HashMap<String, Object> map) {
		return dao.selectDetailHotel(map);
	}
	
	// 숙박펜션 세부화면 조회 기능
	@Override
	public ArrayList<RoomVO> selectDetailRoom(HashMap<String, Object> map) {
		return dao.selectDetailRoom(map);
	}
	
	// 숙박펜션 편의시설1 세부화면 조회 기능
	@Override
	public ArrayList<FacilityVO> selectDetailFacility1(HashMap<String, Object> map) {
		return dao.selectDetailFacility1(map);
	}
	
	// 숙박펜션 편의시설2 세부화면 조회 기능
	@Override
	public ArrayList<FacilityVO> selectDetailFacility2(HashMap<String, Object> map) {
		return dao.selectDetailFacility2(map);
	}
	
	// 숙박펜션 편의시설3 세부화면 조회 기능
	@Override
	public ArrayList<FacilityVO> selectDetailFacility3(HashMap<String, Object> map) {
		return dao.selectDetailFacility3(map);
	}

	@Override
	public ArrayList<StayVO> listAllHotel() {
		return dao.listAllHotel();
	}

	@Override
	public String selectInsertHotelImg(int id) {

		return dao.selectInsertHotelImg(id);
	}
}
