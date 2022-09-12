package com.spring_boot.FinalProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IOrderDAO;
import com.spring_boot.FinalProject.model.CartVO;
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

	// 장바구니 저장
	@Override
	public List<CartVO> selectCartByUserId(String sid) {
		return dao.selectCartByUserId(sid);
	}


	// 장바구니 저장
	@Override
	public void insertCart(CartVO cartVO) {
		dao.insertCart(cartVO);
	}
	
	// 리뷰
	@Override
	public void insertOrder(List<OrderVO> orderVo) {
		dao.insertOrder(orderVo);
	}
}
