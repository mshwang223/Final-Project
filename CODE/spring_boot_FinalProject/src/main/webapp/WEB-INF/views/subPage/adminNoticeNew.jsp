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
								<th class="num">제목</th>
						      	<th class="adminInputTitle">
						      		<input type="text" />
						      	</th>
						    </tr>
						</thead>
						<tbody>
						    <tr>
						      	<td class="titles" colspan="2">관리자&nbsp;&nbsp; | &nbsp;&nbsp;작성일 : 2022-08-16</td>
						    </tr>
						    <tr>
						      	<td colspan="2">
						      		<div id="adminNoticeContents" class="contents">

						      		</div>
						      	</td>
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