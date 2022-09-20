package com.spring_boot.FinalProject.dao;

import java.util.ArrayList;
import java.util.List;

import com.spring_boot.FinalProject.model.CartVO;
import com.spring_boot.FinalProject.model.OrderInfoVO;
import com.spring_boot.FinalProject.model.OrderVO;

public interface IOrderDAO {

	// 예약상품 저장
	void insertRsv(OrderVO vo);
	
	// 장바구니
	List<CartVO> selectCartByUserId(String userId);
    
	void insertCart(CartVO cartVO);
	
	  void insertOrder(List<OrderVO> orderVo);

	  
	 //장바구니 삭제
    void deleteCarts(ArrayList<Long> id);
	List<OrderInfoVO> selectReservation(String userId);

}
