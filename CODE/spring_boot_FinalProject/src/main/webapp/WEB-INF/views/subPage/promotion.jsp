<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		<!-- css -->
 		<link rel="stylesheet" type="text/css" href="<c:url value='/css/promotion.css'/>">
	</head>
	<body>
		<section class="wrap">
		<!-- top  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		
		<!-- middle -->
	    <section class="promotion_menu">
	      <div class="whole_pro_box">
	        <div class="main_pro_box">
	          <div class="main_pro_tlt"># 이달의 프로모션</div>
	        </div>
	      </div>
	    </section>		
		
		<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>		 
	</body>
</html>