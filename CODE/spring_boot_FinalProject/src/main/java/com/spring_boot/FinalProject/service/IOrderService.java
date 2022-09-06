package com.spring_boot.FinalProject.service;

import java.util.List;

import com.spring_boot.FinalProject.model.CartVO;
import com.spring_boot.FinalProject.model.OrderVO;

public interface IOrderService {

	// 예약상품 저장
	void insertRsv(OrderVO vo);
    
	// 장바구니 저장
    List<CartVO> selectCartByUserId(String sid);

    void insertCart(CartVO cartVO);
}
