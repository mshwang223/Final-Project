package com.spring_boot.FinalProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {
	// 장바구니 가기
	@RequestMapping("/cart")
	public String viewCart() {
		return "subPage/cart";
	}

}