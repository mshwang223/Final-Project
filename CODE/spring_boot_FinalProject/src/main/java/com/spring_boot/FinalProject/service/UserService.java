package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IUserDAO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.LikeVO;
import com.spring_boot.FinalProject.model.PetCardVO;
import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.ReviewVO;
import com.spring_boot.FinalProject.model.StayVO;
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
	
	// ID 찾기
	@Override
	public String forgotId(HashMap<String, Object> map) {
		return dao.forgotId(map);
	}

	// PW 찾기
	@Override
	public void forgotPw(HashMap<String, Object> map) {
		dao.forgotPw(map);
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
	
	// 유저정보 찾기(PW 분실용)
	@Override
	public String chkUser(HashMap<String, Object> map) {
		return dao.chkUser(map);
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
	
	// 펫코드 확인
	@Override
	public String selectPetCode(String petId) {
		return dao.selectPetCode(petId);
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
	
	// 펫 수정
	@Override
	public void updatePet(PetVO vo) {
		dao.updatePet(vo);
	}
	
	// 펫 삭제
	@Override
	public void deletePet(String petId) {
		dao.deletePet(petId);
	}
	
	// 회원탈퇴
	@Override
	public void deleteUser(String userId) {
		dao.deleteUser(userId);
		
	}
	
	// 탈퇴 후 내역관리
	@Override
	public void insertOutUser(HashMap<String, Object> map) {
		dao.insertOutUser(map);
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
	
	// 비밀번호 체크
	@Override
	public String pwCheck(String userId) {
		return dao.pwCheck(userId);
	}
	
	// 리뷰 등록
	@Override
    public void insertReview(ReviewVO review) {
		dao.insertReview(review);
    }
	
	// 마이페이지 찜하기
	@Override
	public ArrayList<LikeVO> selectLike(String sid) {
		return dao.selectLike(sid);
	}

	 // 찜 (특가)
	@Override
	public int selectChkRegId(HashMap<String, Object> map) {
		return dao.selectChkRegId(map);
	}

	 // 찜 (일반)
	@Override
	public int selectChkStay(HashMap<String, Object> map) {
		return dao.selectChkStay(map);
	}

	 //마이페이지 찜삭제(특가)
	@Override
	public void deleteLikeReg(HashMap<String, Object> map) {
		dao.deleteLikeReg(map);
	}

	 //마이페이지 찜삭제(일반)
	@Override
	public void deleteLikeStay(HashMap<String, Object> map) {
		dao.deleteLikeStay(map);
	}

	 // 마이페이지에서 찜삭제하기
	@Override
	public void deleteMyLike(HashMap<String, Object> map) {
		dao.deleteMyLike(map);
	}

	// 찜 하트유지(특가)
	@Override
	public ArrayList<LikeVO> retainHeartReg(String userId) {
		return dao.retainHeartReg(userId);
	}
	// 찜 하트유지(일반)
	@Override
	public ArrayList<LikeVO> retainHeartStay(String userId) {
		return dao.retainHeartStay(userId);
	}

}
