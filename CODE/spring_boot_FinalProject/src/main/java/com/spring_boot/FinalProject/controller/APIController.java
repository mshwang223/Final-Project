package com.spring_boot.FinalProject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot.FinalProject.service.FileRead;
import com.spring_boot.FinalProject.service.OCRService;

@Controller
public class APIController {
	@Autowired
	FileRead fileReadService;	
	
	@Autowired
	OCRService ocrService;
	
	// TXT 파일 읽어 웹에 보여주기
	@ResponseBody
	@RequestMapping("/subPage")
	public String viewSubPage(@RequestParam("fileName") String fileName,
							  HttpServletRequest request) {
		String filePath = request.getServletContext().getRealPath("/WEB-INF/views/signupDoc/");
		String result = fileReadService.fileRead(filePath, fileName);
		
		return result;
	}
	
	// 업로드 패스 경로
	
	// 파일 업로드
	@ResponseBody
	public String uploadPathFile() {
		String path = "C:/springWorkspace/upload/";
		
		return path;
	}
	
	// 펫이미지 업로드
	@ResponseBody
	public String uploadPetPathImg() {
		String path = "c:/springWorkspace/petImg/";
		
		return path;
	}
	
	// 유저프로필 업로드
	@ResponseBody
	public String uploadProfilePathImg() {
		String path = "c:/springWorkspace/profileImg/";
		
		return path;
	}
	
	// 업체등록이미지 업로드
	@ResponseBody
	public String uploadCompanyPathImg() {
		String path = "c:/springWorkspace/comImg/";
		
		return path;
	}
}
