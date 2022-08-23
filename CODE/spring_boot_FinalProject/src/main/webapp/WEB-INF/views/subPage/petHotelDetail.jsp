<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- header  -->
	<c:import url="/WEB-INF/views/layout/header.jsp" />
	<!-- ico -->
	<link rel="icon" href="<c:url value='/images/logo_ico.png'/>">
	<!-- js -->
	<script defer src="<c:url value='/js/petHotelDetail.js'/>"></script>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/petHotelDetail.css'/>">
</head>

<body>
	<section class="wrap">
		<!-- top  -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />

	</section>
	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>