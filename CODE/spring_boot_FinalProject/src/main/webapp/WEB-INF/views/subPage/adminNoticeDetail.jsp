<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		
		<!-- summernote api -->
		<link rel="stylesheet" type="text/css" href="css/summernote-lite.css">
		
		<link rel="stylesheet" type="text/css" href="css/board.css">
		<link rel="stylesheet" type="text/css" href="css/adminNoticeDetail.css">
		
		<!-- summernote api -->
		<script src="/js/summernote-lite.js"></script>
		<script src="/js/summernote-ko-KR.js"></script>		
		
		<script src="js/adminNoticeDetail.js"></script>
		
	</head>
	
	<body>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
			
		<section class="wrap">
			<!-- 세부화면 레이아웃 시작 -->
			<article class="noticeBox">
				<div class="pageTitle">
					<div>
						<span>#공지사항</span>
					</div>
				</div>
				<div>
					<table>
						<tr>
							<td class="button-table"><button class="btnAdmin">저장</button></td>
						</tr>
					</table>
				</div>
				<div class="table-box">
					<table>
						<thead>
							<tr>
						      	<th class="adminInputTitle" colspan="2">
						      		<input type="text" placeholder="공지사항 제목1" />
						      	</th>
						    </tr>
						</thead>
						<tbody>
						    <tr>
						      	<td class="titles" colspan="2">관리자&nbsp;&nbsp; | &nbsp;&nbsp;수정일 : 2022-08-16</td>
						    </tr>
						    <tr>
						      	<td colspan="2">
						      		<div id="adminNoticeContents" class="contents">
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
			</article>
			<!-- 세부화면 레이아웃 종료 -->
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>