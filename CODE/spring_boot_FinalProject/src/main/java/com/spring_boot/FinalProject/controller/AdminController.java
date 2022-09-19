package com.spring_boot.FinalProject.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
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
import com.spring_boot.FinalProject.model.CommentVO;
import com.spring_boot.FinalProject.model.FacilityVO;
import com.spring_boot.FinalProject.model.InsertHotelVO;
import com.spring_boot.FinalProject.model.OrderVO;
import com.spring_boot.FinalProject.model.OutuserVO;
import com.spring_boot.FinalProject.model.PetVO;
import com.spring_boot.FinalProject.model.ServiceVO;
import com.spring_boot.FinalProject.model.UserVO;
import com.spring_boot.FinalProject.service.BoardService;
import com.spring_boot.FinalProject.service.HotelService;
import com.spring_boot.FinalProject.service.UnzipService;
import com.spring_boot.FinalProject.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	HotelService hotelService;
	
	@Autowired
	APIController apiController;
	
	@Autowired
	UnzipService unzipService;
	
	// 관리자 - 공지사항 페이지
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
	
	// 관리자 - 공지사항 세부화면 페이지
	@RequestMapping("/adminNoticeDetail/{boardId}")
	public String viewAdminNoticeDetail(@PathVariable String boardId, Model model) {
		BoardVO vo = boardService.noticeDetailView(boardId);
			
		model.addAttribute("notice", vo);
		
		return "subPage/adminNoticeDetail";
	}
	
	// 관리자 - 공지사항 수정
	@ResponseBody
	@RequestMapping("/adminUpdateNotice")
	public String updateAdminNotice(@RequestParam HashMap<String, Object> map) {

		boardService.updateAdminNotice(map);
		
		return "SUCCESS";
	}
	
	// 관리자 - 공지사항 신규생성 페이지
	@RequestMapping("/adminNoticeNew")
	public String viewAdminNoticeNew() {
		return "subPage/adminNoticeNew";
	}
	
	// 관리자 - 공지사항 입력
	@ResponseBody
	@RequestMapping("/adminInsertNotice")
	public String updateAdminInsertNotice(@RequestParam HashMap<String, Object> map,
										  HttpSession session) {
		String sid = (String)session.getAttribute("sid");
		map.put("userId", sid);
		
		boardService.insertAdminNotice(map);
		
		return "SUCCESS";
	}
	
	// 관리자 - 공지사항 삭제
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
	
	// 관리자 - 사용자관리 세부화면 페이지
	@RequestMapping("/adminUserDetail/{userId}")
	public String viewAdminUserDetail(@PathVariable String userId, Model model) {
		UserVO vo = userService.selectUser(userId);
		
		PetVO pvo = userService.selectAdminPetUser(userId);
			
		model.addAttribute("user", vo);
		model.addAttribute("pet", pvo);
		
		return "subPage/adminUserDetail";
	}
	
	// 관리자 - 사용자관리 세부화면 수정
	@ResponseBody
	@RequestMapping("/adminUpdateUser")
	public String updateAdminUser(@RequestParam HashMap<String, Object> map) {
		
		userService.updateAdminUser(map);
		
		return "SUCCESS";
	}
	
	// 관리자 - 문의내역 페이지
	@RequestMapping("/adminContactSearch/{num}")
	public String adminContactSearch(@PathVariable String num, 
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
		
		String chkAnswer = (String)map.get("chkAnswer");
		if(chkAnswer == null || chkAnswer.equals("")) {
			map.put("chkYN", '%');
		} else if(chkAnswer.equals("0"))
			map.put("chkYN", '0');
		else
			map.put("chkYN", '1');
		
		ArrayList<BoardVO> lists = null;

		// 페이징 초기값
		int pageNum = Integer.parseInt(num) * 10;
		map.put("pageNum", pageNum);
		
		if(chk_search == 0) {	// 검색 조건 전체
			if(text_search.equals("") || text_search.length() == 0) {
				map.put("userId", "%");
				map.put("userName", "%");
				map.put("modifyDate", "%");
			} else {
				// 조건 필요
				try {
					String rullDate = text_search.replaceAll("[/.-]", "");
					LocalDate modifyDate = LocalDate.parse(rullDate, DateTimeFormatter.ofPattern("yyyyMMdd"));
					map.put("modifyDate", modifyDate);
				} catch (DateTimeParseException e) {
					map.put("userId", text_search);
					map.put("userName", text_search);
				}
			}
			
			lists = boardService.selectAdminContact(map);
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
					map.put("modifyDate", "%");
				else
					map.put("modifyDate", text_search);
			}
			lists = boardService.selectAdminContact(map);
		}

		if(!lists.toString().equals("[]")) {
		
			// 페이징 계산
			int maxPageNum = (int)Math.ceil((double)lists.get(0).getRowCnt() / 10);
	
			
			model.addAttribute("lists", lists);
			model.addAttribute("maxCnt", lists.get(0).getRowCnt());
			model.addAttribute("maxPageNum", maxPageNum);
	
			model.addAttribute("chk_search", map.get("chk_search"));
			model.addAttribute("text_search", map.get("text_search"));		
			model.addAttribute("chkAnswer", map.get("chkAnswer"));	
			
			session.setAttribute("flag", num);
		} else {
			model.addAttribute("maxPageNum", 0);
		}
		return "subPage/adminContact";
	}
	
	// 관리자 - 문의내역 세부화면 페이지
	@RequestMapping("/adminContactDetail/{boardId}")
	public String viewAdminContactDetail(@PathVariable String boardId, 
										 HashMap<String, Object> map, Model model) {
		
		map.put("boardId", boardId);
		
		BoardVO vo = boardService.contactDetailView(boardId);
		CommentVO cvo = boardService.selectAdminComment(boardId);
		String email = boardService.contactEmail(boardId);
		
		model.addAttribute("notice", vo);
		model.addAttribute("answer", cvo);
		model.addAttribute("userEmail", email);
		
		return "subPage/adminContactDetail";
	}
	
	// 관리자 - 문의내역 답변 저장
	@ResponseBody
	@RequestMapping("/adminSaveContact")
	public String adminSaveContact(@RequestParam HashMap<String, Object> map,
								   HttpSession session) {
		String chkInUp = (String)map.get("chkInUp");
		String userId = (String)session.getAttribute("sid");
		
		map.put("userId", userId);
				
		if(chkInUp.equals("Insert")) {	// 신규 작성
			boardService.updateCheckYN((String)map.get("boardId"));
			boardService.insertAdminContact(map);
			return "INSERT";
		} else {	// 수정
			boardService.updateAdminContact(map);
			return "UPDATE";
		}
	}
	
	// 관리자 - 결제내역 페이지
	@RequestMapping("/adminPaySearch/{num}")
	public String adminPaySearch(@PathVariable String num, 
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
		
		ArrayList<OrderVO> lists = null;
		
		
		// 페이징 초기값
		int pageNum = Integer.parseInt(num) * 10;
		map.put("pageNum", pageNum);
		
		if(chk_search == 0) {	// 검색 조건 전체
			if(text_search.equals("") || text_search.length() == 0) {
				map.put("userId", "%");
				map.put("userName", "%");
				map.put("payDate", "%");
			} else {
				// 조건 필요
				try {
					String rullDate = text_search.replaceAll("[/.-]", "");
					LocalDate payDate = LocalDate.parse(rullDate, DateTimeFormatter.ofPattern("yyyyMMdd"));
					map.put("payDate", payDate);
				} catch (DateTimeParseException e) {
					map.put("userId", text_search);
					map.put("userName", text_search);
				}
			}
			
			lists = boardService.selectAdminPay(map);
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
					map.put("payDate", "%");
				else
					map.put("payDate", text_search);
			} 
			lists = boardService.selectAdminPay(map);
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
		return "subPage/adminPay";
	}
	
	// 관리자 - 결제내역 세부화면 페이지
	@RequestMapping("/adminPayDetail/{ordNo}")
	public String viewAdminPayDetail(@PathVariable String ordNo, Model model) {
		
		OrderVO vo = boardService.payDetailView(ordNo);
		
		model.addAttribute("pay", vo);
		
		return "subPage/adminPayDetail";
	}
	
	// 관리자 - 결재내역 삭제
	@ResponseBody
	@RequestMapping("/adminDeletePay")
	public String adminDeletePay(@RequestParam("ordNos") String ordNos,
								 HashMap<String, Object> map) {
		String[] arrOrdNos = ordNos.replaceAll("[^0-9,]", "").split(",");
		
		map.put("ordNos", arrOrdNos);
		
		boardService.deleteAdminPay(map);
		
		return "SUCCESS";
	}
	
	// 관리자 - 탈퇴회원 페이지
	@RequestMapping("/adminOutSearch/{num}")
	public String adminOutSearch(@PathVariable String num, 
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
		
		ArrayList<OutuserVO> lists = null;
		
		
		// 페이징 초기값
		int pageNum = Integer.parseInt(num) * 10;
		map.put("pageNum", pageNum);
		
		if(chk_search == 0) {	// 검색 조건 전체
			if(text_search.equals("") || text_search.length() == 0) {
				map.put("userId", "%");
				map.put("userName", "%");
				map.put("levDate", "%");
			} else {
				// 조건 필요
				try {
					String rullDate = text_search.replaceAll("[/.-]", "");
					LocalDate levDate = LocalDate.parse(rullDate, DateTimeFormatter.ofPattern("yyyyMMdd"));
					map.put("levDate", levDate);
				} catch (DateTimeParseException e) {
					map.put("userId", text_search);
					map.put("userName", text_search);
				}
			}
			
			lists = boardService.selectOutUser(map);
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
					map.put("levDate", "%");
				else
					map.put("levDate", text_search);
			}
			lists = boardService.selectOutUser(map);
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
		return "subPage/adminOut";
	}
	
	// 관리자 - 탈퇴회원 삭제
	@ResponseBody
	@RequestMapping("/adminDeleteOut")
	public String adminDeleteOut(@RequestParam("levIds") String levIds,
								 HashMap<String, Object> map) {
		
		String[] arrLevIds = levIds.replaceAll("[^0-9,]", "").split(",");
		
		map.put("levIds", arrLevIds);
		
		boardService.deleteAdminOut(map);
		
		return "SUCCESS";
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
		model.addAttribute("roomType", vo.getRoomType());
		
		// 업체등록 이미지 압축파일 해제
		// 호텔 압축파일명
		String fileImg = hotelService.selectInsertHotelImg(regId);
			  
		// zip 파일 경로 
		String directory = apiController.uploadCompanyPathImg();
		
		// 파일 압축 해제           
		unzipService.unZip(directory, fileImg, directory);	
		model.addAttribute("fileImg", fileImg);
		
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
		
		
		return "redirect:/adminInsertHotel/0";
	}
	
	// 관리자 - 서비스 페이지
	@RequestMapping("/adminServiceSearch/{num}")
	public String adminServiceSearch(@PathVariable String num, 
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

		
		ArrayList<ServiceVO> lists = null;
		
		// 페이징 초기값
		int pageNum = Integer.parseInt(num) * 10;
		map.put("pageNum", pageNum);
		
		if(chk_search == 0) {	// 검색 조건 전체
			if(text_search.equals("") || text_search.length() == 0) {
				map.put("serviceSort", "%");
				map.put("serviceName", "%");
			} else {
				map.put("serviceSort", text_search);
				map.put("serviceName", text_search);
			}
			
			lists = boardService.selectServiceOR(map);
		} else {
			if(chk_search == 1) {	// 검색 조건 제목
				if(text_search.equals("") || text_search.length() == 0)
					map.put("serviceSort", "%");
				else
					map.put("serviceSort", text_search);
				
				map.put("serviceName", "%");
			} else {	// 검색 조건 내용
				if(text_search.equals("") || text_search.length() == 0)
					map.put("serviceName", "%");
				else
					map.put("serviceName", text_search);
				
				map.put("serviceSort", "%");				
			}
			lists = boardService.selectService(map);
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
		return "subPage/adminService";
	}
	
	// 관리자 - 서비스 신규생성 페이지
	@RequestMapping("/adminServiceNew")
	public String viewAdminServiceNew() {
		return "subPage/adminServiceNew";
	}
	
	// 관리자 - 서비스 입력
	@ResponseBody
	@RequestMapping("/adminInsertService")
	public String adminInsertService(@RequestParam HashMap<String, Object> map,
									 HttpSession session) throws IOException {
		boardService.insertAdminService(map);
		
		return "SUCCESS";
	}
	
	// 관리자 - 서비스 삭제
	@ResponseBody
	@RequestMapping("/adminDeleteService")
	public String adminDeleteService(@RequestParam("serviceIds") String serviceIds,
									HashMap<String, Object> map) {
		
		String[] arrServiceId = serviceIds.replaceAll("[^0-9,]", "").split(",");
		
		map.put("serviceIds", arrServiceId);
		
		boardService.deleteAdminService(map);
		
		return "SUCCESS";
	}
	
	// 관리자 - 서비스 세부화면 페이지
	@RequestMapping("/adminServiceDetail/{serviceId}")
	public String viewAdminServiceDetail(@PathVariable String serviceId, Model model) {
		ServiceVO vo = boardService.serviceDetailView(serviceId);
			
		model.addAttribute("service", vo);
		
		return "subPage/adminServiceDetail";
	}
	
	// 관리자 - 서비스 세부화면 수정
	@ResponseBody
	@RequestMapping("/adminUpdateService")
	public String updateAdminUpdateService(@RequestParam HashMap<String, Object> map) {

		boardService.updateAdminService(map);
		
		return "SUCCESS";
	}
	
	// 관리자 - 시설 페이지
	@RequestMapping("/adminFacilitySearch/{num}")
	public String adminFacilitySearch(@PathVariable String num, 
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

		
		ArrayList<FacilityVO> lists = null;
		
		// 페이징 초기값
		int pageNum = Integer.parseInt(num) * 10;
		map.put("pageNum", pageNum);
		
		if(chk_search == 0) {	// 검색 조건 전체
			if(text_search.equals("") || text_search.length() == 0) {
				map.put("facilitySort", "%");
				map.put("facilityName", "%");
			} else {
				map.put("facilitySort", text_search);
				map.put("facilityName", text_search);
			}
			
			lists = boardService.selectFacilityOR(map);
		} else {
			if(chk_search == 1) {	// 검색 조건 제목
				if(text_search.equals("") || text_search.length() == 0)
					map.put("facilitySort", "%");
				else
					map.put("facilitySort", text_search);
				
				map.put("facilityName", "%");
			} else {	// 검색 조건 내용
				if(text_search.equals("") || text_search.length() == 0)
					map.put("facilityName", "%");
				else
					map.put("facilityName", text_search);
				
				map.put("facilitySort", "%");				
			}
			lists = boardService.selectFacility(map);
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
		return "subPage/adminFacility";
	}
	
	// 관리자 - 시설 신규생성 페이지
	@RequestMapping("/adminFacilityNew")
	public String viewAdminFacilityNew() {
		return "subPage/adminFacilityNew";
	}
	
	// 관리자 - 시설 입력
	@ResponseBody
	@RequestMapping("/adminInsertFacility")
	public String adminInsertFacility(@RequestParam HashMap<String, Object> map,
									 HttpSession session) throws IOException {
		boardService.insertAdminFacility(map);
		
		return "SUCCESS";
	}
	
	// 관리자 - 시설 삭제
	@ResponseBody
	@RequestMapping("/adminDeleteFacility")
	public String adminDeleteFacility(@RequestParam("facilityIds") String facilityIds,
									HashMap<String, Object> map) {
		
		String[] arrFacilityId = facilityIds.replaceAll("[^0-9,]", "").split(",");
		
		map.put("facilityIds", arrFacilityId);
		
		boardService.deleteAdminFacility(map);
		
		return "SUCCESS";
	}
	
	// 관리자 - 시설 세부화면 페이지
	@RequestMapping("/adminFacilityDetail/{facilityId}")
	public String viewAdminFacilityDetail(@PathVariable String facilityId, Model model) {
		FacilityVO vo = boardService.facilityDetailView(facilityId);
			
		model.addAttribute("facility", vo);
		
		return "subPage/adminFacilityDetail";
	}
	
	// 관리자 - 시설 세부화면 수정
	@ResponseBody
	@RequestMapping("/adminUpdateFacility")
	public String updateAdminUpdateFacility(@RequestParam HashMap<String, Object> map) {
		
		boardService.updateAdminFacility(map);
		
		return "SUCCESS";
	}
	
	// 관리자 - 펫등록증 페이지
	@RequestMapping("/adminPetSearch/{num}")
	public String adminPetSearch(@PathVariable String num, 
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

		
		ArrayList<PetVO> lists = null;
		
		// 페이징 초기값
		int pageNum = Integer.parseInt(num) * 10;
		map.put("pageNum", pageNum);
		
		if(chk_search == 0) {	// 검색 조건 전체
			if(text_search.equals("") || text_search.length() == 0) {
				map.put("userId", "%");
				map.put("userName", "%");
			} else {
				map.put("userId", text_search);
				map.put("userName", text_search);
			}
			
			lists = boardService.selectPetOR(map);
		} else {
			if(chk_search == 1) {	// 검색 조건 제목
				if(text_search.equals("") || text_search.length() == 0)
					map.put("userId", "%");
				else
					map.put("userId", text_search);
				
				map.put("userName", "%");
			} else {	// 검색 조건 내용
				if(text_search.equals("") || text_search.length() == 0)
					map.put("userName", "%");
				else
					map.put("userName", text_search);
				
				map.put("userId", "%");				
			}
			lists = boardService.selectPet(map);
		}

		if(!lists.toString().equals("[]")) {
			
			// 펫코드 암호화 처리
			for(PetVO list : lists) {
				String petCode = list.getPetCode();
				StringBuilder sb = new StringBuilder(petCode);
				
				sb.replace(6, 11, "*****");
				sb.replace(12, 17, "*****");
				
				list.setPetCode(sb.toString());
			}
		
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
		return "subPage/adminPet";
	}
	
	// 관리자 - 펫등록증 삭제
	@ResponseBody
	@RequestMapping("/adminDeletePet")
	public String adminDeletePet(@RequestParam("petIds") String petIds,
									HashMap<String, Object> map) {
		
		String[] arrPetId = petIds.replaceAll("[^0-9,]", "").split(",");
		
		map.put("petIds", arrPetId);
		
		boardService.deleteAdminPet(map);
		
		return "SUCCESS";
	}
	
	// 관리자 - 펫등록증 연장
	@ResponseBody
	@RequestMapping("/adminExtendPet")
	public String extendAdminPet(@RequestParam("petId") String petId) {
		
		boardService.extendAdminPet(petId);
		
		String petCode = userService.selectPetCode(petId);
		
		return petCode;
	}
	
	
	// 관리자-업체관리 조회
	@RequestMapping("/adminInsertHotel/{num}")
	public String adminInsertHotel(@PathVariable String num, 
							   @RequestParam HashMap<String, Object> map, 
							   HttpSession session, Model model) {
		
		String text_search = "";	

		if(map.get("text_search") == null) 
			text_search = "";
		else
			text_search = (String)map.get("text_search");
		
		System.out.println(text_search);
		
		ArrayList<InsertHotelVO> lists = null;
		
		// 페이징 초기값
		int pageNum = Integer.parseInt(num) * 10;
		map.put("pageNum", pageNum);
		
	
		if(text_search.equals("") || text_search.length() == 0) {
			map.put("title", "%");
		} else {
			map.put("title", text_search);
		}
		
		lists = boardService.selectRegistration(map);
			

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
		return "subPage/adminInsertHotel";
	}
	
	@ResponseBody
	@RequestMapping("/adminRegDelete")
	public String deleteReg(@RequestParam("regIds") String regIds, HashMap<String, Object> map) {
		
		String[] regList = regIds.replaceAll("[^0-9,]", "").split(",");
		
		map.put("regIds", regList);
		
		boardService.deleteAdminReg(map);
		
		
		return "SUCCESS";
	}
}
