<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
</head>
		<header>
			<div>
			<div class="logo_box">
				<a href="<c:url value='/'/>"><img src="<c:url value='/images/petmilylogo.png'/>" class="logoImg" alt="로고"></a>
			</div>
			<div class="nav-box">
				<nav class="main_nav">
					<a href="<c:url value='/petHotel'/>">호텔 / 펜션</a>
					<a href="<c:url value='/promotion'/>">프로모션</a>
					<a href="<c:url value='/noticeSearch/0'/>">공지사항</a>
					<c:if test="${not empty sessionScope.sid}">
					<a href="<c:url value='/contact'/>">문의하기</a>
					</c:if>
					<div class="underline"></div>
				</nav>
			</div>
			<div class="login_box">
				<!-- 로그인 안 한 경우 -->
				<c:if test="${empty sessionScope.sid}">
			   	<div class="dropdown">
					<span class="loginForm">로그인</span>
					<div id="dropdown-login">
						<form action="post" id="login-form">
							<p>로그인</p>
							<div class="loginline"></div>
							<div id="input-div">
								<input type="text" id="userId" class="dropdown_username" placeholder="아이디">
								<input type="password" id="userPw" class="dropdown_password" placeholder="비밀번호">
							</div>
							<div id="forgotInfo">
								<a id="findIdBtn">ID 찾기</a>
								<a id="findPwBtn">PW 찾기</a>
							</div>
							<div class="loginline last"></div>
							<div id="petLogin" class="petlogo-box">
								<img src="<c:url value='/images/logo_ico.png'/>" alt="">
							</div> 
						</form>
						<input type="submit" class="dropdown_botton" value="로그인">
					</div>
					<!-- The Modal -->
					<div id="findIdModal" class="modal">
						<!-- Modal content -->
						<div class="modal-content">
						<img src="<c:url value='/images/petmilylogo.png'/>" alt="">
							<span class="close">&times;</span>
							<p>아이디 찾기</p>
							<div class="loginline last"></div>
							<form id="findIdForm">
								<input type="text" placeholder="이름" name="userName" required />
								<input type="email" placeholder="이메일" name="userEmail" required />
								<button type="submit" class="modal_btn">확인</button> 
							</form>
						</div>
					</div>
					<div id="findPwModal" class="modal">
						<!-- Modal content -->
						<div class="modal-content">
						<img src="<c:url value='/images/petmilylogo.png'/>" alt="" height=200px;>
							<span class="close">&times;</span>
							<p>비밀번호 찾기</p>
							<div class="loginline last"></div>
							<form id="findPwForm">
								<input type="text" placeholder="아이디" name="userId" required />
								<input type="email" placeholder="이메일" name="userEmail" required />
								<button type="submit" class="modal_btn" >확인</button>
							</form>
						</div>
					</div>
				</div>
				<a class="btnSignup" href="<c:url value='/signup'/>">회원가입</a>
				</c:if>
				
				<!-- 로그인 한 경우 -->
				<c:if test="${not empty sessionScope.sid}"> 
				<div class="dropdown user">
					<div class="points_box"><i class="fa-solid fa-coins"></i>${sessionScope.points}P</div>
					<img src="<c:url value='/images/cart.png'/>" id="myCart" class="top_cart_img">
					<c:if test="${empty sessionScope.userImg}">
						<img src="<c:url value='/images/profile.png'/>" class="top_profile_img">
					</c:if>
					<c:if test="${not empty sessionScope.userImg}">
						<img src="<c:url value='/profileImg/${sessionScope.userImg}'/>" class="top_profile_img">
					</c:if>
					<div id="dropdown-user" class="dropdown-user">
						<ul id="userPage">
							<c:if test="${sessionScope.author eq '1'}">
							<li id="admin">관리자</li>
							<li class="underline"></li>
							</c:if>
							<li id="inputHotel">업체등록</li>
							<li class="underline"></li>
							<li id="myPage">마이페이지</li>
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
			</div>
		</header>
</html>