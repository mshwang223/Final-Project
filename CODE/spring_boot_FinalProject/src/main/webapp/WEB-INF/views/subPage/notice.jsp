<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/notice.css"/>">
		<script src="<c:url value="/js/notice.js"/>"></script>
	</head>
	
	<body>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		
		<section class="wrap">
			<!-- 공지사항 레이아웃 시작 -->
			<article class="noticeBox">
				<div class="pageTitle">
					<div>
						<span>#공지사항</span>
					</div>
				</div>
				<form method="post" id="userFrm" class="userFrm" name="userFrm" action="<c:url value="/noticeSearch/0"/>">
					<table class="search-table">
						<tr>
							<td>
								<c:if test="${maxPageNum ne 0}">
									<div class="blue">총 ${maxCnt}</div>
								</c:if>	
							</td>
							<td>
								<div id="dropdown-box" class="dropdown-box">
									<div id="dpBox-name" class="dpBox-name">전체</div>
									
									<c:if test="${empty chk_search}">
										<input type="hidden" id="chk_search" name="chk_search" value="0" />
									</c:if>
									
									<c:if test="${not empty chk_search}">
										<input type="hidden" id="chk_search" name="chk_search" value="${chk_search}" />
									</c:if>
									
									<div class="dpBox-div">▼</div>
								</div>
								<ul class="dropdown-contents">
									<li class="dp-all">전체</li>
									<li class="dp-title">제목</li>
									<li class="dp-contents">내용</li>
								</ul>
								<div class="search-box">
									<div>
										<input type="text" id="text_search" name="text_search" class="text_search" value="${text_search}" placeholder="검색어를 입력하세요.">
										<button class="search-button"><img src="<c:url value="/images/search.png"/>"></button>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
				<div class="table-box">
					<table>
						<thead>
							<tr>
						      	<th class="num">번호</th>
						      	<th>제목</th>
						     	<th class="author">작성자</th>
						      	<th class="date">작성일</th>
						    </tr>
						</thead>
						<tbody>
							<c:if test="${maxPageNum eq 0}">
								<tr>
									<td colspan="4">내용이 없습니다.</td>
								</tr>							
							</c:if>
							<c:if test="${maxPageNum ne 0}">
								<c:forEach var="list" items="${lists}" varStatus="loop">
								    <tr>
								      	<td>${loop.count}</td>
								      	<td class="title"><a class="atxtUnderline" href="<c:url value="/noticeDetail/${list.boardId}"/>">${list.title}</a></td>
								      	<td>${list.userName}</td>
								      	<td><fmt:formatDate value="${list.modifyDate}" pattern="yyyy-MM-dd HH:mm:dd"/></td>
								    </tr>
							    </c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="paging-box">
					<input type="hidden" id="flag" value="${sessionScope.flag}" />
					<input type="hidden" id="maxPage" value="${maxPageNum}" />
					<ul>
						<c:if test="${maxPageNum ne 0}">
							<c:if test="${maxPageNum ne 1}">
								<li class="firstPager">
									<div title="첫 페이지로 이동하기">
										<<
									</div>
								</li>
								<li class="prevPager">
									<div title="이전 페이지로 이동하기">
										<
									</div>
								</li>
							</c:if>

							<c:forEach var="i" begin="1" end="${maxPageNum}">
							<li>
								<div class="active" value="${i}">${i}</div>
							</li>
							</c:forEach>
						
							<c:if test="${maxPageNum ne 1}">
								<li class="nextPager">
									<div title="다음 페이지로 이동하기">
										>
									</div>
								</li>
								<li class="lastPager">
									<div title="마지막 페이지로 이동하기">
										>>
									</div>
								</li>
							</c:if>
						</c:if>
					</ul>
				</div>
			</article>
			<!-- 공지사항 레이아웃 종료 -->
			
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