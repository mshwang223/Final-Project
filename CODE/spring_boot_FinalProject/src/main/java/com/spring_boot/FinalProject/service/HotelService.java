package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IHotelDAO;
import com.spring_boot.FinalProject.model.FacilityVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.LikeVO;
import com.spring_boot.FinalProject.model.ReviewVO;
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
	
	// 나의 리뷰
	@Override
    public List<ReviewVO> selectMyReview(String userId) {
		return dao.selectMyReview(userId);
    }
    // 모든 리뷰
	@Override
	public List<ReviewVO> selectStayAllReviews(String stayNo) {
		return dao.selectStayAllReviews(stayNo);
	}


    // 등록 업체 조회
	@Override
	public ArrayList<InsertHotelVO> listtInsert() {
		return dao.listtInsert();
	}
    
	// 등록 업체 디테일
	@Override
	public InsertHotelVO selectDetailInsert(String regId) {
		return dao.selectDetailInsert(regId);
	}
    
	// 등록 업체 
	@Override
	public InsertHotelVO selectInsertHotel(HashMap<String, Object> map) {
		return dao.selectInsertHotel(map);
	}
	
	// 찜하기
	@Override
	public void likeHotel(HashMap<String, Object> map) {
		dao.likeHotel(map);
	}

}
