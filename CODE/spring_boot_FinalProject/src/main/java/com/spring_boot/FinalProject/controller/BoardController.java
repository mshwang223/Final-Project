
package com.spring_boot.FinalProject.controller;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot.FinalProject.model.BoardVO;
import com.spring_boot.FinalProject.model.CommentVO;
import com.spring_boot.FinalProject.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	APIController apiController;
	
	// 공지사항 페이지 검색
	@RequestMapping("/noticeSearch/{num}")
	public String noticeSearch(@PathVariable String num, 
							   @RequestParam HashMap<String, Object> map, 
							   HttpSession session, Model model) {
		int chk_search = 0;
		if(map.get("chk_search") != null)
			chk_search = Integer.parseInt((String)map.get("chk_search"));
		
		String text_search = "";	

		if(map.get("text_search") == null)
			text_search = "";
		else
			text_search = (String)map.get("text_search");

		
		ArrayList<BoardVO> lists = null;
		
		// 페이징 초기값
		int pageNum = Integer.parseInt(num) * 10;
		map.put("pageNum", pageNum);
		
		if(chk_search == 0) {	// 검색 조건 전체
			if(text_search.equals("") || text_search.length() == 0) {
				map.put("title", "%");
				map.put("contents", "%");
			} else {
				map.put("title", text_search);
				map.put("contents", text_search);
			}
			
			lists = boardService.selectNoticeOR(map);
		} else {
			if(chk_search == 1) {	// 검색 조건 제목
				if(text_search.equals("") || text_search.length() == 0)
					map.put("title", "%");
				else
					map.put("title", text_search);
				
				map.put("contents", "%");
			} else {	// 검색 조건 내용
				if(text_search.equals("") || text_search.length() == 0)
					map.put("contents", "%");
				else
					map.put("contents", text_search);
				
				map.put("title", "%");				
			}
			lists = boardService.selectNotice(map);
		}

		if(!lists.toString().equals("[]")) {
		
			// 페이징 계산
			int maxPageNum = (int)Math.ceil((double)lists.get(0).getRowCnt() / 10);
	
			
			model.addAttribute("lists", lists);
			model.addAttribute("maxCnt", lists.get(0).getRowCnt());
			model.addAttribute("maxPageNum", maxPageNum);
	
			model.addAttribute("chk_search", map.get("chk_search"));
			model.addAttribute("text_search", map.get("text_search"));		
			
			session.setAttribute("flag", num);
		} else {
			model.addAttribute("maxPageNum", 0);
		}

		return "subPage/notice";
	}
	
	// 공지사항 세부화면 가기
	@RequestMapping("/noticeDetail/{boardId}")
	public String viewNoticeDetail(@PathVariable String boardId, Model model) {
		BoardVO vo = boardService.noticeDetailView(boardId);
		
		model.addAttribute("notice", vo);
		
		return "subPage/noticeDetail";
	}
	
	// 문의하기 등록
	@ResponseBody
	@RequestMapping("/insertContact")
	public String insertContact(@RequestParam("uploadFile") MultipartFile file, 
								@RequestParam HashMap<String, Object> map) throws IOException {
		String userId = (String)map.get("userId");
		String userName = (String)map.get("userName");
		String title = (String)map.get("title");
		String contents = (String)map.get("contents");
		
		String chkEmail = null;
		if((map.get("chkEmail") == null)) chkEmail = "N";
		else chkEmail = "Y";
		
		BoardVO vo = new BoardVO();
		vo.setUserId(userId);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setChkEmail(chkEmail);
		
		// 1. 파일 저장 경로 설정 : 실제 서비스 되는 위치(프로젝트 외부에 저장)
		String uploadPath = apiController.uploadPathFile();
		// c:대소문자 상관없으며 마지막에 '/' 있어야 한다
				
		// 2. 원본 파일 이름 설정
		String originalFileName = file.getOriginalFilename();

		// 3. 파일 이름이 중복되지 않도록 파일 이름 변경
			
		// 사용자명과 조합하여 파일명 생성
		String savedFileName = userName + "_" + originalFileName;

		// 4. 파일 생성
		File newFile = new File(uploadPath + savedFileName);
					
		
		if(!originalFileName.equals("")) {
			// 5. 서버로 전송
			file.transferTo(newFile);
			
			// 6. DB에 저장
			vo.setChkFile(savedFileName);
		}
		
		
		boardService.insertContact(vo);
		
		return "SUCCESS";
	}
	
	// 공지사항 가기
	/*
	@RequestMapping("/notice")
	public String viewNotice() {
		return "redirect:/noticeSearch/" + "0";
		//return "subPage/notice";
	}
	*/
	
	// 문의내역 가기
	@RequestMapping("/contact")
	public String viewContact() {
		return "subPage/contact";
	}
	
	// 문의내역 조회 가기
	/*
	@RequestMapping("/contactResult")
	public String viewContactResult() {
		return "subPage/contactResult";
	}
	*/
	
	// 문의 내역 조회
	@RequestMapping("/contactResult/{num}/{userId}")
	public String contactResult(@PathVariable String num, @PathVariable String userId,
								@RequestParam HashMap<String, Object> map,
			 					HttpSession session, Model model) {
		
		ArrayList<BoardVO> lists = null;
		
		// 페이징 초기값
		int pageNum = Integer.parseInt(num) * 10;
		map.put("pageNum", pageNum);
		map.put("userId", userId);

		lists = boardService.selectContact(map);
		
		if(!lists.toString().equals("[]")) {
			// 페이징 계산
			int maxPageNum = (int)Math.ceil((double)lists.get(0).getRowCnt() / 10);
			
			model.addAttribute("lists", lists);
			model.addAttribute("maxCnt", lists.get(0).getRowCnt());
			model.addAttribute("maxPageNum", maxPageNum);
			session.setAttribute("flag", num);
		} else {
			model.addAttribute("maxPageNum", 0);
		}
		
		return "subPage/contactResult";
	}
	
	// 문의내역 세부화면 가기
	@RequestMapping("/contactDetail/{boardId}")
	public String viewContactDetail(@PathVariable String boardId, Model model) {
		BoardVO vo = boardService.contactDetailView(boardId);
		CommentVO cvo = boardService.selectAdminComment(boardId);
		
		model.addAttribute("notice", vo);
		model.addAttribute("answer", cvo);
		
		return "subPage/contactDetail";
	}
	
	// 문의내역 저장
	@ResponseBody
	@RequestMapping("/updateContact")
	public String updateContact(@RequestParam("uploadFile") MultipartFile file,
								@RequestParam HashMap<String, Object> map) throws IOException {

		String userName = (String)map.get("userName");

		// 1. 파일 저장 경로 설정 : 실제 서비스 되는 위치(프로젝트 외부에 저장)
		String uploadPath = apiController.uploadPathFile();
		// c:대소문자 상관없으며 마지막에 '/' 있어야 한다
				
		// 2. 원본 파일 이름 설정
		String originalFileName = file.getOriginalFilename();

		// 3. 파일 이름이 중복되지 않도록 파일 이름 변경
			
		// 사용자명과 조합하여 파일명 생성
		String savedFileName = userName + "_" + originalFileName;

		// 4. 파일 생성
		File newFile = new File(uploadPath + savedFileName);
		
		if(!originalFileName.equals("")) {
			// 5. 서버로 전송
			file.transferTo(newFile);
			
			// 6. DB에 저장
			map.put("chkFile", savedFileName);
		} else map.put("chkFile", "");
		
		boardService.updateContact(map);
		
		return "SUCCESS";
	}
}
