package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IBoardDAO;
import com.spring_boot.FinalProject.model.BoardVO;
import com.spring_boot.FinalProject.model.CommentVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.OrderVO;
import com.spring_boot.FinalProject.model.OutuserVO;
import com.spring_boot.FinalProject.model.UserVO;


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
	
	// 문의내역 저장
	@Override
	public void updateContact(HashMap<String, Object> map) {
		dao.updateContact(map);
	}
	
	//등록업체 조회
	@Override
	public ArrayList<InsertHotelVO> selectRegistration(){
		return dao.selectRegistration();
	}

	// 업체 등록 세부 관리
	@Override
	public InsertHotelVO detailRegistration(int regId) {
		
		return dao.detailRegistration(regId);
	}
		
	// 업체 승인
	@Override
	public void approveHotel(String name, String approve) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("approve", approve);
		dao.approveHotel(map);
	}
	
	// 관리자-공지사항 수정
	@Override
	public void updateAdminNotice(HashMap<String, Object> map) {
		dao.updateAdminNotice(map);
	}
	
	// 관리자-공지사항 입력
	@Override
	public void insertAdminNotice(HashMap<String, Object> map) {
		dao.insertAdminNotice(map);
	}

	// 관리자-공지사항 삭제
	@Override
	public void deleteAdminNotice(HashMap<String, Object> map) {
		dao.deleteAdminNotice(map);
	}
	
	// 관리자 - 사용자관리 조회
	@Override
	public ArrayList<UserVO> selectAdminUser(HashMap<String, Object> map){
		return dao.selectAdminUser(map);
	}
	
	// 관리자 - 문의내역 조회
	@Override
	public ArrayList<BoardVO> selectAdminContact(HashMap<String, Object> map) {
		return dao.selectAdminContact(map);
	}
	
	// 관리자 - 문의내역 답변 조회
	@Override
	public CommentVO selectAdminComment(String boardId) {
		return dao.selectAdminComment(boardId);
	}
	
	// 관리자 - 문의내역 답변 반영
	@Override
	public void updateCheckYN(String boardId) {
		dao.updateCheckYN(boardId);
	}

	// 관리자 - 문의내역 답변 저장
	@Override
	public void insertAdminContact(HashMap<String, Object> map) {
		dao.insertAdminContact(map);		
	}

	// 관리자 - 문의내역 답변 수정
	@Override
	public void updateAdminContact(HashMap<String, Object> map) {
		dao.updateAdminContact(map);
	}
	
	// 관리자 - 결재내역 조회
	@Override
	public ArrayList<OrderVO> selectAdminPay(HashMap<String, Object> map) {
		return dao.selectAdminPay(map);
	}
	
	// 관리자 - 결재내역 삭제
	@Override
	public void deleteAdminPay(HashMap<String, Object> map) {
		dao.deleteAdminPay(map);
	}
	
	// 관리자 - 탈퇴회원 조회
	@Override
	public ArrayList<OutuserVO> selectOutUser(HashMap<String, Object> map) {
		return dao.selectOutUser(map);
	}
	
	// 관리자 - 탈퇴회원 삭제
	@Override
	public void deleteAdminOut(HashMap<String, Object> map) {
		dao.deleteAdminOut(map);
	}
}