package com.spring_boot.FinalProject.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.spring_boot.FinalProject.model.FacilityVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.LikeVO;
import com.spring_boot.FinalProject.model.ReviewVO;
import com.spring_boot.FinalProject.model.RoomVO;
import com.spring_boot.FinalProject.model.StayVO;


public interface IHotelDAO {
	// 호텔 등록
	void insertHotel(InsertHotelVO vo);
	
	// 호텔 전체 조회
	ArrayList<StayVO> listAllHotel();
	
	// 숙박펜션 조회 기능
	ArrayList<StayVO> selectHotel(HashMap<String, Object> map);
	
	// 숙박펜션 세부화면 조회 기능
	StayVO selectDetailHotel(HashMap<String, Object> map);
	
	// 숙박펜션 세부화면 조회 기능
	ArrayList<RoomVO> selectDetailRoom(HashMap<String, Object> map);
	
	// 숙박펜션 세부화면 조회 기능
	ArrayList<FacilityVO> selectDetailFacility1(HashMap<String, Object> map);
	
	// 숙박펜션 편의시설2 세부화면 조회 기능
	ArrayList<FacilityVO> selectDetailFacility2(HashMap<String, Object> map);
	
	// 숙박펜션 편의시설3 세부화면 조회 기능
	ArrayList<FacilityVO> selectDetailFacility3(HashMap<String, Object> map);
	
	// 업체등록 이미지 가져오기
	String selectInsertHotelImg(int id);
	
	// 리뷰 남기기
    List<ReviewVO> selectMyReview(String userId);
    
    // 전체 리뷰
    List<ReviewVO> selectStayAllReviews(String stayNo);

    
    //등록 승인 업체
    ArrayList<InsertHotelVO> listtInsert();
    
    // 등록 디테일 세부화면 조회
    InsertHotelVO selectDetailInsert(String regId);
    
	// 숙박펜션 세부화면 조회 기능
	InsertHotelVO selectInsertHotel(HashMap<String, Object> map);
	
	// 찜하기
	void likeHotel(HashMap<String, Object> map);
}
