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
		
		<link rel="stylesheet" type="text/css" href="css/updateprofile.css">	
	
		<script src="js/updateprofile.js"></script>
	
</head>
<body>
<!-- top  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section class="wrap">
			<div class="pageTitle">
					<div>
						<span>#프로필 수정</span>
					</div>
				</div>
					<div class="update_box">
					 <div class="custom_info">
			          	 	<div class="updateprofile_email">
			            	<p class="title">이메일</p>
			            	<input type="text" id="updateprofileEmail" class="text_updateprofile_email" placeholder="abc@example.com">
			          		<button type="button" class="btn_emailcheck">중복확인</button>
			          	</div>
			          	<br>
			          	<div class="updateprofile_pw">
			            	<p class="title">비밀번호</p>
			            	<input type="password" id="updateprofilepw1" class="text_updateprofile_pw" placeholder="영문 숫자 특수문자 포함 8~12자리">
			            	</div>
			            <br>
			            <div class="updateprofile_pwcheck">
			            	<p class="title">비밀번호확인</p>
			            	<input type="password" id="updateprofilepw2" class="text_updateprofile_pw" placeholder="영문 숫자 특수문자 포함 8~12자리">			        			          			
					</div>
					</div>
					</div>
					 <div class="btn_updateprofile_box">
			    	<button type="button" class="btn_cancel_done">취 소</button>
			        <button type="submit" class="btn_updateprofile_done">변경하기</button>
			    </div>
		</section>


	<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>