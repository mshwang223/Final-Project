<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입</title>
		<link rel="icon" href="image/logo_ico.png">
		<link rel="stylesheet" href="css/common.css">
  		<link rel="stylesheet" href="css/signup.css">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/signup.js"></script>
	</head>

	<body>
		<section class="wrap">
			<!-- header 시작 -->
			<header>
				<div class="logo_box">
					<a href="<c:url value='/'/>"><img src="image/petmilylogo.png" class="logoImg" alt="로고"></a>
				</div>
				<nav class="main_nav">
					<a>호텔 / 펜션</a>
					<a>프로모션</a>
					<a>공지사항</a>
					<a>문의하기</a>
					<div class="underline"></div>
				</nav>
				<div class="login_box">
					<span>로그인</span><span>회원가입</span>
				</div>
			</header>
    	<!-- header 끝 -->
	
			<section class="signup">
				<div class="signup_box">
					<div class="signup_title">
						<p>회원가입</p>
					</div>
					<div class="custom_info">
						<div class="signup_id">
							<p class="title">아이디</p>
							<input type="text" class="text_signup_id" placeholder="아이디 입력">
							<button class="btn_idcheck">중복확인</button>
						</div>
						<br>
						<div class="signup_pwd">
							<p class="title">비밀번호</p>
							<input type="password" class="text_signup_pwd"
								placeholder="영문 숫자 특수문자 포함 8~12자리">
							<!-- <div class="pwd_eyes"><img src="../images/show.png"></div> -->
						</div>
						<div class="check_pwd">
							<p class="title">비밀번호 확인</p>
							<input type="password" class="text_check_pwd"
								placeholder="영문 숫자 특수문자 포함 8~12자리">
							<!-- <div class="pwd_eyes"><img src="../images/show.png"></div> -->
						</div>
						<br>
						<div class="signup_name">
							<p class="title">이름</p>
							<input type="text" class="text_signup_name"
								placeholder="이름을 입력해 주세요">
						</div>
						<br>
						<div class="signup_phone">
							<p class="title">휴대폰 인증</p>
							<input type="text" class="text_signup_phone"
								placeholder="번호를 입력해 주세요">
							<button class="confirm_phone">번호전송</button>
						</div>
						<div class="signup_phone_check">
							<input type="text" class="check_signup_phone"
								placeholder="인증번호를 입력해 주세요">
							<button class="check_phone">인증하기</button>
						</div>
						<br>
						<div class="signup_address">
							<p class="title">주소</p>
							<input type="text" class="zipcode" name="zipcode" readonly>
							<button class="btn_zipcode">우편번호찾기</button>
							<input type="text" class="check_address1" placeholder="주소 입력"><br>
							<input type="text" class="check_address2" placeholder="상세 주소 입력">
						</div>
						<br>
						<div class="signup_email">
							<p class="title">이메일</p>
							<input type="text" class="text_signup_email"
								placeholder="abc@example.com">
						</div>
						<br>
						<br>
						<div class="agree_rule">
							<div class="agree_all">
								<input type="checkbox" class="agree_all_check">
								<p class="title">약관 전체 동의</p>
							</div>
							<div class="agree_sub">
								<div class="agree_sub1">
									<input type="checkbox" class="agree_subcheck1">
									<p>이용 약관(필수)</p>
									<a href="#" class="agree_link1">상세보기</a>
								</div>
							</div>
							<div class="agree_sub">
								<div class="agree_sub2">
									<input type="checkbox" class="agree_subcheck2">
									<p>개인정보 수집 및 이용(필수)</p>
									<a href="#" class="agree_link2">상세보기</a>
								</div>
							</div>
							<div class="agree_sub">
								<div class="agree_sub3">
									<input type="checkbox" class="agree_subcheck3">
									<p>이벤트 / 프로모션 SMS수신(선택)</p>
									<a href="#" class="agree_link3">상세보기</a>
								</div>
							</div>
							<div class="agree_sub">
								<div class="agree_sub4">
									<input type="checkbox" class="agree_subcheck4">
									<p>이벤트 / 프로모션 Email수신(선택)</p>
									<a href="#" class="agree_link4">상세보기</a>
								</div>
							</div>
						</div>
						<div class="btn_signup_box">
							<button class="btn_signup_done">가입하기</button>
						</div>
					</div>
				</div>
			</section>
	
			<!-- footer 시작 -->
			<footer>
				<div class="footer_container">
	
					<div class="footer_box">
						<div class="div_terms">
							<span class="btn_terms">이용 약관 |</span> <span class="btn_terms">개인정보
								처리방침 |</span> <span class="btn_terms">고객센터</span>
						</div>
						<div class="div_cpy_info">
							<p>
								상호명: (주)펫밀리가 떴다 | 대표 황재윤 | 개인정보보호책임자 곽경록<br> 주소: 서울특별시 마포구
								양화로 12길 8-9, 3층 (서교동, 예현빌딩) | 이메일 help@petmily.com | 마케팅 / 제휴 문의
								marketing@petmily.com <br> 대표번호: 02-222-0333 팩스:
								050-1122-3030 사업자등록번호: 111-22-33333 통신판매업신고번호: 제2022-서울마포-0000호
							</p>
						</div>
					</div>
					<div class="footer_image">
						<div class="sns_box">
							<span class="sns"><img src="image/facebook.png"></span>
							<span class="sns"><img src="image/instagram.png"></span>
							<span class="sns"><img src="image/twitter.png"></span> <span
								class="sns"><img src="image/youtube.png"></span>
						</div>
						<img src="image/petmilylogo.png">
					</div>
	
				</div>
			</footer>
		</section>
	</body>
</html>