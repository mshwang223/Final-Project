package com.spring_boot.FinalProject.service;

import com.spring_boot.FinalProject.model.UserVO;

public interface IUserService {

	// 유저 조회 기능
	UserVO selectUser(String userId, String userPw);
}
