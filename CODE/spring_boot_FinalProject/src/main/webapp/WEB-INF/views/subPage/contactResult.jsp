<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<link rel="icon" href="images/logo_ico.png">
		<link rel="stylesheet" type="text/css" href="css/board.css">
		<link rel="stylesheet" type="text/css" href="css/contact.css">
		<link rel="stylesheet" type="text/css" href="css/contactResult.css">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/notice.js"></script>
	</head>
	
	<body>
		<section class="wrap">
			<!-- header  -->
			<c:import url="/WEB-INF/views/layout/header.jsp"/>
			
			<!-- 공지사항 레이아웃 시작 -->
			<article class="contactResultBox">
				<p class="pageTitle">문의 조회</p>
				<div class="contact-menu">
					<a href="<c:url value='/contact'/>">문의등록</a>
					<a href="<c:url value='/contactResult'/>">문의 조회</a>
					<div class="underline"></div>	
				</div>

				<div class="table-box">
					<table>
						<thead>
							<tr>
						      	<th class="num">번호</th>
						      	<th>문의제목</th>
						     	<th class="author">작성일</th>
						      	<th class="date">답변유무</th>
						    </tr>
						</thead>
						<tbody>
						    <tr>
						      	<td>1</td>
						      	<td class="title">AI 플랫폼을 활용한 웹서비스 수업을 듣고 있는 수강생입니다.</td>
						      	<td>2022/08/18 12:07</td>
						      	<td>답변완료</td>
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
			</article>
			<!-- 공지사항 레이아웃 종료 -->
			
			<!-- footer -->
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</section>
	</body>
</html>