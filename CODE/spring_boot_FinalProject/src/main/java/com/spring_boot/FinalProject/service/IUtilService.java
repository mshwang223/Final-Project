package com.spring_boot.FinalProject.service;

import java.util.ArrayList;

import com.spring_boot.FinalProject.model.UtilVO;


public interface IUtilService {

	// 지역코드 조회 기능
	ArrayList<UtilVO> selectState();

}
