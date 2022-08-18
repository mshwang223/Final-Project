<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<link rel="icon" href="images/logo_ico.png">
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/index.js"></script>
	</head>
	
	<body>
		<section class="wrap">
			<!-- header  -->
			<c:import url="/WEB-INF/views/layout/header.jsp"/>
			
			<!-- section -->
			<section>
				<article class="main_slide">
					<div class="main_slide_box" id="slideBox">
						<div class="promotion_area">
							<div class="promotion_area_img">
								<img src="<c:url value='images/promotion1.png'/>" alt="반려동물 생일">
							</div>
							<div class="promotion_area_contents">
								<div>아늑한 공간에서 특별한 생일을 보내 보세요</div>
								<button class="slide_btn">자세히보기</button>
							</div>
						</div>
						<div class="promotion_area">
							<div class="promotion_area_img">
								<img src="images/promotion2.jpg" alt="반려동물 사진">
							</div>
							<div class="promotion_area_contents">
								<div>반려동물과 추억이 담긴 사진을 찍어봐요</div>
								<button class="slide_btn">자세히보기</button>
							</div>
						</div>
						<div class="promotion_area">
							<div class="promotion_area_img">
								<img src="images/promotion3.png" alt="반려동물 장난감">
							</div>
							<div class="promotion_area_contents">
								<div>다양한 장난감을 제공해드려요</div>
								<button class="slide_btn">자세히보기</button>
							</div>
						</div>
						<div class="promotion_area">
							<div class="promotion_area_img">
								<img src="images/promotion4.png" alt="반려동물 활동">
							</div>
							<div class="promotion_area_contents">
								<div>반려동물과 함께 다양한 활동을 해봐요</div>
								<button class="slide_btn">자세히보기</button>
							</div>
						</div>
					</div>
					<div class="slide_bar_box">
						<span class="slide_bar"></span>
						<span class="slide_bar"></span>
						<span class="slide_bar"></span>
						<span class="slide_bar"></span>
					</div>
				</article>
				<article class="popular_items">
					<div class="popular_title">인기 호텔</div>
					<div class="popular_items_wrap">
					<div class="popular_items_container">
						<div class="popular_hotel">
							<img src="images/hotel1.jpg" alt="">
							<div class="like">
								<span class="material-icons md-36">
									favorite_border
								</span>
							</div>
						</div>
						<div class="popular_hotel">
							<img src="images/hotel2.jpg" alt="">
							<div class="like">
								<span class="material-icons md-36">
									favorite_border
								</span>
							</div>
						</div>
					<div class="popular_hotel">
						<img src="images/hotel3.jpg" alt="">
						<div class="like">
							<span class="material-icons md-36">
								favorite_border
							</span>
						</div>
					</div>
					<div class="popular_hotel">
						<img src="images/hotel4.jpg" alt="">
						<div class="like">
							<span class="material-icons md-36">
								favorite_border
								</span>
							</div>
						</div>
						<div class="popular_hotel">
							<img src="images/hotel5.jpg" alt="">
							<div class="like">
								<span class="material-icons md-36">
										favorite_border
								</span>
							</div>
						</div>
					</div>
					<img class="prev"  src="images/left-arrow.png" alt="">
					<img class="next"  src="images/next.png" alt="">
				</div>
				</article>
			</section>
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>