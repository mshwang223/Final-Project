package com.spring_boot.FinalProject.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IUserDAO;
import com.spring_boot.FinalProject.model.PetCardVO;
import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.UserVO;

@Service
public class UserService implements IUserService {
	
	@Autowired
	@Qualifier("IUserDAO")
	IUserDAO dao;
	
	@Autowired
	PasswordEncoder pwdEncoder;

	// 유저 조회 기능
	@Override
	public UserVO selectUser(String userId) {
		return dao.selectUser(userId);
	}
	
	// 유저 조회 기능(펫코드)
	@Override
	public UserVO selectUserPetCode(String petCode) {
		return dao.selectUserPetCode(petCode);
	}
	
	// 로그인 후 접속일자 수정
	@Override
	public void updateActiveDate(String userId) {
		dao.updateActiveDate(userId);
	}
	
	// 로그인 후 포인트 증감
	@Override
	public void updatePoints(String userId) {
		dao.updatePoints(userId);
	}
	
	// 회원 가입
	@Override
	public void insertUser(UserVO vo) {
		// 비밀번호 암호화 처리한 후 mapper에게 전달
		String encodedPwd = pwdEncoder.encode(vo.getUserPw());
		vo.setUserPw(encodedPwd);
		
		dao.insertUser(vo);
	}
	
	// 회원 정보 수정
	@Override
	public void memberUpdate(String userId,String updatePw,String updateEmail) {
		String encodedPwd = pwdEncoder.encode(updatePw);
		dao.memberUpdate(userId,encodedPwd,updateEmail);
	}
	
	// 관리자-사용자 권한 수정
	@Override
	public void updateAdminUser(HashMap<String, Object> map) {
		dao.updateAdminUser(map);
	}	
		
	// ID 체크
	@Override
	public String chkId(String id) {
		return dao.chkId(id);
	}
	
	// Email 체크
	@Override
	public String chkEmail(String email) {
		return dao.chkEmail(email);
	}
	
	// Email 확인
	@Override
	public String confirmEmail(String userId) {
		return dao.confirmEmail(userId);
	}

	// 펫 등록
	@Override
	public void insertPet(PetVO vo) {
		dao.insertPet(vo);
	}

	// 펫 등록 확인
	@Override
	public PetCardVO selectPet(String petCode) {
		return dao.selectPet(petCode);
	}
	
	// 펫 등록증 소유 여부 확인
	@Override
	public String selectPetUser(String userId) {
		return dao.selectPetUser(userId);
	}
	
	// 회원탈퇴
	@Override
	public void deleteUser(String userId) {
		dao.deleteUser(userId);
		
	}

	// 사진 변경
	public void userImgUpdate(String sid, String imgName) {
		dao.updateUserImg(sid, imgName);
	}
	
	// 관리자 - 사용자 펫 등록 여부 확인
	@Override
	public PetVO selectAdminPetUser(String userId) {
		return dao.selectAdminPetUser(userId);
	}
}
