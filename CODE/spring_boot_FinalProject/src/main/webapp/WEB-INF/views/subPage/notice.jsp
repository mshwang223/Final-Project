<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
							<td><div class="blue">총 ${maxCnt}</div></td>
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
							<c:forEach var="list" items="${lists}" varStatus="loop">
						    <tr>
						      	<td>${loop.count}</td>
						      	<td class="title"><a href="<c:url value="/noticeDetail/${list.boardId}"/>">${list.title}</a></td>
						      	<td>${list.userName}</td>
						      	<td><fmt:formatDate value="${list.modifyDate}" pattern="yyyy-MM-dd HH:mm:dd"/></td>
						    </tr>
						    </c:forEach>
						</tbody>
					</table>
				</div>
				<div class="paging-box">
					<input type="hidden" id="flag" value="${sessionScope.flag}" />
					<input type="hidden" id="maxPage" value="${maxPageNum}" />
					<ul>
						<li class="firstPager">
							<a href="javascript:void(0)" title="첫 페이지로 이동하기">
								<<
							</a>
						</li>
						<li class="prevPager">
							<a href="javascript:void(0)" title="이전 페이지로 이동하기">
								<
							</a>
						</li>
						<c:forEach var="i" begin="1" end="${maxPageNum}">
						<li>
							<a href="javascript:void(0)" class="active">${i}</a>
						</li>
						</c:forEach>
						<li class="nextPager">
							<a href="javascript:void(0)" title="다음 페이지로 이동하기">
								>
							</a>
						</li>
						<li class="lastPager">
							<a href="javascript:void(0)" title="마지막 페이지로 이동하기">
								>>
							</a>
						</li>
					</ul>
				</div>
			</article>
			<!-- 공지사항 레이아웃 종료 -->
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>