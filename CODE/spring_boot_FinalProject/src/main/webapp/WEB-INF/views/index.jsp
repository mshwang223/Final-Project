<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/index.js"></script>
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
			<article class="main_slide">
				<div class="main_slide_box" id="slideBox">
					<div class="promotion_area">
						<div class="promotion_area_img">
							<img src="image/promotion1.png" alt="반려동물 생일">
						</div>
						<div class="promotion_area_contents">
							<div>아늑한 공간에서 특별한 생일을 보내 보세요</div>
							<button class="slide_btn">자세히보기</button>
						</div>
					</div>
					<div class="promotion_area">
						<div class="promotion_area_img">
							<img src="image/promotion2.jpg" alt="반려동물 사진">
						</div>
						<div class="promotion_area_contents">
							<div>반려동물과 추억이 담긴 사진을 찍어봐요</div>
							<button class="slide_btn">자세히보기</button>
						</div>
					</div>
					<div class="promotion_area">
						<div class="promotion_area_img">
							<img src="image/promotion3.png" alt="반려동물 장난감">
						</div>
						<div class="promotion_area_contents">
							<div>다양한 장난감을 제공해드려요</div>
							<button class="slide_btn">자세히보기</button>
						</div>
					</div>
				</div>
				<div class="slide_bar_box">
					<span class="slide_bar"></span>
					<span class="slide_bar"></span>
					<span class="slide_bar"></span>
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
				<span class="btn_terms">이용 약관 |</span>
				<span class="btn_terms">개인정보 처리방침 |</span>
				<span class="btn_terms">고객센터</span>
			</div>
			<div class="div_cpy_info">
				<p>
					상호명: (주)펫밀리가 떴다 | 대표 황재윤 | 개인정보보호책임자 곽경록<br>
					주소: 서울특별시 마포구 양화로 12길 8-9, 3층 (서교동, 예현빌딩) | 이메일 help@petmily.com | 마케팅/제휴 문의 marketing@petmily.com <br>
					대표번호: 02-222-0333 팩스: 050-1122-3030 사업자등록번호: 226-81-52531 통신판매업신고번호: 제2020-서울마포-3555호
				</p> 
			</div>
		</div>	
		<div class="footer_image">
			<img src="image/petmilylogo.png"></div>
		</div>
		</footer>
	</body>
</html>