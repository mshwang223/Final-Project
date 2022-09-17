package com.spring_boot.FinalProject.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring_boot.FinalProject.service.ChatbotService;
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
	@RequestMapping("/subDoc")
	public String viewSubPage(@RequestParam("fileName") String fileName, HttpServletRequest request) {
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

	///////////////////////// 업로드 /////////////////////////

	// 등록증 파일 업로드
	@ResponseBody
	@RequestMapping("/fileUpload")
	public String fileUpLoadView(@RequestParam("file") MultipartFile[] file, HttpSession session) throws IOException {

		String userId = (String) session.getAttribute("sid");

		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
		String uploadPath = uploadPathFile();
		// 마지막에 / 있어야함

		// 2. 원본 파일 이름 알아오기
		// String originalFileName = file[0].getOriginalFilename();

		// 3. 파일 이름이 중복되지 않도록 파일 이름 변경 : 서버에 저장할 이름
		// UUID 클래스 사용
		// UUID uuid = UUID.randomUUID();
		String savedFileName = userId + "_petCard.png";

		// 4. 파일 생성
		File newFile = new File(uploadPath + savedFileName);

		// 5. 서버로 전송
		file[0].transferTo(newFile);

		return "SUCCESS";
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
	public void fileDownload(@PathVariable String file, HttpServletResponse response) throws IOException {

		File f = new File(uploadPathFile(), file);
		// 파일명 인코딩
		String encodedFileName = new String(file.getBytes("UTF-8"), "ISO-8859-1");

		// file 다운로드 설정

		response.setContentType("application/download");
		response.setContentLength((int) f.length());
		response.setHeader("Content-Disposition", "attatchment;filename=\"" + encodedFileName + "\"");

		// 다운로드 시 저장되는 이름은 Response Header의 "Content-Disposition"에 명시

		OutputStream os = response.getOutputStream();

		FileInputStream fis = new FileInputStream(f);
		FileCopyUtils.copy(fis, os);

		// fis.close();
		// os.close();

	}


}
