package com.spring_boot.FinalProject.service;

import java.util.HashMap;

import com.spring_boot.FinalProject.model.PetCardVO;
import com.spring_boot.FinalProject.model.PetVO;
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
	
	// 회원탈퇴
	void deleteUser(String userId);
	
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
	
	// 펫 등록증 확인
	PetCardVO selectPet(String petCode);
	
	// 펫 등록증 소유 여부 확인
	String selectPetUser(String userId);
	
	// 패스워드 체크
	String pwCheck(String userId);
	
	// 관리자 - 사용자 펫 등록 여부 확인
	PetVO selectAdminPetUser(String userId);
}
