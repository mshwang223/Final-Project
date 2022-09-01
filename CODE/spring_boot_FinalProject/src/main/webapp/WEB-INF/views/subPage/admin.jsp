<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 양식제출 안뜨게함!--!>
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
		
		<link rel="stylesheet" type="text/css" href="css/board.css">
		<link rel="stylesheet" type="text/css" href="css/adminNotice.css">
		
		<script src="js/notice.js"></script>
		<script src="js/adminNotice.js"></script>
	</head>
	
	<body>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
			
		<section class="wrap">
			<!-- 관리자 레이아웃 시작 -->
			<article>
				<!-- sidebar -->
				<c:import url="/WEB-INF/views/layout/adminSide.jsp"/>
				
				<div class="main-layout">
					<div class="pageTitle">
						<div>
							<span># 공지사항</span>
						</div>
					</div>	
					<div>
						<table class="search-table">
							<tr>
								<td></td>
								<td>
									<div class="dropdown-box">
										<div id="dpBox-name" class="dpBox-div">전체</div>
										<div class="dpBox-div">▼</div>
									</div>
									<ul class="dropdown-contents">
										<li id="dp-all">전체</li>
										<li id="dp-title">제목</li>
										<li id="dp-contents">내용</li>
									</ul>
									<div class="search-box">
										<div>
											<input type="text" class="text_search" placeholder="검색어를 입력하세요.">
											<button class="search-button"><img src="images/search.png"></button>
										</div>
									</div>
									<div>
										<button id="adminNoticeNew" class="btnAdmin">NEW</button>
									</div>
								</td>
							</tr>
						</table>
					</div>
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
							    <tr>
							      	<td>1</td>
							      	<td class="title"><a href="<c:url value="/adminNoticeDetail"/>">공지사항 제목1</a></td>
							      	<td>Marco Belinelli</td>
							      	<td>2022-08-12</td>
							    </tr>
							    <tr>
							      	<td>2</td>
							      	<td class="title">공지사항 제목2</td>
							      	<td>Carlos Boozer</td>
							      	<td>2022-08-12</td>
							    </tr>
							    <tr>
							      	<td>3</td>
							      	<td class="title">공지사항 제목3</td>
							      	<td>Jimmy Butler</td>
							      	<td>2022-08-12</td>
							    </tr>
							    <tr>
							      	<td>4</td>
							      	<td class="title">공지사항 제목4</td>
							      	<td>Luol Deng</td>
							      	<td>2022-08-12</td>
							    </tr>
							    <tr>
							      	<td>5</td>
							      	<td class="title">공지사항 제목5</td>
							      	<td>Taj Gibson</td>
							      	<td>2022-08-12</td>
							    </tr>
							    <tr>
							      	<td>6</td>
							      	<td class="title">공지사항 제목6</td>
							      	<td>Richard Hamilton</td>
							      	<td>2022-08-12</td>
							    </tr>
							    <tr>
							      	<td>7</td>
							      	<td class="title">공지사항 제목7</td>
							      	<td>Kirk Hinrich</td>
							      	<td>2022-08-12</td>
							    </tr>
							    <tr>
							      	<td>8</td>
							      	<td class="title">공지사항 제목8</td>
							      	<td>Nazr Mohammed</td>
							      	<td>2022-08-12</td>
							    </tr>
							    <tr>
							      	<td>9</td>
							      	<td class="title">공지사항 제목9</td>
							      	<td>Joakim Noah</td>
							      	<td>2022-08-12</td>
							    </tr>
							    <tr>
							      	<td>10</td>
							      	<td class="title">공지사항 제목10</td>
							      	<td>Johnson Cals</td>
							      	<td>2022-08-12</td>
							    </tr>
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
				</div>
			</article>
			<!-- 관리자 레이아웃 종료 -->
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>