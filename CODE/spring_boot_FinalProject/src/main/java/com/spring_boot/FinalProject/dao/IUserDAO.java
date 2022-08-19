package com.spring_boot.FinalProject.dao;

import com.spring_boot.FinalProject.model.UserVO;

public interface IUserDAO {
	// 유저 조회 기능
	UserVO selectUser(String userId, String userPw);
}
