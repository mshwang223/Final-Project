<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<link rel="icon" href="images/logo_ico.png">
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		<link rel="stylesheet" type="text/css" href="css/payment.css">
		<script src="js/payment.js"></script>
</head>
<body>
<section class="wrap">
			<!-- header  -->
			<c:import url="/WEB-INF/views/layout/top.jsp"/>
           <section class="payment">
		    	<div class="payment_box">
			        <div class="payment_title">
			        	<p>결제하기</p>
			        </div>
			        </div>
			        </section>


<!-- footer -->
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</section>
</body>
</html>