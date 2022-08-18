package com.spring_boot.FinalProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HotelController {

	@RequestMapping("/petHotelList")
	public String viewSignup() {
		return "subPage/petHotelList";
	}
}
