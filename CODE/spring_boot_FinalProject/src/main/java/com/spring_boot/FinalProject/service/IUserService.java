package com.spring_boot.FinalProject.service;

import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.UserVO;

public interface IUserService {

	// 유저 조회 기능
	UserVO selectUser(String userId);
	
	// 회원가입
	void insertUser(UserVO vo);
	
	// ID 체크
	String chkId(String id);
	
	// Email 체크
	String chkEmail(String email);
	
	// 펫 등록
	void insertPet(PetVO vo);
}
