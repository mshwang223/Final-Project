package com.spring_boot.FinalProject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot.FinalProject.model.BoardVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;

public interface IBoardDAO {
	// 공지사항 조회 기능
	ArrayList<BoardVO> selectNotice(HashMap<String, Object> map);
	
	// 공지사항 조회 기능(전체)
	ArrayList<BoardVO> selectNoticeOR(HashMap<String, Object> map);
	
	// 공지사항 세부 내용
	BoardVO noticeDetailView(String boardId);
	
	// 문의하기 작성
	void insertContact(BoardVO vo);
	
	//등록업체 조회
	ArrayList<InsertHotelVO> selectRegistration();
	
	// 업체 디테일 조회
	InsertHotelVO detailRegistration(int regId);
}
