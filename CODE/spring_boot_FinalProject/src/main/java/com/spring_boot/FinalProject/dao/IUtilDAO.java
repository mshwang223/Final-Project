package com.spring_boot.FinalProject.dao;

import java.util.ArrayList;
import com.spring_boot.FinalProject.model.UtilVO;


public interface IUtilDAO {

	// 지역코드 조회 기능
	ArrayList<UtilVO> selectState();
	
}
