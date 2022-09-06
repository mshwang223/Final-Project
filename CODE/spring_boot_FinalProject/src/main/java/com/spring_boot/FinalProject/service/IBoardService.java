package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot.FinalProject.model.BoardVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.UserVO;

public interface IBoardService {

	// 공지사항 조회 기능
	ArrayList<BoardVO> selectNotice(HashMap<String, Object> map);
	
	// 공지사항 조회 기능(전체)
	ArrayList<BoardVO> selectNoticeOR(HashMap<String, Object> map);
	
	// 공지사항 세부 내용
	BoardVO noticeDetailView(String boardId);
	
	// 문의하기 작성
	void insertContact(BoardVO vo);
	
	// 문의내역 조회
	ArrayList<BoardVO> selectContact(HashMap<String, Object> map);
	
	// 문의내역 상세조회
	BoardVO contactDetailView(String boardId);
	
	// 문의내역 저장
	void updateContact(HashMap<String, Object> map);
	
	//등록업체 조회
	ArrayList<InsertHotelVO> selectRegistration();
	
	// 업체 디테일 조회
	InsertHotelVO detailRegistration(int regId);
	
	// 업체 승인
	void approveHotel(String name, String approve);
	
	// 관리자-공지사항 수정
	void updateAdminNotice(HashMap<String, Object> map);
	
	// 관리자-공지사항 입력
	void insertAdminNotice(HashMap<String, Object> map);
	
	// 관리자-공지사항 삭제
	void deleteAdminNotice(HashMap<String, Object> map);
	
	// 관리자 - 사용자관리 조회
	ArrayList<UserVO> selectAdminUser(HashMap<String, Object> map);
}
