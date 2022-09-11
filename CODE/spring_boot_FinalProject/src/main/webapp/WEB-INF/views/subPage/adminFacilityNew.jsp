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
		
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/adminServiceNew.css"/>">
		
		<script src="<c:url value="/js/adminFacilityNew.js"/>"></script>
	</head>

	<body>
		<!-- top  --> 
		<c:import url="/WEB-INF/views/layout/top.jsp"/> 
		<section class="wrap">
			
			<!-- section -->
			<form id="userFrm">
			    <div class="pageTitle">
					<div>
						<span>#시설</span>
					</div>
				</div>
		    	<div class="userInfo_box">
			        <div class="custom_info">
			        	<div class="info_box">
			            	<p class="title">구분</p>
			            	<input type="text" id="facilitySort" name="facilitySort" class="text_content" required />
			          	</div>
			          	<br>
			          	<div class="info_box">
			            	<p class="title">이름</p>
			            	<input type="text" id="facilityName" name="facilityName" class="text_content" required />
			          	</div>
		        	</div>
		    	</div>
				<div class="btn_list_box">
					<button type="button" class="btn_list_done">목록</button>
				    <button type="submit" class="btn_save_done">저장</button>
				</div>
		    </form>
		<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>