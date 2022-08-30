package com.spring_boot.FinalProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IUserDAO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
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
	
	// 회원 가입
	@Override
	public void insertUser(UserVO vo) {
		// 비밀번호 암호화 처리한 후 mapper에게 전달
		String encodedPwd = pwdEncoder.encode(vo.getUserPw());
		vo.setUserPw(encodedPwd);
		
		dao.insertUser(vo);
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
	
	// 회원탈퇴
	@Override
	public void deleteUser(String userId) {
		dao.deleteUser(userId);
		
	}

	@Override
	public void insertHotel(InsertHotelVO vo) {
		dao.insertHotel(vo);
		
	}
}
