package com.spring_boot.FinalProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IUserDAO;
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
	public UserVO selectUser(String userId, String userPw) {
		return dao.selectUser(userId, userPw);
	}
}
