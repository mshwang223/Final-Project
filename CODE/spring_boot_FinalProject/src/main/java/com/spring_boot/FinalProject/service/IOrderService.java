package com.spring_boot.FinalProject.service;

import com.spring_boot.FinalProject.model.OrderVO;

public interface IOrderService {

	// 예약상품 저장
	void insertRsv(OrderVO vo);

}
