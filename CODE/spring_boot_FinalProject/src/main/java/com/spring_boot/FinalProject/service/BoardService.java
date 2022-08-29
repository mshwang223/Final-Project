package com.spring_boot.FinalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.FinalProject.dao.IBoardDAO;
import com.spring_boot.FinalProject.model.BoardVO;


@Service
public class BoardService implements IBoardService {
	@Autowired
	@Qualifier("IBoardDAO")
	IBoardDAO dao;
	
	// 공지사항 조회기능(조건)
	@Override
	public ArrayList<BoardVO> selectNotice(HashMap<String, Object> map) {
		return dao.selectNotice(map);
	}
	
	// 공지사항 조회기능(전체)
	@Override
	public ArrayList<BoardVO> selectNoticeOR(HashMap<String, Object> map) {
		return dao.selectNoticeOR(map);
	}
}
