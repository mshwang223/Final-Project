package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot.FinalProject.model.StayVO;

public interface IHotelService {

	// 숙박펜션 조회 기능
	ArrayList<StayVO> selectHotel(HashMap<String, Object> map);
}
