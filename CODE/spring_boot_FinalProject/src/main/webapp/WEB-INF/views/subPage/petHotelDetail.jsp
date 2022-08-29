<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- header  -->
	<c:import url="/WEB-INF/views/layout/header.jsp" />
			
	<!-- naver maps api -->
	<script type="text/javascript" src="<c:url value='https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dmtzzphj4x'/>"></script>
	
	<!-- lightbox -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/petHotelDetail.css'/>">
	<!-- js -->
	<script defer src="<c:url value='/js/petHotelDetail.js'/>"></script>

</head>

<body>
	<!-- top  -->
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<section class="wrap">

		<section>
			<article class="stay_detail">
				<div>
					<div class="stay_title">서울 근교 감성 펫펜션 K401펜션</div>
					<div class="stay_sub_info">
						<div class="stay_sub_box">
							<img src="/images/star.png" alt="별점"> <span>4.37</span>
							<div class="review_move">후기 300개</div>
						</div>
						<div class="stay_pick">
							<span>찜하기</span>
							<img class="like_btn" src="/images/heart.png" alt="찜하기">
						</div>
					</div>
				</div>
				<div class="stay_img_container">
					<div class="stay_img_box1">
						<a href="/images/petDetail1.jpg" data-lightbox="example"><img src="/images/petDetail1.jpg" alt=""></a>
					</div>
					<div class="stay_img_box2">
						<a href="/images/petDetail2.jpg" data-lightbox="example"><img src="/images/petDetail2.jpg" alt=""></a> 
						<a href="/images/petDetail3.jpg" data-lightbox="example"><img src="/images/petDetail3.jpg" alt=""></a>
						<a href="/images/petDetail4.jpg" data-lightbox="example"><img src="/images/petDetail4.jpg" alt=""></a>
						<a href="/images/petDetail5.jpg" data-lightbox="example"><img src="/images/petDetail5.jpg" alt=""><div>+ 이미지 더보기</div></a>
						<a href="/images/petDetail2.jpg" data-lightbox="example"><img src="/images/petDetail2.jpg" alt=""></a> 
						<a href="/images/petDetail3.jpg" data-lightbox="example"><img src="/images/petDetail3.jpg" alt=""></a>
						<a href="/images/petDetail4.jpg" data-lightbox="example"><img src="/images/petDetail4.jpg" alt=""></a>
					</div>
				</div>
			</article>
			<article class="stay_info_area">
				<div class="info_content_area">
					<div class="info_content_box1">
						<div class="content_title">K401펜션</div>
						<div class="simple_info_box">
							<span>침실 1개 · </span> <span>침대 1개 · </span>
							<span>욕실 1개 · </span> <span>플레이그라운드</span>
						</div>
					</div>
					<div class="info_content_box2">
						<div class="location_box">
							<img src="/images/location.png" alt=""><span>주소 : </span>
							<span id="address">경기도 광주시 도척면 궁평리 401</span> <i class="fa-regular fa-copy" id="locationCopy"></i>
							<p class="copy">Copy!</p>
						</div>
						<div class="contact_box">
							<img src="/images/phone.png" alt=""> <span>연락처 : </span>
							<span id="hotelCallNumber">070-7758-0401</span> <i class="fa-regular fa-copy" id="phoneCopy"></i>
							<p class="copy">Copy!</p>
						</div>
					</div>
					<div class="info_content_box5">
						<div id="map" class="map"></div>
					</div>
					<div class="info_content_box3">
						<div>숙박타입</div>
						<div>
							<img src="/images/stayType.jpg" alt="">
							<div class="room_box">
								<span># 스탠다드 더블</span>
								<div>95,000원</div>
								<button class="room_btn">선택</button>
							</div>
						</div>
						<div>
							<img src="/images/stayType.jpg" alt="">
							<div class="room_box">
								<span># 스탠다드 트윈</span>
								<div>95,000원</div>
								<button class="room_btn">선택</button>
							</div>
						</div>
					</div>
					<div class="info_content_box4">
						<div>숙소 편의 시설</div>
						<div class="cs_box">
							<div class="cs_box1">
								<div>
									<img src="/images/cutlery.png" alt="">주방
								</div>
								<div>
									<img src="/images/car.png" alt="">주차시설
								</div>
								<div>
									<img src="/images/swimming-pool.png" alt="">수영장
								</div>
								<div>
									<img src="/images/park.png" alt="">마당
								</div>
							</div>
							<div class="cs_box2">
								<div>
									<img src="/images/wifi.png" alt="">무선 인터넷
								</div>
								<div>
									<img src="/images/antique-balcony.png" alt="">발코니
								</div>
								<div>
									<img src="/images/tv.png" alt="">넷플릭스 / 왓챠
								</div>
								<div>
									<img src="/images/air-conditioner.png" alt="">에어컨
								</div>
							</div>
						</div>
						<div class="additional_click">
							<span>추가 편의시설 더 보기</span><i id="additionalClick"
								class="fa-solid fa-chevron-down"></i>
						</div>
						<div class="additional_cs">
							<div class="cs_box1">
								<div>
									<img src="/images/drying-machine.png" alt="">세탁기
								</div>
							</div>
							<div class="cs_box2">
								<div>
									<img src="/images/drying-machine.png" alt="">건조기
								</div>
							</div>
						</div>
					</div>

					<div class="info_content_box6">
						<div class="rule_title">알아두어야 할 사항</div>
						<div class="rule_container">
							<div class="rule_box">
								<div class="rule_sub_title">숙소 이용 규칙</div>
								<div>
									<i class="fa-solid fa-clock"></i>체크인 : 오후 3:00 ~ 오후 10:00
								</div>
								<div>
									<i class="fa-solid fa-clock"></i>체크아웃 : 오전 10:00
								</div>
							</div>
							<div class="rule_box">
								<div class="rule_sub_title">환불 정책</div>
								<div>10월 6일 전까지 무료로 취소하실 수 있습니다.</div>
								<div class="rule_sub_long">
									<strong>부분 환불 : </strong>첫 1박을 제외한 나머지 숙박일에 대한 요금 중 50%를 환불받으실
									수 있습니다. 첫 1박 요금과 서비스 수수료는 환불되지 않습니다.
								</div>
							</div>
						</div>
					</div>
					<div class="info_content_box7">
						<div class="review_title">
							<img src="/images/star.png" alt="별점"> <span>4.37</span>
							<div>후기 300개</div>
						</div>
						<div class="review_content_container">
							<div class="review_content_box">
								<div class="review_user_content">
									<div class="user_img_box">
										<img src="/images/user.png" alt="">
									</div>
									<div class="review_info">
										<div class="nickname">냥냥</div>
										<div class="review_date">2022.01.22</div>
									</div>
									<div class="review_content">3층 테라스가 생각보다 넓었고, 거미가 좀 많긴
										했지만, 비오는 날 테라스 잘 이용했습니다! 화장실은 후기대로 좀 노화가 됬고, 청결도가 떨어지지만 그 외에
										시설 청결도는 만족스럽습니다. 이불이나 배게 기타 등등 냄새도 않나서 좋았습니다! 다음에 또 방문하고 싶습니다
									</div>
								</div>
								<div class="review_user_content">
									<div class="user_img_box">
										<img src="/images/user.png" alt="">
									</div>
									<div class="review_info">
										<div class="nickname">뇽뇽</div>
										<div class="review_date">2022.02.20</div>
									</div>
									<div class="review_content">더운날이었는데 체크인시간 말씀드렸더니 에어컨도
										틀어와주시는 센스!! 너무 잘쉬다 갑니다~</div>
								</div>
							</div>
							<div class="review_content_box">
								<div class="review_user_content">
									<div class="user_img_box">
										<img src="/images/user.png" alt="">
									</div>
									<div class="review_info">
										<div class="nickname">냠냠</div>
										<div class="review_date">2022.05.14</div>
									</div>
									<div class="review_content">숙소가 너무 좋았습니다 좋은 추억 만들었습니다!
										감사합니다</div>
								</div>
								<div class="review_user_content">
									<div class="user_img_box">
										<img src="/images/user.png" alt="">
									</div>
									<div class="review_info">
										<div class="nickname">멍멍</div>
										<div class="review_date">2022.07.21</div>
									</div>
									<div class="review_content">따뜻하고 안락한 느낌의 숙소였습니다 3층이라 무거운
										짐이 많거나 아이가 있는 분은 조심하셔야 할 것 같아요 그 외에는 수건도 충분하고, 침구도 편안했습니다 스마트
										티비라 넷플릭스도 볼 수 있었구요! 옆에 공터가 있어서 주차도 편했어요 :)</div>
								</div>
							</div>
						</div>
						<button class="review_more_btn">후기 더보기</button>
						<div class="black_bg">
							<div class="review_container">
								<div class="modal_review_title">
									<img src="/images/star.png" alt="별점"> <span>4.37</span>
									<div>후기 300개</div>
								</div>
								<div class="review_close"><i class="fa-regular fa-circle-xmark"></i></div>
								<div class="review_box">
									<div class="modal_user_review">
										<div class="modal_user_info">
											<img src="<c:url value='/images/user.png'/>">
											<div>
												<div class="modal_nickname">냠냠</div>
												<div class="modal_review_date">2022.05.14</div>
											</div>
										</div>
										<div class="modal_content">
										체크인도 너무 수월했고, 숙소도 기대 이상이었어요. 동네가 조용해서 날 좋을때 오면 구경도 하고 산책하면 좋을것 같았어요!!
										</div>
									</div>
									<div class="modal_user_review">
										<div class="modal_user_info">
											<img src="<c:url value='/images/user.png'/>">
											<div>
												<div class="modal_nickname">냠냠</div>
												<div class="modal_review_date">2022.05.14</div>
											</div>
										</div>
										<div class="modal_content">
										체크인도 너무 수월했고, 숙소도 기대 이상이었어요. 동네가 조용해서 날 좋을때 오면 구경도 하고 산책하면 좋을것 같았어요!!
										</div>
									</div>
									<div class="modal_user_review">
										<div class="modal_user_info">
											<img src="<c:url value='/images/user.png'/>">
											<div>
												<div class="modal_nickname">냠냠</div>
												<div class="modal_review_date">2022.05.14</div>
											</div>
										</div>
										<div class="modal_content">
										체크인도 너무 수월했고, 숙소도 기대 이상이었어요. 동네가 조용해서 날 좋을때 오면 구경도 하고 산책하면 좋을것 같았어요!!
										</div>
									</div>
									<div class="modal_user_review">
										<div class="modal_user_info">
											<img src="<c:url value='/images/user.png'/>">
											<div>
												<div class="modal_nickname">냠냠</div>
												<div class="modal_review_date">2022.05.14</div>
											</div>
										</div>
										<div class="modal_content">
										체크인도 너무 수월했고, 숙소도 기대 이상이었어요. 동네가 조용해서 날 좋을때 오면 구경도 하고 산책하면 좋을것 같았어요!!
										</div>
									</div>
									<div class="modal_user_review">
										<div class="modal_user_info">
											<img src="<c:url value='/images/user.png'/>">
											<div>
												<div class="modal_nickname">냠냠</div>
												<div class="modal_review_date">2022.05.14</div>
											</div>
										</div>
										<div class="modal_content">
										체크인도 너무 수월했고, 숙소도 기대 이상이었어요. 동네가 조용해서 날 좋을때 오면 구경도 하고 산책하면 좋을것 같았어요!!
										</div>
									</div>
									<div class="modal_user_review">
										<div class="modal_user_info">
											<img src="<c:url value='/images/user.png'/>">
											<div>
												<div class="modal_nickname">냠냠</div>
												<div class="modal_review_date">2022.05.14</div>
											</div>
										</div>
										<div class="modal_content">
										체크인도 너무 수월했고, 숙소도 기대 이상이었어요. 동네가 조용해서 날 좋을때 오면 구경도 하고 산책하면 좋을것 같았어요!!
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sticky_area">
					<div class="charge_area">
						<div>
							<span>95,000원</span><span> / 1박</span>
						</div>
						<div>
							<img src="/images/star.png" alt="별점"> <span>4.37</span>
							<div class="review_move">후기 300개</div>
						</div>
					</div>
					<div class="check_date">
						<div class="checkin">
							<div>체크인</div>
							<input type="text" id="rangepicker1" class="stay_date"
								name="daterange" autocomplete="off">
						</div>
						<div class="checkout">
							<div>체크아웃</div>
							<input type="text" id="rangepicker2" class="stay_date" name="daterange" autocomplete="off" spellcheck="false">
						</div>
						<div class="total_count">
							<span>인원수 | 반려동물 수</span> 
							<input type="text" class="info_content_count" id="infoCount" spellcheck="false">
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
					</div>
					<div class="charge_detail">
						<div class="charge_box1">
							<span>95,000원 x 2박</span><span>190,000원</span>
						</div>
						<div class="charge_box2">
							<span>청소비</span><span>15,000원</span>
						</div>
						<div class="charge_box3">
							<span>서비스 수수료</span><span>27,530원</span>
						</div>
						<div class="charge_box4">
							<span>숙박세와 수수료</span><span>2,753원</span>
						</div>
					</div>
					<div class="total_charge">
						<span>총합계</span> <span>235,283원</span>
					</div>
					<button class="book_btn">예약하기</button>
				</div>
			</article>
		</section>
		<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
	</section>
	 <!-- 복사 시 팝업 박스 -->
    <div id="copy_box">클립보드에 복사되었습니다. </div>
	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>