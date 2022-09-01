package com.spring_boot.FinalProject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot.FinalProject.model.StayVO;


public interface IHotelDAO {
	
	// 숙박펜션 조회 기능
	ArrayList<StayVO> selectHotel(HashMap<String, Object> map);
}
