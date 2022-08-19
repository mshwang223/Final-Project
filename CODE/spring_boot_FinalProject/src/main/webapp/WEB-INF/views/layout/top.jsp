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
				<a href="<c:url value='/promotion'/>">프로모션</a>
				<a href="<c:url value='/notice'/>">공지사항</a>
				<a href="<c:url value='/contact'/>">문의하기</a>
				<div class="underline"></div>
			</nav>
			<div class="login_box">
				<!-- 로그인 안 한 경우 -->
				<c:if test="${empty sessionScope.sid}">
				<div class="dropdown">
					<span class="loginForm">로그인</span>
					<div id="dropdown-login">
						<form id="login-form" name="login-form">
							<p>로그인</p>
							<div class="loginline"></div>
							<div id="input-div">
								<input type="text" id="userId" name="userId" class="dropdown_username" placeholder="아이디">
								<input type="password" id="userPw" name="userPw" class="dropdown_password" placeholder="비밀번호">
							</div>
							<div id="forgotInfo">
								<a href="#">ID 찾기</a>
								<a href="#">PW 찾기</a>
							</div>
							<input type="submit" class="dropdown_botton" value="로그인">
						</form>
					</div>
				</div>
				<a href="<c:url value='/signup'/>">회원가입</a>
				</c:if>
				
				<!-- 로그인 한 경우 -->
				<c:if test="${not empty sessionScope.sid}">
				<div class="dropdown">
					<img src="<c:url value='/images/profile.png'/>" class="top_profile_img">
					<div id="dropdown-user" class="dropdown-user">
						<ul id="userPage">
							<li><a href="<c:url value='/mypage'/>">마이페이지</a></li>
							<li class="underline"></li>
							<li id="logout">
								로그아웃
								<img src="<c:url value='/images/logout.png'/>" class="top_logout_img">
							</li>
						</ul>
					</div>
				</div>
				</c:if>
			</div>
		</header>
</html>