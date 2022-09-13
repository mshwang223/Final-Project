<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 양식다시제출 제거 -->
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/board.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/contact.css"/>">
		<script src="<c:url value="/js/contact.js"/>"></script>
	</head>
	
	<body>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
			
		<section class="wrap">
			<!-- 문의하기 레이아웃 시작 -->
			<article class="contactBox">
				<div class="pageTitle">
					<div>
						<span>#문의등록</span>
					</div>
				</div>
				<div class="contact-menu">
					<a href="<c:url value='/contact'/>">문의등록</a>
					<a href="<c:url value='/contactResult/0/${sessionScope.sid}'/>">문의 조회</a>
					<div class="underline"></div>	
				</div>
				<form id="frmContact" class="table-box">
					<div>
						<p>문의하시기 전에 FAQ 관련 내용을 확인해보세요.</p>
						<p>가능한 빠른 시간 내 답변하도록 노력하겠습니다.</p>
						<input type="hidden" id="userId" name="userId" value="<c:url value='${sessionScope.sid}'/>">
						<input type="hidden" name="userName" value="<c:url value='${sessionScope.userName}'/>">
					</div>
					
					<!-- 상단 테이블 -->
					<table>
						<tbody>
						    <tr>
						      	<td>문의제목<em></em></td>
						      	<td class="contents-box">
						      		<input id="title" name="title" type="text" maxlength="50" placeholder="문의 제목을 입력해 주세요." required/>
						      		<span class="span-title">문의 제목을 입력해 주세요.</span>
						      		<div class="text-count cntTitle"><span id="cntTitle">0</span> / 50</div>
						      	</td>
						    </tr>
						<tbody>
					</table>
					
					<!-- 중단 textarea 구간 -->	    
					<div class="layout-contents">
						<div>문의내용<em></em></div>
						<div class="contents-box">
							<textarea id="contents" name="contents" maxlength="500" placeholder="문의 내용을 입력해 주세요." required></textarea>
						    <span class="span-contents">문의 내용을 입력해 주세요.</span>
						    <div class="text-count cntContents"><span id="cntContents">0</span> / 500</div>						      	
						</div>
					</div>
					
					<!-- 하단 테이블 -->
					<table>
						<tbody>	    
						    <tr>
						      	<td class="title-email">답변메일</td>
						      	<td class="contents-email">
						      		<div>
							      		<div>
							      			<input type="checkbox" id="chkEmail" name="chkEmail">&nbsp;&nbsp;받음
							      		</div>
							      		<span>등록된 이메일로 답변메일을 받으실 수 있습니다.</span>
						      		</div>
						      		<div class="confirm-email"></div>
								</td>
						    </tr>
						    <tr class="tr-file">
						      	<td class="title-img">첨부파일</td>
						      	<td>
								    <div class="btn_img_box">
								    	<input type="file" id="uploadFile" name="uploadFile" style="display:none"/>
								    	<button type="button" id="btn_img_done" class="btn_img_done">파일찾기</button>
								    </div>
								    
								    <div class="file-box">
								    	<div id="escFile">
								    		<i class="fa-solid fa-circle-xmark"></i>
								    	</div>
								    	<div id="fileName"></div>
								    </div>
						      	</td>
						    </tr>
						</tbody>
					</table>
					<div class="bottom_line">
					</div>
					<div class="btn_list_box">
				    	<button type="button" class="btn_reset">취소</button>
				    	<button type="submit" class="btn_done">등록</button>
				    </div>
				</form>
			</article>
			<!-- 문의하기 레이아웃 종료 -->
		<div id="chatbotBox" class="chatbot_box">
			<div class="chat_head">
				<span class="chat_title">펫밀리 쳇봇입니다</span>
				<span id="btnClose" class="close_btn"><i class="fa-solid fa-xmark btn_x"></i></span>			
			</div>
			<!-- 채팅내용 출력 영역 -->
			<div id="chattingBox" class="chatting_box"></div>
			<div>
				<form class="chat_form" id="chatForm" name="chatForm">
					<input type="text" class="input_message" id="message" name="message" size="30"  placeholder="궁금한 사항을 물어봐주세요"/>
					<input type="submit" class="send_text" value="전송">
				</form>
			</div>
		</div>
		<img id="chatBot" class="chat_bot" src="<c:url value='/images/chatbot.png'/>">
			<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>