<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<link rel="icon" href="image/logo_ico.png">
		<link rel="stylesheet" type="text/css" href="css/board.css">
		<link rel="stylesheet" type="text/css" href="css/noticeDetail.css">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/noticeDetail.js"></script>
	</head>
	
	<body>
		<section class="wrap">
			<!-- header  -->
			<c:import url="/WEB-INF/views/layout/header.jsp"/>
			
			<!-- 세부화면 레이아웃 시작 -->
			<section class="noticeBox">
				<p class="pageTitle">공지사항</p>
				<div class="table-box">
					<table>
						<thead>
							<tr>
						      	<th colspan="2">공지사항 제목1</th>
						    </tr>
						</thead>
						<tbody>
						    <tr>
						      	<td class="titles" colspan="2">관리자&nbsp;&nbsp; | &nbsp;&nbsp;작성일 : 2022-08-16</td>
						    </tr>
						    <tr>
						      	<td colspan="2">
						      		<div class="contents">
							      		서버지연 현상이 발생하여 점검 중 입니다.<br><br>
							      		종료 예정 시간 : 2022-08-16 오후 08:30
						      		</div>
						      	</td>
						    </tr>
						    <tr>
						      	<td class="paging-td">▲ 이전글</td>
						      	<td>첫 번째 글입니다.</td>
						    </tr>
						    <tr>  	
						      	<td class="paging-td">▼ 다음글</td>
						      	<td>공지사항 제목2</td>
						    </tr>
						</tbody>
					</table>
				    <div class="btn_list_box">
				    	<button class="btn_list_done">목록</button>
				    </div>
				</div>
			</section>
			<!-- 세부화면 레이아웃 종료 -->
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>