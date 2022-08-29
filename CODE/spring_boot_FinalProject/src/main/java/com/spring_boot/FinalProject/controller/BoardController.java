package com.spring_boot.FinalProject.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot.FinalProject.model.BoardVO;
import com.spring_boot.FinalProject.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	// 공지사항 검색
	@RequestMapping("/noticeSearch")
	public String noticeSearch(@RequestParam HashMap<String, Object> map, Model model) {
		
		int chk_search = Integer.parseInt((String)map.get("chk_search"));
		String text_search = (String)map.get("text_search");
		
		ArrayList<BoardVO> lists = null;
		
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
		
		model.addAttribute("lists", lists);
		
		return "/subPage/notice";
	}
}
