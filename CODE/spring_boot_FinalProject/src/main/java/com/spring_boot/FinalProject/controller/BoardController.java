package com.spring_boot.FinalProject.controller;

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

import com.spring_boot.FinalProject.model.BoardVO;
import com.spring_boot.FinalProject.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
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
		
		// 페이징 계산
		int maxPageNum = (int)Math.ceil((double)lists.get(0).getRowCnt() / 10);
		
		model.addAttribute("lists", lists);
		model.addAttribute("maxCnt", lists.get(0).getRowCnt());
		model.addAttribute("maxPageNum", maxPageNum);

		model.addAttribute("chk_search", map.get("chk_search"));
		model.addAttribute("text_search", map.get("text_search"));		
		
		session.setAttribute("flag", num);
		
		return "subPage/notice";
	}
	
	@ResponseBody
	@RequestMapping("/insertContact")
	public String insertContact(@RequestParam HashMap<String, Object> map) {
		String userId = (String)map.get("userId");
		String title = (String)map.get("title");
		String contents = (String)map.get("contents");
		String chkEmail = (String)map.get("chkEmail");
		String chkImg = (String)map.get("chkImg");
		
		System.out.println(userId);
		
		BoardVO vo = new BoardVO();
		vo.setUserId(userId);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setChkEmail(chkEmail);
		vo.setChkImg(chkImg);
		
		boardService.insertContact(vo);
		
		return "SUCCESS";
	}
}
