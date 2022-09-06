package com.spring_boot.FinalProject.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot.FinalProject.model.BoardVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.UserVO;
import com.spring_boot.FinalProject.service.BoardService;
import com.spring_boot.FinalProject.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	UserService userService;
	
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
	
	// 관리자-공지사항 삭제
	@ResponseBody
	@RequestMapping("/adminDeleteNotice")
	public String adminDeleteNotice(@RequestParam("boardIds") String boardIds,
									HashMap<String, Object> map) {
		
		String[] arrBoardId = boardIds.replaceAll("[^0-9,]", "").split(",");
		
		map.put("boardIds", arrBoardId);
		
		boardService.deleteAdminNotice(map);
		
		return "SUCCESS";
	}

	// 관리자 - 사용자관리 페이지
	@RequestMapping("/adminUserSearch/{num}")
	public String adminUserSearch(@PathVariable String num, 
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
		
		ArrayList<UserVO> lists = null;
		
		
		// 페이징 초기값
		int pageNum = Integer.parseInt(num) * 10;
		map.put("pageNum", pageNum);
		
		if(chk_search == 0) {	// 검색 조건 전체
			if(text_search.equals("") || text_search.length() == 0) {
				map.put("userId", "%");
				map.put("userName", "%");
				map.put("activeDate", "%");
			} else {
				// 조건 필요
				try {
					String rullDate = text_search.replaceAll("[/.-]", "");
					LocalDate activedate = LocalDate.parse(rullDate, DateTimeFormatter.ofPattern("yyyyMMdd"));
					map.put("activeDate", activedate);
				} catch (DateTimeParseException e) {
					map.put("userId", text_search);
					map.put("userName", text_search);
				}
			}
			
			lists = boardService.selectAdminUser(map);
		} else {
			if(chk_search == 1) {	// 검색 조건 ID
				if(text_search.equals("") || text_search.length() == 0)
					map.put("userId", "%");
				else
					map.put("userId", text_search);

			} else if(chk_search == 2) {	// 검색 조건 이름
				if(text_search.equals("") || text_search.length() == 0)
					map.put("userName", "%");
				else
					map.put("userName", text_search);
			} else {	// 검색 조건 접속일자
				if(text_search.equals("") || text_search.length() == 0)
					map.put("activeDate", "%");
				else
					map.put("activeDate", text_search);
			}
			lists = boardService.selectAdminUser(map);
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
		return "subPage/adminUser";
	}
	
	// 관리자-사용자관리 세부화면 페이지
	@RequestMapping("/adminUserDetail/{userId}")
	public String viewAdminUserDetail(@PathVariable String userId, Model model) {
		UserVO vo = userService.selectUser(userId);
			
		model.addAttribute("user", vo);
		
		return "subPage/adminUserDetail";
	}
	
	// 관리자-사용자관리 세부화면 수정
	@ResponseBody
	@RequestMapping("/adminUpdateUser")
	public String updateAdminUser(@RequestParam HashMap<String, Object> map) {
		
		userService.updateAdminUser(map);
		
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
	public String viewAdminInsertDetail(@PathVariable int regId, String serviceImg, Model model) {
		
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
		
		  // zip 파일
		  File zipFile = new File("c:/springWorkspace/comImg/"+ serviceImg + ".zip");
		  //log.debug("zipFile.exist : {}", zipFile.exists());
		  
		  // 압축해제 경로
		  File unzipFolder = new File(zipFile.getParent(), zipFile.getName().replace(".zip", "serviceImg"));
		  //log.debug("unzipFolder : {}", unzipFolder.getAbsolutePath() + "\n");
		  
		  // 존재 하지 않으면 디렉토리 만들기
		  if(unzipFolder.exists() == false) unzipFolder.mkdirs();
		  
		 // log.debug("############# unzip begin #############");
		  
		  try (
		    // zip 파일 읽어오기
		    FileInputStream fis = new FileInputStream(zipFile);
		    ZipInputStream zis = new ZipInputStream(fis);
		    BufferedInputStream bis = new BufferedInputStream(zis);
		  ) {
		    ZipEntry zipEntry = null;
		    while ((zipEntry = zis.getNextEntry()) != null) {
		      File f = new File(unzipFolder.getAbsolutePath(), zipEntry.getName());
		      if (zipEntry.isDirectory()) { // entry가 디렉토리일 경우 생성
		        //log.debug("── onlyDirectory : {}", zipEntry.getName());
		        //log.debug("└── mkdirs :{}", f.mkdirs());
		      } else {
		       // log.debug("── fileName : {}", zipEntry.getName());
		        if (f.getParentFile().exists() == false) { // entry의 부모 디렉토리가 없을 경우
		        //  log.debug("└── makeParentDirectory : {}", zipEntry.getName().substring(0, zipEntry.getName().lastIndexOf("/")));
		          f.getParentFile().mkdirs();
		        }
		        try (
		          FileOutputStream fos = new FileOutputStream(f);
		          BufferedOutputStream bos = new BufferedOutputStream(fos);
		        ) {
		          int b = 0;
		          while ((b = bis.read()) != -1) {
		            bos.flush();
		            bos.write(b);
		          }
		        }
		      }
		    }
		  } catch (IOException e) {
		    e.printStackTrace();
		  }
		
		return "subPage/adminInsertDetail";
	}	
	
	// 업체등록 이미지 압축파일 해제
	@RequestMapping("unZipFile/{serviceImg}")
	public void unZipFile(@PathVariable String serviceImg) {
		  
	}
	
	// 등록숙박 승인
	@RequestMapping("/adminApproveHotel")
	public String adminApproveHotel(@RequestParam HashMap<String, Object> map, Model model) {
		boardService.approveHotel((String) map.get("name"), (String) map.get("approve"));
		
		ArrayList <InsertHotelVO> regList = boardService.selectRegistration();
		model.addAttribute("regList", regList);
		
		return "subPage/adminInsertHotel";
	}
	
	
}
