package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IBoardDAO;
import com.spring_boot.FinalProject.model.BoardVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;


@Service
public class BoardService implements IBoardService {
	@Autowired
	@Qualifier("IBoardDAO")
	IBoardDAO dao;
	
	// 공지사항 조회기능(조건)
	@Override
	public ArrayList<BoardVO> selectNotice(HashMap<String, Object> map) {
		return dao.selectNotice(map);
	}
	
	// 공지사항 조회기능(전체)
	@Override
	public ArrayList<BoardVO> selectNoticeOR(HashMap<String, Object> map) {
		return dao.selectNoticeOR(map);
	}

	// 공지사항 세부화면 조회
	@Override
	public BoardVO noticeDetailView(String boardId) {
		return dao.noticeDetailView(boardId);
	}

	// 문의하기 작성
	@Override
	public void insertContact(BoardVO vo) {
		dao.insertContact(vo);		
	}

	// 문의내역 조회
	@Override
	public ArrayList<BoardVO> selectContact(HashMap<String, Object> map) {
		return dao.selectContact(map);
	}
	
	// 문의내역 세부화면 조회
	@Override
	public BoardVO contactDetailView(String boardId) {
		return dao.contactDetailView(boardId);
	}
	
	//등록업체 조회
	@Override
	public ArrayList<InsertHotelVO> selectRegistration(){
		return dao.selectRegistration();
	}

	@Override
	public InsertHotelVO detailRegistration(int regId) {
		
		return dao.detailRegistration(regId);
	}

	@Override
	public void approveHotel(String name, String approve) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("approve", approve);
		dao.approveHotel(map);
	}
	
	
}
