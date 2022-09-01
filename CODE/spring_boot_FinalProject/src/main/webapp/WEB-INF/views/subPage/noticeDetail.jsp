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
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/noticeDetail.css"/>">
		<script src="<c:url value="/js/noticeDetail.js"/>"></script>
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
				<div class="table-box">
					<table>
						<thead>
							<tr>
						      	<th colspan="2">${notice.title}</th>
						    </tr>
						</thead>
						<tbody>
						    <tr>
						      	<td class="titles" colspan="2">
						      		${notice.userName}&nbsp;&nbsp; | &nbsp;&nbsp;작성일 : 
						      		<fmt:formatDate value="${notice.modifyDate}" pattern="yyyy-MM-dd HH:mm:dd"/>
						      	</td>
						    </tr>
						    <tr>
						      	<td colspan="2">
						      		<div class="contents">
							      		${notice.contents}
						      		</div>
						      	</td>
						    </tr>
						    <tr>
						      	<td class="paging-td">▲ 다음글</td>
						      	<td>
						      		<c:if test="${empty notice.nextTitle}">
						      			마지막 글입니다.
						      		</c:if>
						      		<c:if test="${not empty notice.nextTitle}">
						      			${notice.nextTitle}
						      		</c:if>
						      	</td>
						    </tr>
						    <tr>  	
						      	<td class="paging-td">▼ 이전글</td>
						      	<td>
						      		<c:if test="${empty notice.prevTitle}">
						      			첫 번째 글입니다.
						      		</c:if>
						      		<c:if test="${not empty notice.prevTitle}">
						      			${notice.prevTitle}
						      		</c:if>						      	
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