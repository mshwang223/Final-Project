<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<link rel="stylesheet" type="text/css" href="css/test.css">
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/test.js"></script>
	</head>
	
	<body>
		<section class="wrap">
			<header>
				<div class="logo_box">
					<img src="image/petmilylogo.png" alt="로고">
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
			<section>
				<article class="menu_view">
					<div class="menu_view_img">
						<img src="image/promotion1.png" alt="강아지고양이">
					</div>
					<div class="menu_view_contents">
					<div>아늑한 공간에서 특별한 생일을 보내 보세요</div>
					<button>자세히보기</button>
				</div>
				</article>
				<article class="popular_items">
					<div class="popular_title">인기 호텔</div>
					<div class="popular_items_wrap">
						<div class="popular_items_container">
							<div><img src="image/hotel1.jpg" alt=""></div>
							<div><img src="image/hotel2.jpg" alt=""></div>
							<div><img src="image/hotel3.jpg" alt=""></div>
							<div><img src="image/hotel4.jpg" alt=""></div>
							<div><img src="image/hotel5.jpg" alt=""></div>
						</div>
						<img class="prev" src="image/left-arrow.png" alt="">
						<img class="next" src="image/next.png" alt="">
					</div>
				</article>
			</section>
		</section>
		<footer>
			<div class="footer_container">
				<div class="footer_box">
					<div class="div_terms">
						<a class="btn_terms" href="#">이용 약관</a>
						<a class="btn_terms bold" href="#">개인정보 처리방침</a>
						
					</div>
					<div class="div_service">
					
					</div>
				</div>
				<div class="div_cpy_info">
					<p>
						상호명 (주)펫밀리가 떴다 | 대표 황재윤 | 개인정보보호책임자 곽경록<br>
						주소 서울 강남구 선릉로 428, 위워크 2층 | 이메일 help@petmily.com | 마케팅/제휴 문의 marketing@petmily.com
					</p>
					<p>
						펫은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품·거래정보 및 거래에 대하여 책임을 지지않습니다.
					</p>
					<div class="footer_image"><img src="image/petmilylogo.png"></div>
				</div>
				
			</div>
		</footer>
	</body>
</html>