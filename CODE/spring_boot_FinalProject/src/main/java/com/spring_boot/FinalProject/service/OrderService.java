package com.spring_boot.FinalProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IOrderDAO;
import com.spring_boot.FinalProject.model.OrderVO;

@Service
public class OrderService implements IOrderService {
	
	@Autowired
	@Qualifier("IOrderDAO")
	IOrderDAO dao;
	
	// 예약상품 저장
	@Override
	public void insertRsv(OrderVO vo) {
		dao.insertRsv(vo);
	}

}
