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
		
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/adminUserDetail.css"/>">
		
		<script src="<c:url value="/js/adminUserDetail.js"/>"></script>
	</head>

	<body>
		<!-- top  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section class="wrap">
			
			<!-- section -->
			<div>
			    <div class="pageTitle">
					<div>
						<span>#사용자관리</span>
					</div>
				</div>
		    	<div class="userInfo_box">
			        <div class="custom_info">
			        	<div>
		                    <c:if test="${not empty user.userImg }">
		                        <img src="/myProfileImg" id="profile_img__preview">
		                    </c:if>
		                    <c:if test="${empty user.userImg }">
		                        <img src="<c:url value='/images/profile.png'/>" id="profile_img__preview" />
		                    </c:if>
	                    </div>
			        	<div class="info_box">
			            	<p class="title">아이디</p>
			            	<input type="text" id="userId" class="text_content" value="${user.userId}" readOnly />
			          	</div>
			          	<br>
			          	<div class="info_box">
			            	<p class="title">이름</p>
			            	<input type="text" class="text_content" value="${user.userName}" readOnly />
			          	</div>
			          	<br>
			          	<div class="info_box">
			            	<p class="title">이메일</p>
			            	<input type="text" class="text_content" value="${user.userEmail}" readOnly />
			          	</div>
			          	<br>
			          	<div class="info_box">
			          		<table class="table_date">
			          			<tr>
			          				<th><p class="title">가입일</p></th>
			          				<th><p class="title">접속일</p></th>
			          			</tr>
			          			<tr>
			          				<th><input type="text" class="text_date" value="<fmt:formatDate value="${user.createDate}" pattern="yyyy-MM-dd HH:mm:dd"/>" readOnly /></th>
			          				<th><input type="text" class="text_date" value="<fmt:formatDate value="${user.activeDate}" pattern="yyyy-MM-dd HH:mm:dd"/>" readOnly /></th>
			          			</tr>
			            	</table>
			          	</div>
			          	<br>
			          	<div class="info_box">
			          		<table class="table_date">
			          			<tr>
			          				<th><p class="title">포인트</p></th>
			          				<th><p class="title">권 한</p></th>
			          			</tr>
			          			<tr>
			          				<td><input type="text" class="text_date" value="${user.points}P" readOnly /></td>
			          				<td>
			          					<div>
				          					<select id="userAuthor" class="text_date author" value="">
				          						<option value="0" <c:if test="${user.userAuthor eq '0'}">selected</c:if>>사용자</option>
				          						<option value="1" <c:if test="${user.userAuthor eq '1'}">selected</c:if>>관리자</option>
				          					</select>
				          					<button type="button" class="btn_save">수정</button>
			          					</div>
			          				</td>
			          			</tr>
			            	</table>
			          	</div>
		        	</div>
		    	</div>
		    	<div class="btn_list_box">
				   	<button type="button" class="btn_list_done">목록</button>
				</div>
		    </div>
		<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>