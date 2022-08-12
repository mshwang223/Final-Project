<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항</title>
	<link rel="icon" href="image/logo_ico.png">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/board.css">
	<link rel="stylesheet" type="text/css" href="css/notice.css">
	<script src="js/jquery-3.6.0.min.js"></script>
	</head>
	
	<body>
		<section class="wrap">
			<!-- header  -->
			<c:import url="/WEB-INF/views/layout/header.jsp"/>
			
			<!-- 공지사항 레이아웃 시작 -->
			<section class="noticeBox">
				<p class="pageTitle">공지사항</p>
				
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
				      <td class="title">공지사항 제목1</td>
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
				  </tbody>
				</table>
			</section>
			<!-- 공지사항 레이아웃 종료 -->
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>