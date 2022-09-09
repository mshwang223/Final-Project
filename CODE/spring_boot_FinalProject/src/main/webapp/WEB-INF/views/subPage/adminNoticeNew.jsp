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
		<link rel="stylesheet" type="text/css" href="css/adminNoticeNew.css">
		
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
				<form method="post" id="userFrmNew" class="userFrm" name="userFrm">
					<table>
						<thead>
							<tr>
								<th class="num">제목</th>
						      	<th class="adminInputTitle">
						      		<input type="text" name="title" />
						      	</th>
						    </tr>
						</thead>
						<tbody>
						    <tr>
						      	<td class="titles" colspan="2">
						      		<!-- 현재년도 -->
									<c:set var="now" value="<%=new java.util.Date()%>" />
									관리자&nbsp;&nbsp; | &nbsp;&nbsp;작성일 : 
						      		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" />
						      	</td>
						    </tr>
						    <tr>
						      	<td colspan="2">
						      		<textarea id="adminNoticeContents" class="contents" name="contents"></textarea>
						      	</td>
						    </tr>
						</tbody>
					</table>
				    <div class="btn_list_box">
				    	<button type="button" class="btn_list_done">목록</button>
				    	<button type="submit" class="btn_save_done">저장</button>
				    </div>
				</form>
			</article>
			<!-- 세부화면 레이아웃 종료 -->
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>