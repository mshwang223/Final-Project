package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.LikeVO;
import com.spring_boot.FinalProject.model.PetCardVO;
import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.ReviewVO;
import com.spring_boot.FinalProject.model.StayVO;
import com.spring_boot.FinalProject.model.UserVO;

public interface IUserService {
	// 유저 조회 기능
	UserVO selectUser(String userId);
	
	// 유저 조회 기능(펫코드)
	UserVO selectUserPetCode(String petCode);
	
	// 로그인 후 접속일자 수정
	void updateActiveDate(String userId);
	
	// 로그인 후 포인트 증감
	void updatePoints(String userId);
	
	// 회원가입
	void insertUser(UserVO vo);
	
	// ID 찾기
	String forgotId(HashMap<String, Object> map);
	
	// PW 찾기
	void forgotPw(HashMap<String, Object> map);
	
	// 유저정보 찾기(PW 분실용)
	String chkUser(HashMap<String, Object> map);
	
	// 회원탈퇴
	void deleteUser(String userId);
	
	// 탈퇴 후 내역관리
	void insertOutUser(HashMap<String, Object> map);
	
	// ID 체크
	String chkId(String id);
	
	// 회원 정보 수정
    void memberUpdate(String userPw, String updatePw, String updateEmail);

	// 관리자-사용자 권한 수정
	void updateAdminUser(HashMap<String, Object> map);
    
	// Email 체크
	String chkEmail(String email);
	
	// Email 조회
	String confirmEmail(String userId);
	
	// 펫 등록
	void insertPet(PetVO vo);
	
	// 펫코드 확인
	String selectPetCode(String petId);
	
	// 펫 등록증 확인
	PetCardVO selectPet(String petCode);
	
	// 펫 등록증 소유 여부 확인
	String selectPetUser(String userId);
	
	// 펫 수정
	void updatePet(PetVO vo);
	
	// 펫 삭제
	void deletePet(String petId);
	
	// 패스워드 체크
	String pwCheck(String userId);
	
	// 관리자 - 사용자 펫 등록 여부 확인
	PetVO selectAdminPetUser(String userId);
	
	// 리뷰 등록
	void insertReview(ReviewVO review);
	 
	 // 마이페이지 찜하기
	 ArrayList<LikeVO> selectLike(String sid);
	 
	 //마이페이지 찜삭제(특가)
	 void deleteLikeReg(HashMap<String, Object> map);
	 
	 //마이페이지 찜삭제(일반)
	 void deleteLikeStay(HashMap<String, Object> map);
	 
	 // 찜 (특가)
	 int selectChkRegId(HashMap<String, Object> map);
	 
	 // 찜 (일반)
	 int selectChkStay(HashMap<String, Object> map);
	 
	 // 마이페이지에서 찜삭제하기
	 void deleteMyLike(HashMap<String, Object> map);
	 
	 // 찜 하트유지(특가)
	 ArrayList<LikeVO> retainHeartReg(String userId);
	 
	 // 찜 하트유지(일반)
	 ArrayList<LikeVO> retainHeartStay(String userId);
}
