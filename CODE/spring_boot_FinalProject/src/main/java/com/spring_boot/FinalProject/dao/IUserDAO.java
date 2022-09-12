package com.spring_boot.FinalProject.dao;

import java.util.HashMap;

import com.spring_boot.FinalProject.model.PetCardVO;
import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.UserVO;

public interface IUserDAO {
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
	
	// 탈퇴 후 내역관리
	void insertOutUser(HashMap<String, Object> map);
	
	// ID 체크
	String chkId(String id);
	
	// Email 체크
	String chkEmail(String email);
	
	// Email 조회
	String confirmEmail(String userId);
	
	// 회원 정보 수정
	void memberUpdate(UserVO vo);
	
	// 관리자-사용자 권한 수정
	void updateAdminUser(HashMap<String, Object> map);
	
	// 펫 등록
	void insertPet(PetVO vo);
	
	// 펫 등록증 확인
	PetCardVO selectPet(String petCode);

	// 펫코드 확인
	String selectPetCode(String petId);
	
	// 펫 등록증 소유 여부 확인
	String selectPetUser(String userId);
	
	// 펫 수정
	void updatePet(PetVO vo);

	//회원 정보 수정
	void memberUpdate(String userId, String updatePw, String updateEmail);
	
	// 프로필 사진 변경
	void updateUserImg(String sid, String imgName);
	
	// 패스워드 체크
	String pwCheck(String userId);
	
	// 관리자 - 사용자 펫 등록 여부 확인
	PetVO selectAdminPetUser(String userId);
}
