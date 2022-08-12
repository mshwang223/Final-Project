<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다 Header</title>
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/header.js"></script>
	</head>
	<body>
		<header>
			<div class="logo_box">
				<a href="<c:url value='/'/>"><img src="image/petmilylogo.png"
					class="logoImg" alt="로고"></a>
			</div>
			<nav class="main_nav">
				<a href="<c:url value='/petHotel'/>">호텔 / 펜션</a>
				<a>프로모션</a>
				<a href="<c:url value='/notice'/>">공지사항</a>
				<a>문의하기</a>
				<div class="underline"></div>
			</nav>
			<div class="login_box">
				<div class="dropdown">
					<span class="loginForm">로그인</span>
					<div id="dropdown-login">
						<form action="post" id="login-form">
							<div id="input-div">
							<input type="text" class="dropdown_username" placeholder="Username">
							<input type="password" class="dropdown_password" placeholder="Password"></div>
							<input type="submit" class="dropdown_botton" value="로그인">
						</form>
					</div>
				</div>
				<a href="<c:url value='/signup'/>">회원가입</a>
			</div>
		</header>
	</body>
</html>