package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IHotelDAO;
import com.spring_boot.FinalProject.model.StayVO;

@Service
public class HotelService implements IHotelService {
	
	@Autowired
	@Qualifier("IHotelDAO")
	IHotelDAO dao;
	
	// 숙박펜션 조회 기능
	@Override
	public ArrayList<StayVO> selectHotel(HashMap<String, Object> map) {
		return dao.selectHotel(map);
	}
}
