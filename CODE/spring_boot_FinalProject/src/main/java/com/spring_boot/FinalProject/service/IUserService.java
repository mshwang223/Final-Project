package com.spring_boot.FinalProject.service;

import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.PetCardVO;
import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.UserVO;

public interface IUserService {

	// 유저 조회 기능
	UserVO selectUser(String userId);
	
	// 유저 조회 기능(펫코드)
	UserVO selectUserPetCode(String petCode);
	
	// 회원가입
	void insertUser(UserVO vo);
	
	// 회원탈퇴
	void deleteUser(String userId);
	
	// ID 체크
	String chkId(String id);
	
	 // 회원 정보 수정
    void memberUpdate(String userId, String updateId, String updateEmail);
    
	// Email 체크
	String chkEmail(String email);
	
	// Email 조회
	String confirmEmail(String userId);
	
	// 펫 등록
	void insertPet(PetVO vo);
	
	// 펫 등록증 확인
	PetCardVO selectPet(String petCode);
	
	// 호텔 등록
	void insertHotel(InsertHotelVO vo);
}
