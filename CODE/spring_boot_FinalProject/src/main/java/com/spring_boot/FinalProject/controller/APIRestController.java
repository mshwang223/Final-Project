package com.spring_boot.FinalProject.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot.FinalProject.model.UserVO;
import com.spring_boot.FinalProject.service.ChatbotService;
import com.spring_boot.FinalProject.service.OCRService;
import com.spring_boot.FinalProject.service.UserService;

@RestController
public class APIRestController {
	@Autowired
	APIController apiController;
	
	@Autowired
	UserService userService;
	
	@Autowired
	OCRService ocrService;
	
	// OCR 파일 업로드
	@RequestMapping("/petLoginOCR")
	public String petLoginOCR(@RequestParam("uploadFile") MultipartFile file,
							  HttpSession session) throws IOException {
		
		// 1. 파일 저장 경로 설정 : 실제 서비스 되는 위치 (프로젝트 외부에 저장)
		String uploadPath = apiController.uploadPathFile();
		// 마지막에 / 있어야 함
		
		// 2. 원본 파일 이름 알아오기
		String originalFileName = "petCard.png";
		String filePathName = uploadPath + originalFileName;
		
		// 3. 파일 생성
		File newFile = new File(filePathName);
		
		// 4. 서버로 전송
		file.transferTo(newFile);		
		
		// 펫등록증 인식코드 반환
		String ocrList = ocrService.ocrTemplate(filePathName);
		String petCode = ocrList.replaceAll(" ", "");
		System.out.println(petCode);

		// 포인트 적용 여부 확인
		UserVO vo = userService.selectUserPetCode(petCode);
		userService.updatePoints(vo.getUserId());
		
		// 로그인 후 접속일자 변경
		userService.updateActiveDate(vo.getUserId());
		
		// 로그인 수행
		vo = userService.selectUserPetCode(petCode);
		
		// vo가 null이면 로그인 실패
		if (vo == null) {
			return "FAIL";
		} else {

			// 세션저장
			session.setAttribute("sid", vo.getUserId());
			session.setAttribute("userName", vo.getUserName());
			session.setAttribute("userEmail", vo.getUserEmail());
			session.setAttribute("userImg", vo.getUserImg());
			session.setAttribute("author", vo.getUserAuthor());
			session.setAttribute("points", vo.getPoints());
			
			// 반환값
			return "SUCCESS";
		}
	}
	
	// chatbot api
	@RequestMapping("/petmilyChatbot")
	public String viewChatbot(@RequestParam String message) throws IOException {
		return ChatbotService.mainJSON(message);
	}
	
}


