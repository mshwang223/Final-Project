<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
		<header>
			<div class="logo_box">
				<a href="<c:url value='/'/>"><img src="<c:url value='/images/petmilylogo.png'/>" class="logoImg" alt="로고"></a>
			</div>
			<nav class="main_nav">
				<a href="<c:url value='/petHotel'/>">호텔 / 펜션</a>
				<a>프로모션</a>
				<a href="<c:url value='/notice'/>">공지사항</a>
				<a href="<c:url value='/contact'/>">문의하기</a>
				<div class="underline"></div>
			</nav>
			<div class="login_box">
				<div class="dropdown">
					<span class="loginForm">로그인</span>
					<div id="dropdown-login">
						<form action="post" id="login-form">
							<p>로그인</p>
							<div class="loginline"></div>
							<div id="input-div">
								<input type="text" class="dropdown_username" placeholder="아이디">
								<input type="password" class="dropdown_password" placeholder="비밀번호">
							</div>
							<div id="forgotInfo">
								<p>ID 찾기</p>
								<p>PW 찾기</p>
							</div> 
						</form>
						<input type="submit" class="dropdown_botton" value="로그인">
					</div>
				</div>
				<a href="<c:url value='/signup'/>">회원가입</a>
			</div>
		</header>
</html>