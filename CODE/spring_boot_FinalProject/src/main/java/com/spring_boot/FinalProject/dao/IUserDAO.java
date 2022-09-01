package com.spring_boot.FinalProject.dao;

import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.PetCardVO;
import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.UserVO;

public interface IUserDAO {
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
	
	// Email 체크
	String chkEmail(String email);
	
	// Email 조회
	String confirmEmail(String userId);
	
	// 회원 정보 수정
	void memberUpdate(UserVO vo);
	
	// 펫 등록
	void insertPet(PetVO vo);
	
	// 펫 등록증 확인
	PetCardVO selectPet(String petCode);
	
	// 호텔 등록
	void insertHotel(InsertHotelVO vo);

	//회원 정보 수정
	void memberUpdate(String userId, String updatePw, String updateEmail);
	
	// 프로필 사진 변경
	void updateUserImg(String sid, String imgName);
}
