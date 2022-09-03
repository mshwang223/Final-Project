package com.spring_boot.FinalProject.dao;

import com.spring_boot.FinalProject.model.OrderVO;

public interface IOrderDAO {

	// 예약상품 저장
	void insertRsv(OrderVO vo);
}
