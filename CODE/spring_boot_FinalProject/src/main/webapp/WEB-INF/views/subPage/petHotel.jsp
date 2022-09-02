<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 양식다시제출 제거 -->
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
<!DOCTYPE html>
<html>
<head>
	<!-- header  -->
	<c:import url="/WEB-INF/views/layout/header.jsp" />
	
	<!-- datarangepicker -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/daterangepicker.css'/>">
    
	<!-- js -->
	<script defer src="<c:url value='/js/petHotel.js'/>"></script>
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/petHotel.css'/>">
</head>

<body>
	<!-- top  -->
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<section class="wrap">

		<section class="reservation_container">
			<article>
				<form id="userFrm" class="reservation_box" method="post" action="<c:url value="/petHotelList"/>">
					<div class="search_area">
						<div>
							<div class="search_area_title">
								지역<img src="<c:url value='/images/location.png'/>" alt="지역">
							</div>
							<input type="text" name="area" class="search_box" id="searchBox"
								value="목적지를 검색하세요" autocomplete="off">
						</div>
						<div class="search_pop" id="searchPop">
							<ul id="searchList">
								<li>서울</li>
								<li>부산</li>
								<li>제주도</li>
								<li>강원도</li>
								<li>강릉</li>
							</ul>
						</div>
					</div>
					<div class="option_area">
						<div>
							<div class="option_area_title">
								옵션<img src="<c:url value='/images/choice.png'/>" alt="옵션">
							</div>
							<div class="option_box" id="optionBox" autocomplete="off"></div>
							<!--  contenteditable="true" placeholder="옵션을 선택하세요" -->
						</div>
						<div class="option_pop" id="optionPop">
							<div>
								<span class="option_span" id="option1">픽업</span>
								<span class="option_span" id="option2">촬영</span>
								<span class="option_span" id="option3">패키지</span>
								<span class="option_span" id="option4">풀장</span>
							</div>
						</div>
					</div>
					<div class="date_area">
						<div>
							<div class="date_area_title">
								날짜<img src="<c:url value='/images/calendar.png'/>" alt="날짜">
							</div>
							<input type="text" id="rangepicker" class="stay_date"
								name="daterange" autocomplete="off" value="날짜를 입력해주세요">
						</div>
					</div>
					<div class="count_area">
						<div>
							<div class="count_area_title">
								인원수 | 반려동물 수<img src="<c:url value='/images/owner.png'/>" alt="구성원 수">
							</div>
							<input type="text" class="count_box" id="btnCount" name="count" autocomplete="off" value="성인0, 반려동물1" spellcheck="false">
						</div>
						<div class="person_count_option">
							<h4 class="tlt_popup_person">인원 선택</h4>
							<div class="div_person_count">
								<div class="box_txt_person">
									<span class="txt_person_main">성인</span> <span
										class="txt_person_sub">만 18세 이상</span>
								</div>
								<div class="box_plus_minus">
									<span id="personMinusBtn" class="btn_popup_count">-</span> 
									<span id="personCount" class="popup_count_person">0</span>
									<span id="personPlusBtn" class="btn_popup_count btn_adult_plus btn_count_active">+</span>
								</div>
							</div>
							<div class="div_person_count">
								<div class="box_txt_person">
									<span class="txt_person_main">반려동물</span> <span
										class="txt_person_sub">강아지 | 고양이</span>
								</div>
								<div class="box_plus_minus">
									<span id="petMinusBtn" class="btn_popup_count">-</span>
									<span id="petCount" class="popup_count_person">1</span>
									<span id="petPlusBtn" class="btn_popup_count btn_count_active">+</span>
								</div>
							</div>
						</div>
					</div>
					<button id="reservationBtn" class="reservation_btn">
						<div>
							<span>검색</span> <img src="<c:url value='/images/search.png'/>" alt="검색">
						</div>
					</button>
				</form>
			</article>
		</section>
		<!-- 호텔 펜션 추천 -->
		<section>
			<!-- 특가숙소 -->
			<article class="special_area">
				<div class="special_title">
					<span># 특가숙소</span>
				</div>
				<div class="stay_items_wrap">
					<div class="stay_container">
						<div class="special_img_box">
							<img src="<c:url value='/images/hotel1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="special_img_box">
							<img src="<c:url value='/images/hotel2.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="special_img_box">
							<img src="<c:url value='/images/hotel3.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="special_img_box">
							<img src="<c:url value='/images/hotel4.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="special_img_box">
							<img src="<c:url value='/images/hotel5.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="special_img_box">
							<img src="<c:url value='/images/hotel1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="special_img_box">
							<img src="<c:url value='/images/hotel2.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="special_img_box">
							<img src="<c:url value='/images/hotel3.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="special_img_box">
							<img src="<c:url value='/images/hotel4.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="special_img_box">
							<img src="<c:url value='/images/hotel5.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star">
									<img src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
					</div>
					<img class="special_prev" src="<c:url value='/images/left-arrow.png'/>" alt=""> 
					<img class="special_next" src="<c:url value='/images/next.png'/>" alt="">
				</div>
			</article>
			<!-- 인기숙소 -->
			<article class="popular_area">
				<div class="popular_title">
					<span># 인기숙소</span>
				</div>
				<div class="stay_items_wrap">
					<div class="stay_container">
						<div class="popular_img_box">
							<img src="<c:url value='/images/hotel1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="popular_img_box">
							<img src="<c:url value='/images/hotel2.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="popular_img_box">
							<img src="<c:url value='/images/hotel3.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="popular_img_box">
							<img src="<c:url value='/images/hotel4.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="popular_img_box">
							<img src="<c:url value='/images/hotel5.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="popular_img_box">
							<img src="<c:url value='/images/hotel1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="popular_img_box">
							<img src="<c:url value='/images/hotel2.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="popular_img_box">
							<img src="<c:url value='/images/hotel3.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="popular_img_box">
							<img src="<c:url value='/images/hotel4.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="popular_img_box">
							<img src="<c:url value='/images/hotel5.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
					</div>
					<img class="popular_prev" src="<c:url value='/images/left-arrow.png'/>" alt=""> <img
						class="popular_next" src="<c:url value='/images/next.png'/>" alt="">
				</div>
			</article>
			<!-- 서울 -->
			<article class="seoul_area">
				<div class="seoul_title">
					<span># 서울에서 보내는 펫캉스</span>
				</div>
				<div class="stay_items_wrap">
					<div class="stay_container">
						<div class="seoul_img_box">
							<img src="<c:url value='/images/stay1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="seoul_img_box">
							<img src="<c:url value='/images/stay2.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="seoul_img_box">
							<img src="<c:url value='/images/stay3.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="seoul_img_box">
							<img src="<c:url value='/images/stay4.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="seoul_img_box">
							<img src="<c:url value='/images/stay5.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="seoul_img_box">
							<img src="<c:url value='/images/hotel1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="seoul_img_box">
							<img src="<c:url value='/images/hotel1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="seoul_img_box">
							<img src="<c:url value='/images/hotel1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="seoul_img_box">
							<img src="<c:url value='/images/stay1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="seoul_img_box">
							<img src="<c:url value='/images/stay1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
					</div>
					<img class="seoul_prev" src="<c:url value='/images/left-arrow.png'/>" alt=""> <img
						class="seoul_next"  src="<c:url value='/images/next.png'/>" alt="">
				</div>
			</article>
			<article class="busan_area">
				<div class="busan_title">
					<span># 부산 오션뷰 펫캉스</span>
				</div>
				<div class="stay_items_wrap">
					<div class="stay_container">
						<div class="busan_img_box">
							<img src="<c:url value='/images/busan1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="busan_img_box">
							<img src="<c:url value='/images/busan2.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="busan_img_box">
							<img src="<c:url value='/images/busan3.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="busan_img_box">
							<img src="<c:url value='/images/busan4.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="busan_img_box">
							<img src="<c:url value='/images/busan5.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="busan_img_box">
							<img src="<c:url value='/images/busan1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="busan_img_box">
							<img src="<c:url value='/images/busan1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="busan_img_box">
							<img src="<c:url value='/images/busan1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="busan_img_box">
							<img src="<c:url value='/images/busan1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
						<div class="busan_img_box">
							<img src="<c:url value='/images/busan1.jpg'/>" alt="">
							<div class="stay_info">
								<div class="stay_name">
									<span>비스타 워커힐 서울</span><span class="stay_star"><img
										src="<c:url value='/images/star.png'/>" alt="평점">4.87</span>
								</div>
								<div>8월 20일 ~ 8월 23일</div>
								<div>352,000원 / 1박</div>
							</div>
							<span class="like_hover"><img src="<c:url value='/images/heart.png'/>"
								alt="찜하기" class="like_btn"></span>
						</div>
					</div>
					<img class="busan_prev" src="<c:url value='/images/left-arrow.png'/>" alt=""> <img
						class="busan_next" src="<c:url value='/images/next.png'/>" alt="">
				</div>
			</article>
		</section>
		<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
	</section>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>