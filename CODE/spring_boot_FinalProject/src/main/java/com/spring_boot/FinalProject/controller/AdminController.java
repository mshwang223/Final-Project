package com.spring_boot.FinalProject.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot.FinalProject.model.BoardVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.service.BoardService;

@Controller
public class AdminController {
	
	@Autowired
	BoardService boardService;
	
	// 관리자 페이지
	@RequestMapping("/adminNoticeSearch/{num}")
	public String adminNoticeSearch(@PathVariable String num, 
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
		return "subPage/admin";
	}
	
	// 관리자-공지사항 세부화면 페이지
	@RequestMapping("/adminNoticeDetail/{boardId}")
	public String viewAdminNoticeDetail(@PathVariable String boardId, Model model) {
		BoardVO vo = boardService.noticeDetailView(boardId);
			
		model.addAttribute("notice", vo);
		
		return "subPage/adminNoticeDetail";
	}
	
	// 관리자-공지사항 수정
	@ResponseBody
	@RequestMapping("/adminUpdateNotice")
	public String updateAdminNotice(@RequestParam HashMap<String, Object> map) throws IOException {

		boardService.updateAdminNotice(map);
		
		return "SUCCESS";
	}
	
	// 관리자-공지사항 신규생성 페이지
	@RequestMapping("/adminNoticeNew")
	public String viewAdminNoticeNew() {
		return "subPage/adminNoticeNew";
	}
	
	// 관리자-공지사항 입력
	@ResponseBody
	@RequestMapping("/adminInsertNotice")
	public String updateAdminInsertNotice(@RequestParam HashMap<String, Object> map,
										  HttpSession session) throws IOException {
		String sid = (String)session.getAttribute("sid");
		map.put("userId", sid);
		
		boardService.insertAdminNotice(map);
		
		return "SUCCESS";
	}
	
	// 관리자-업체관리 조회
	@RequestMapping("/adminInsertHotel")
	public String viewAdminInsertHotel(Model model) {
		
		ArrayList <InsertHotelVO> regList = boardService.selectRegistration();
		model.addAttribute("regList", regList);
		
		return "subPage/adminInsertHotel";
	}	
	
	// 관리자-업체관리 세부화면 페이지
	@RequestMapping("/adminInsertDetail/{regId}")
	public String viewAdminInsertDetail(@PathVariable int regId, Model model) {
		
		InsertHotelVO vo = boardService.detailRegistration(regId);
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
		boardService.approveHotel((String) map.get("name"), (String) map.get("approve"));
		
		ArrayList <InsertHotelVO> regList = boardService.selectRegistration();
		model.addAttribute("regList", regList);
		
		return "subPage/adminInsertHotel";
	}
	
	
}
