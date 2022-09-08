package com.spring_boot.FinalProject.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	///////////////////////// 다운로드 /////////////////////////
	
	// 파일 목록 보여주기
	@RequestMapping("/fileDownloadList")
	public ModelAndView fileDownloadList(ModelAndView mv) {
		File path = new File("/Library/springWorkspace/upload/");
		String[] fileList = path.list();
		
		mv.addObject("fileList", fileList);
		mv.setViewName("upload/fileDownloadListView");
		
		return mv;
	}
	
	// 파일 다운로드 
	@RequestMapping("/fileDownload/{file}")
	public void fileDownload(@PathVariable String file, 
							 HttpServletResponse response) throws IOException {
		
		File f = new File(uploadPathFile(), file);
		// 파일명 인코딩
		String encodedFileName = new String (file.getBytes("UTF-8"), "ISO-8859-1");

		
		// file 다운로드 설정
		
		response.setContentType("application/download");
		response.setContentLength((int)f.length());
		response.setHeader("Content-Disposition", "attatchment;filename=\"" + encodedFileName + "\"");
		
		// 다운로드 시 저장되는 이름은 Response Header의 "Content-Disposition"에 명시
		
		OutputStream os = response.getOutputStream();
		
		FileInputStream fis = new FileInputStream(f);
		FileCopyUtils.copy(fis, os);
		
		// fis.close();
		// os.close();
		
	}	
}
