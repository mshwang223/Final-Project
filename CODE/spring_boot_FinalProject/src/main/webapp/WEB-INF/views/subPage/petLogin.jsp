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
		<title>펫밀리가 떴다</title>
		
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		
		<link rel="stylesheet" type="text/css" href="css/petLogin.css">
		<script src="<c:url value='/js/petLogin.js'/>"></script>
	</head>
	
	<body>
		<!-- top  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		
		<section class="wrap">
			<form method="post" id="petLoginOCR" class="petLoginOCR">
			    <div class="pageTitle">
					<div>
						<span>#펫 로그인</span>
					</div>
				</div>
				<div class="btnUpload_box">
					<button id="cancel" type="button">취소</button>
					<button id="confirm" type="button">확인</button>
				</div>
				<div class="img_box">
					<img id="profile_img_preview" src="<c:url value='/images/bgPetCard.png'/>"/>
					<div>
						<i class="fa-solid fa-circle-plus add_img_file"></i>
						<input type="file" id="uploadFile" name="uploadFile" style="display:none"/>
						<div>(등록증을 업로드 하세요)</div>
					</div>
				</div>
				
			    <div class="btn_signup_box">
			    	<button type="button" class="btn_cancel_done">취 소</button>
			        <button type="submit" class="btn_signup_done">로그인</button>
			    </div>
			</form>		
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>				
	</body>
</html>