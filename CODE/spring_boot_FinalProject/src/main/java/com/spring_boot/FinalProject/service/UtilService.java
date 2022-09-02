package com.spring_boot.FinalProject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IUtilDAO;
import com.spring_boot.FinalProject.model.UtilVO;

@Service
public class UtilService implements IUtilService {
	
	@Autowired
	@Qualifier("IUtilDAO")
	IUtilDAO dao;

	// 지역코드 조회
	@Override
	public ArrayList<UtilVO> selectState() {
		return dao.selectState();
	}

}
