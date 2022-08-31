package com.spring_boot.FinalProject.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.service.BoardService;

@Controller
public class AdminController {
	
	@Autowired
	BoardService bService;
	
	// 관리자 페이지
	@RequestMapping("/admin")
	public String viewAdmin() {
		return "subPage/admin";
	}
	
	// 관리자-공지사항 세부화면 페이지
	@RequestMapping("/adminNoticeDetail")
	public String viewAdminNoticeDetail() {
		return "subPage/adminNoticeDetail";
	}
	
	// 관리자-공지사항 신규생성 페이지
	@RequestMapping("/adminNoticeNew")
	public String viewAdminNoticeNew() {
		return "subPage/adminNoticeNew";
	}	
	
	// 관리자-업체관리 조회
	@RequestMapping("/adminInsertHotel")
	public String viewAdminInsertHotel(Model model) {
		
		ArrayList <InsertHotelVO> regList = bService.selectRegistration();
		model.addAttribute("regList", regList);
		
		return "subPage/adminInsertHotel";
	}	
	
	// 관리자-업체관리 세부화면 페이지
	@RequestMapping("/adminInsertDetail/{regId}")
	public String viewAdminInsertDetail(@PathVariable int regId, Model model) {
		
		InsertHotelVO vo = bService.detailRegistration(regId);
		model.addAttribute("regId", vo.getRegId());
		model.addAttribute("name", vo.getName());
		model.addAttribute("address1", vo.getAddress1());
		model.addAttribute("address2", vo.getAddress2());
		model.addAttribute("telNumber", vo.getTelNumber());
		model.addAttribute("maxManCnt", vo.getMaxManCnt());
		model.addAttribute("maxPetCnt", vo.getMaxPetCnt());
		model.addAttribute("facility1", vo.getFacility1());
		model.addAttribute("facility2", vo.getFacility2());
		model.addAttribute("facility3", vo.getFacility3());
		model.addAttribute("price", vo.getPrice());
		model.addAttribute("period", vo.getPeriod());
		model.addAttribute("serviceImg", vo.getServiceImg());
		model.addAttribute("createDate", vo.getCreateDate());
		model.addAttribute("comment", vo.getComment());
		
		return "subPage/adminInsertDetail";
	}	
	
	@RequestMapping("fileDownload/{serviceImg}")
	public void fileDownload(@PathVariable String serviceImg, HttpServletResponse response) throws Exception {
		
		File f = new File("C:/springWorkspace/petImg/", serviceImg);
		
		//파일명 인코딩
		String encodedFileName = new String (serviceImg.getBytes("UTF-8"), "ISO-8859-1");

		// 파일 다운로드 설정
		response.setContentType("application/download");
		response.setContentLength((int) f.length());
		response.setHeader("content-Disposition", "attratchment;filename=\""+ encodedFileName +"\"");
		
		//다운로드 시 저장되는 이름은 Response Header의 "Content-Disposition"에 명시
		
		//response 객체를 통해 서버로 부터 파일 다운로드 받음
		OutputStream os = response.getOutputStream();
		
		//파일 입력 객체 생성 
		FileInputStream fis = new FileInputStream(f);
		FileCopyUtils.copy(fis,os);
		
	}

	@RequestMapping("/adminApproveHotel")
	public String adminApproveHotel(@RequestParam HashMap<String, Object> map, Model model) {
		bService.approveHotel((String) map.get("name"), (String) map.get("approve"));
		
		ArrayList <InsertHotelVO> regList = bService.selectRegistration();
		model.addAttribute("regList", regList);
		
		return "subPage/adminInsertHotel";
	}
	
	
}
