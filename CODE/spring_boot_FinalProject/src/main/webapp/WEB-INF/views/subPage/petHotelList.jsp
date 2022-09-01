<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 양식제출 안뜨게함!--!>
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
		 <c:import url="/WEB-INF/views/layout/header.jsp"/>
		 <!-- daterangepicker -->
 		 <link rel="stylesheet" type="text/css" href="<c:url value='/css/daterangepicker.css'/>">
 		 <!-- css -->
 		 <link rel="stylesheet" type="text/css" href="<c:url value='/css/petHotelList.css'/>">
 		 <!-- js -->
 		 <script src="<c:url value='/js/petHotelList.js'/>"></script>
	</head>
	<body>
	<!-- top  -->
	<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<section class="wrap">
	
		<!-- middle -->
		<section class="list_wrap">
	      <div class="ttl_pethotel">
	        <div class="text_box">
	          <div class="box_center">
	            <div># 반려동물과 함께 하는 호텔 / 펜션</div>
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
	                <div class="dog_walk_box"><img src="<c:url value='/images/dog_walk.png'/>"></div>
	              </div>
	              <div class="box_input">
	                <div class="box_destination">
	                  <input type="text" id="btnDestination" class="input_destination" 
	                  		 placeholder="목적지를 검색하세요" value="<c:url value="${map.area}"/>">
	                </div>
	                <div class="box_daterange">
	                  <input type="text" id="rangepicker" class="stay_date" name="daterange" autocomplete="off" 
	                  		 placeholder="날짜를 입력해 주세요" value="<c:url value="${map.period}"/>">
	                </div>
	                <div class="box_person_count">
	                  <input type="text" id="btnCount" class="txt_stay" placeholder="성인0, 반려동물1"  
	                  		 spellcheck="false" value="<c:url value="${map.count}"/>">
	                </div>
	                <button id="listSearchBtn" class="search_list_btn">
	                  <div>
	                    <span>검색</span>
	                    <img src="<c:url value='/images/search.png'/>" alt="검색">
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
	                    <span id="personMinusBtn" class="btn_popup_count">-</span>
	                    <span id="personCount" class="popup_count_person">0</span>
	                    <span id="personPlusBtn" class="btn_popup_count btn_adult_plus btn_count_active">+</span>
	                  </div>
	                </div>
	                <div class="div_person_count">
	                  <div class="box_txt_person">
	                    <span class="txt_person_main">반려동물</span>
	                    <span class="txt_person_sub">강아지 | 고양이</span>
	                  </div>
	                  <div class="box_plus_minus">
	                    <span id="petMinusBtn" class="btn_popup_count">-</span>
	                    <span id="petCount" class="popup_count_person">1</span>
	                    <span id="petPlusBtn" class="btn_popup_count btn_count_active">+</span>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <!-- 팝업영역 끝 -->
	          </div>
	          <!-- 필터 영역 -->
	          <div class="filter_box">
	            <div class="ttl_hotel_list">검색 결과 총 ${rowCnt}개</div>
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
	          	<c:forEach var="list" items="${lists}" varStatus="loop">
	            <div id="resultHotelList" class="wrap_result_hotel_list">
	              <div class="result_hotel_img">
	              	<input type="hidden" id="stayNo" name="stayNo" value="<c:url value='${list.stayNo}'/>">
	                <%-- <img src="<c:url value='/images/${list.mainImg}'/>"> --%>
	                <img src="<c:url value='/images/stay2.jpg'/>">
	              </div>
	              <div class="wrap_whole">
	                <div class="hotel_title">
	                  <p>${list.stayName}</p>
	                  <div><i class="fa-solid fa-star"></i>${list.star}</div>
	                </div>
	                <div class="wrap_date_Stay">
	                	${period}
	                </div>
	                <div class="per_stay_price">
	                <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${list.price}" />원 / 1박
	                </div>
	              </div>
	              <span class="like_hover"><img src="<c:url value='/images/heart.png'/>" alt="찜하기" class="like_btn"></span>
	            </div>
	            </c:forEach> 
	          </div>
	        </div>
	      </div>
	    </section>
		<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>