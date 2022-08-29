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
		
		<link rel="stylesheet" type="text/css" href="css/board.css">
		<link rel="stylesheet" type="text/css" href="css/notice.css">
		<script src="js/notice.js"></script>
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
				<form method="post" id="userFrm" class="userFrm" name="userFrm" action="<c:url value='/noticeSearch'/>">
					<table class="search-table">
						<tr>
							<td></td>
							<td>
								<div id="dropdown-box" class="dropdown-box">
									<div id="dpBox-name" class="dpBox-name">전체</div>
									<input type="hidden" id="chk_search" name="chk_search" value="0" />
									<div class="dpBox-div">▼</div>
								</div>
								<ul class="dropdown-contents">
									<li class="dp-all">전체</li>
									<li class="dp-title">제목</li>
									<li class="dp-contents">내용</li>
								</ul>
								<div class="search-box">
									<div>
										<input type="text" id="text_search" name="text_search" class="text_search" placeholder="검색어를 입력하세요.">
										<button class="search-button"><img src="images/search.png"></button>
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
						      	<td class="title"><a href="<c:url value="/noticeDetail"/>">${list.title}</a></td>
						      	<td>${list.userName}</td>
						      	<td><fmt:formatDate value="${list.modifyDate}" pattern="yyyy-MM-dd HH:mm:dd"/></td>
						    </tr>
						    </c:forEach>
						</tbody>
					</table>
				</div>
				<div class="paging-box">
					<ul>
						<li class="firstPager">
							<a href="" title="첫 페이지로 이동하기">
								<<
							</a>
						</li>
						<li class="prevPager">
							<a href="" title="이전 페이지로 이동하기">
								<
							</a>
						</li>
						
						<li><a href="" class="active">1</a></li>
						<li><a href="" class="active">2</a></li>
						<li><a href="" class="active">3</a></li>
						<li><a href="" class="active">4</a></li>
						<li><a href="" class="active">5</a></li>
						<li><a href="" class="active">6</a></li>
						<li><a href="" class="active">7</a></li>
						<li><a href="" class="active">8</a></li>
						<li><a href="" class="active">9</a></li>
						<li><a href="" class="active">10</a></li>
						
						<li class="nextPager">
							<a href="" title="다음 페이지로 이동하기">
								>
							</a>
						</li>
						<li class="lastPager">
							<a href="" title="마지막 페이지로 이동하기">
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