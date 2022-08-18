<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<!-- header  -->
	<c:import url="/WEB-INF/views/layout/header.jsp"/>
	<head>
		 <!-- daterangepicker -->
 		 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
 		 <script src="../js/moment.min.js"></script>
 		 <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
 		 <script defer src="../js/daterangepicker.js"></script>
 		 <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
 		 <!-- js -->
 		 <script src="<c:url value='/petHotelList.js'/>"></script>
	</head>
	<body>
		<!-- middle -->
		<section class="list_wrap">
	      <div class="ttl_pethotel">
	        <div class="text_box">
	          <div class="box_center">
	            <div>#반려동물과 함께 하는 호텔 / 펜션</div>
	          </div>
	        </div>
	      </div>
	      <!-- 메인 리스트 -->
	      <div class="list_main">
	        <div class="main_box">
	          <div class="search_box">
	            <div class="in_box">
	              <div class="text_search_destination">
	                <div class="where_to">어디로 가시나요?</div>
	                <div class="dog_walk_box"><img src="../images/dog_walk.png"></div>
	              </div>
	              <div class="box_input">
	                <div class="box_destination">
	                  <input type="text" id="btnDestination" class="input_destination" placeholder="지역">
	                </div>
	                <div class="box_daterange">
	                  <input type="text" id="rangepicker" class="stay_date" name="daterange" autocomplete="off" placeholder="날짜를 입력해 주세요">
	                </div>
	                <div class="box_person_count">
	                  <input type="text" id="btnCount" class="txt_stay" placeholder="인원수 | 반려동물 수">
	                </div>
	                <button class="search_list_btn">
	                  <div>
	                    <span>검색</span>
	                    <img src="../images/search.png" alt="검색">
	                  </div>
	                </button>
	              </div>
	            </div>
	            <!-- 검색팝업 영역 -->
	            <div class="popup_space">
	              <div class="search_option">
	                <div class="list_location">
	                  <div class="location_detail">서울</div>
	                </div>
	                <div class="list_location">
	                  <div class="location_detail">경기도</div>
	                </div>
	                <div class="list_location">
	                  <div class="location_detail">강원도</div>
	                </div>
	                <div class="list_location">
	                  <div class="location_detail">부산</div>
	                </div>
	                <div class="list_location">
	                  <div class="location_detail">광주</div>
	                </div>
	                <div class="list_location">
	                  <div class="location_detail">제주도</div>
	                </div>
	              </div>
	              <div class="person_count_option">
	                <h4 class="tlt_popup_person">인원 선택</h4>
	                <div class="div_person_count">
	                  <div class="box_txt_person">
	                    <span class="txt_person_main">성인</span>
	                    <span class="txt_person_sub">만 18세 이상</span>
	                  </div>
	                  <div class="box_plus_minus">
	                    <a id="personMinusBtn" class="btn_popup_count">-</a>
	                    <span id="personCount" class="popup_count_person">1</span>
	                    <a href="#" id="personPlusBtn" class="btn_popup_count btn_adult_plus btn_count_active">+</a>
	                  </div>
	                </div>
	                <div class="div_person_count">
	                  <div class="box_txt_person">
	                    <span class="txt_person_main">반려동물</span>
	                    <span class="txt_person_sub">강아지 | 고양이</span>
	                  </div>
	                  <div class="box_plus_minus">
	                    <a id="petMinusBtn" class="btn_popup_count">-</a>
	                    <span id="petCount" class="popup_count_person">1</span>
	                    <a href="#" id="petPlusBtn" class="btn_popup_count btn_count_active">+</a>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <!-- 팝업영역 끝 -->
	          </div>
	          <!-- 필터 영역 -->
	          <div class="filter_box">
	            <div class="ttl_hotel_list">검색 결과 총 8개</div>
	            <div class="filter_popular">
	              <button id="btnFilter" class="result_filter_open"><span>추천순</span><i id="arrowDown" class="fa-solid fa-angle-down"></i></button>
	              <ul class="result_filter_select">
	                <li class="result_filter_option1">추천순</li>
	                <li class="result_filter_option2">평점순</li>
	                <li class="result_filter_option3">가격 낮은 순</li>
	                <li class="result_filter_option4">가격 높은 순</li>
	              </ul>
	            </div>
	          </div>
	          <!-- 호텔 리스트 영역 -->
	          <div class="list_box">
	            <div class="wrap_result_hotel_list">
	              <div class="result_hotel_img">
	                <img src="../images/stay2.jpg">
	              </div>
	              <div class="wrap_whole">
	                <div class="hotel_title">
	                  <p>콘래드 호텔</p>
	                  <div><i class="fa-solid fa-star"></i>4.5</div>
	                </div>
	                <div class="wrap_date_Stay">8월20일 ~ 8월21일</div>
	                <div class="per_stay_price">352,000원 / 1박</div>
	              </div>
	            </div>
	            <div class="wrap_result_hotel_list">
	              <div class="result_hotel_img">
	                <img src="../images/stay2.jpg">
	              </div>
	              <div class="wrap_whole">
	                <div class="hotel_title">
	                  <p>콘래드 호텔</p>
	                  <div><i class="fa-solid fa-star"></i>4.5</div>
	                </div>
	                <div class="wrap_date_Stay">8월20일 ~ 8월21일</div>
	                <div class="per_stay_price">352,000원 / 1박</div>
	              </div>
	            </div>
	            <div class="wrap_result_hotel_list">
	              <div class="result_hotel_img">
	                <img src="../images/stay2.jpg">
	              </div>
	              <div class="wrap_whole">
	                <div class="hotel_title">
	                  <p>콘래드 호텔</p>
	                  <div><i class="fa-solid fa-star"></i>4.5</div>
	                </div>
	                <div class="wrap_date_Stay">8월20일 ~ 8월21일</div>
	                <div class="per_stay_price">352,000원 / 1박</div>
	              </div>
	            </div>
	            <div class="wrap_result_hotel_list">
	              <div class="result_hotel_img">
	                <img src="../images/stay2.jpg">
	              </div>
	              <div class="wrap_whole">
	                <div class="hotel_title">
	                  <p>콘래드 호텔</p>
	                  <div><i class="fa-solid fa-star"></i>4.5</div>
	                </div>
	                <div class="wrap_date_Stay">8월20일 ~ 8월21일</div>
	                <div class="per_stay_price">352,000원 / 1박</div>
	              </div>
	            </div>
	            <div class="wrap_result_hotel_list">
	              <div class="result_hotel_img">
	                <img src="../images/stay2.jpg">
	              </div>
	              <div class="wrap_whole">
	                <div class="hotel_title">
	                  <p>콘래드 호텔</p>
	                  <div><i class="fa-solid fa-star"></i>4.5</div>
	                </div>
	                <div class="wrap_date_Stay">8월20일 ~ 8월21일</div>
	                <div class="per_stay_price">352,000원 / 1박</div>
	              </div>
	            </div>
	            <div class="wrap_result_hotel_list">
	              <div class="result_hotel_img">
	                <img src="../images/stay2.jpg">
	              </div>
	              <div class="wrap_whole">
	                <div class="hotel_title">
	                  <p>콘래드 호텔</p>
	                  <div><i class="fa-solid fa-star"></i>4.5</div>
	                </div>
	                <div class="wrap_date_Stay">8월20일 ~ 8월21일</div>
	                <div class="per_stay_price">352,000원 / 1박</div>
	              </div>
	            </div>
	            <div class="wrap_result_hotel_list">
	              <div class="result_hotel_img">
	                <img src="../images/stay2.jpg">
	              </div>
	              <div class="wrap_whole">
	                <div class="hotel_title">
	                  <p>콘래드 호텔</p>
	                  <div><i class="fa-solid fa-star"></i>4.5</div>
	                </div>
	                <div class="wrap_date_Stay">8월20일 ~ 8월21일</div>
	                <div class="per_stay_price">352,000원 / 1박</div>
	              </div>
	            </div>
	            <div class="wrap_result_hotel_list">
	              <div class="result_hotel_img">
	                <img src="../images/stay2.jpg">
	              </div>
	              <div class="wrap_whole">
	                <div class="hotel_title">
	                  <p>콘래드 호텔</p>
	                  <div><i class="fa-solid fa-star"></i>4.5</div>
	                </div>
	                <div class="wrap_date_Stay">8월20일 ~ 8월21일</div>
	                <div class="per_stay_price">352,000원 / 1박</div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </section>
		<img class="top_btn" src="<c:url value='/top_dog.png'/>">
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>