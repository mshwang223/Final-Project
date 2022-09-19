package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot.FinalProject.model.BoardVO;
import com.spring_boot.FinalProject.model.CommentVO;
import com.spring_boot.FinalProject.model.FacilityVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.OrderVO;
import com.spring_boot.FinalProject.model.OutuserVO;
import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.ServiceVO;
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
	
	// 관리자 - 문의내역 답변 조회
	CommentVO selectAdminComment(String boardId);
	
	// 작성자 Email 확인
	String contactEmail(String boardId);
	
	// 문의내역 상세조회
	BoardVO contactDetailView(String boardId);
	
	// 문의내역 저장
	void updateContact(HashMap<String, Object> map);
	
	//등록업체 조회(등록업체 명)
	ArrayList<InsertHotelVO> selectRegistration(HashMap<String, Object> map);
	
	// 업체 디테일 조회
	InsertHotelVO detailRegistration(int regId);
	
	// 업체 승인
	void approveHotel(String name, String approve);
	
	// 관리자 - 공지사항 수정
	void updateAdminNotice(HashMap<String, Object> map);
	
	// 관리자 - 공지사항 입력
	void insertAdminNotice(HashMap<String, Object> map);
	
	// 관리자 - 공지사항 삭제
	void deleteAdminNotice(HashMap<String, Object> map);
	
	// 관리자 - 사용자관리 조회
	ArrayList<UserVO> selectAdminUser(HashMap<String, Object> map);
	
	// 관리자 - 문의내역 조회
	ArrayList<BoardVO> selectAdminContact(HashMap<String, Object> map);
	
	// 관리자 - 문의내역 답변 반영
	void updateCheckYN(String boardId);
	
	// 관리자 - 문의내역 답변 저장
	void insertAdminContact(HashMap<String, Object> map);
	
	// 관리자 - 문의내역 답변 수정
	void updateAdminContact(HashMap<String, Object> map);
	
	// 관리자 - 결제내역 조회
	ArrayList<OrderVO> selectAdminPay(HashMap<String, Object> map);
	
	// 관리자 - 결제내역 삭제
	void deleteAdminPay(HashMap<String, Object> map);
	
	// 관리자 - 결제내역 상세조회
	OrderVO payDetailView(String ordNo);
	
	// 관리자 - 탈퇴회원 조회
	ArrayList<OutuserVO> selectOutUser(HashMap<String, Object> map);
	
	// 관리자 - 탈퇴회원 삭제
	void deleteAdminOut(HashMap<String, Object> map);
	
	// 관리자 - 서비스 조회(전체)
	ArrayList<ServiceVO> selectServiceOR(HashMap<String, Object> map);
	
	// 관리자 - 서비스 조회(조건)
	ArrayList<ServiceVO> selectService(HashMap<String, Object> map);
	
	// 관리자 - 서비스 입력
	void insertAdminService(HashMap<String, Object> map);
	
	// 관리자 - 서비스 삭제
	void deleteAdminService(HashMap<String, Object> map);
	
	// 관리자 - 서비스 상세조회
	ServiceVO serviceDetailView(String serviceId);
	
	// 관리자 - 서비스 세부화면 수정
	void updateAdminService(HashMap<String, Object> map);
	
	// 관리자 - 시설 조회(전체)
	ArrayList<FacilityVO> selectFacilityOR(HashMap<String, Object> map);
	
	// 관리자 - 시설 조회(조건)
	ArrayList<FacilityVO> selectFacility(HashMap<String, Object> map);
	
	// 관리자 - 시설 입력
	void insertAdminFacility(HashMap<String, Object> map);
	
	// 관리자 - 시설 삭제
	void deleteAdminFacility(HashMap<String, Object> map);
	
	// 관리자 - 시설 상세조회
	FacilityVO facilityDetailView(String facilityId);
	
	// 관리자 - 시설 세부화면 수정
	void updateAdminFacility(HashMap<String, Object> map);
	
	// 관리자 - 펫등록증 조회(전체)
	ArrayList<PetVO> selectPetOR(HashMap<String, Object> map);
	
	// 관리자 - 펫등록증 조회(조건)
	ArrayList<PetVO> selectPet(HashMap<String, Object> map);
	
	// 관리자 - 펫등록증 삭제
	void deleteAdminPet(HashMap<String, Object> map);
	
	// 관리자 - 펫등록증 연장
	void extendAdminPet(String petId);
	
	// 관리자 - 등록업체 삭제
	void deleteAdminReg(HashMap<String, Object> map);	
	
}
