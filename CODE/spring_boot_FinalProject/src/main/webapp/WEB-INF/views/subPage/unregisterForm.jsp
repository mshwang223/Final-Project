<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>프로필 수정</title>
	<!-- header  -->
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		
		<link rel="stylesheet" type="text/css" href="css/unregisterForm.css">	
	
		<script src="js/unregisterForm.js"></script>
	
</head>
<body>
<!-- top  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section class="wrap">
			<div class="pageTitle">
				<div>
					<span># 회원탈퇴</span>
				</div>
			</div>
			<form action="/delete" method="post" id="deleteForm" name="deleteForm">
				<input type="hidden" id="userId" name="userId" value="<c:url value='${sessionScope.sid}'/>">
				<div class="delete_box">
					 <div class="custom_info">
			          	<div class="delete_pw">
			            	<p class="title">비밀번호</p>
			            	<input type="password" id="deletePw1" class="text_delete_pw" placeholder="영문 숫자 특수문자 포함 8~12자리">
			            </div>
			            <br>
			            <div class="delete_pwcheck">
			            	<p class="title">비밀번호확인</p>
			            	<input type="password" id="deletePw2" class="text_delete_pw" placeholder="영문 숫자 특수문자 포함 8~12자리">			        			          			
						</div>
					</div>
				</div>
			
				 <div class="btn_delete_box">
			    	<button type="button" id="btnCancel" class="btn_cancel_done">취 소</button>
			        <button type="submit" id="btnDelete" class="btn_delete_done">회원탈퇴</button>
		    	</div>
	    	</form>
		</section>


	<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>