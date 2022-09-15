<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	          <form id="userFrm" method="post" action="<c:url value="/petHotelList/0"/>">
	          <div class="search_box">
	            <div class="in_box">
	              <div class="text_search_destination">
	                <div class="where_to">어디로 가시나요?</div>
	                <div class="dog_walk_box"><img src="<c:url value='/images/dog_walk.png'/>"></div>
	              </div>
	              <div class="box_input">
	                <div class="box_destination">
	                  <input type="text" id="btnDestination" class="input_destination"
	                  		 placeholder="목적지를 검색하세요" name="area" value="<c:url value="${map.area}"/>" readOnly>
	                  <input type="hidden" id="areaCode" name="areaCode" value="<c:url value="${map.areaCode}"/>">
	                </div>
	                <div class="box_daterange">
	                  <input type="text" id="rangepicker" class="stay_date" name="daterange" autocomplete="off" 
	                  		 placeholder="날짜를 입력해 주세요" value="<c:url value="${map.period}"/>" readOnly>
	                </div>
	                <div class="box_person_count">
	                  <input type="text" id="btnCount" class="txt_stay" name="count" placeholder="성인0, 반려동물1"  
	                  		 spellcheck="false" value="<c:url value="${map.count}"/>" readOnly>
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
	              	<c:forEach var="arealist" items="${areaLists}" varStatus="loop">	
	                <div class="list_location">
	                  <div class="location_detail">${arealist.stateName}
	                  	<input type="hidden" id="areaCode" value="<c:url value="${arealist.stateId}"/>">
	                  </div>
	                </div>
	                </c:forEach>
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
	          </form> 
	          <!-- 필터 영역 -->
	          <div class="filter_box">
	            <div class="ttl_hotel_list">검색 결과 총 ${rowCnt}개</div>
	            <input type="hidden" id="rowCnt" name="rowCnt" value="<c:url value='${rowCnt}'/>">
	            <div class="filter_popular">
	              <button id="btnFilter" class="result_filter_open"><span>전체</span><i id="arrowDown" class="fa-solid fa-angle-down"></i></button>
	              <ul class="result_filter_select">
	                <li class="result_filter_option" value="0">전체</li>
	                <li class="result_filter_option" value="1">평점순</li>
	                <li class="result_filter_option" value="2">가격 낮은 순</li>
	                <li class="result_filter_option" value="3">가격 높은 순</li>
	              </ul>
	            </div>
	          </div>
	          <!-- 호텔 리스트 영역 -->
	          <div class="list_box">
	          	<c:forEach var="list" items="${lists}" varStatus="loop">
		          	<form id="all${list.stayNo }" method="post" action="<c:url value='/petHotelDetail/stayNo=${list.stayNo }'/>">
		          		<input type="hidden" name="chk1" value="2">
			            <div id="resultHotelList${list.stayNo }" class="wrap_result_hotel_list">
			              <div class="result_hotel_img">
			              	<input type="hidden" id="${list.stayNo }" name="stayNo" value="<c:url value='${list.stayNo}'/>">
			              	<input type="hidden" id="rangepicker" name="daterange" value="${map.period}"/>
			              	<input type="hidden" name="count" value="${map.count}"/>
			                <%-- <img src="<c:url value='/images/${list.mainImg}'/>"> --%>
		                		<img src="<c:url value='/petHotelImg/${list.stayNo }/1.png'/>">
			              </div>
			              <div class="wrap_whole">
			                <div class="hotel_title">
			                  <p>${list.stayName}</p>
			                  <div><i class="fa-solid fa-star"></i>${list.star}</div>
			                </div>
			                <div class="wrap_date_Stay">
			                	${fn:substring(map.period,5,14) } ~ ${fn:substring(map.period,21,29) }
			                </div>
			                <div class="per_stay_price">
			                <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${list.price}" />원 / 1박
			                </div>
			              </div>
			              <span class="like_hover"><img src="<c:url value='/images/heart.png'/>" alt="찜하기" class="like_btn"></span>
			            </div>
			            <script>
			            	$('#resultHotelList${list.stayNo }').click(function(){
			            		$('#all${list.stayNo }').submit();
			            	});
			            </script>
			        </form>
	            </c:forEach> 
	          </div>
	        </div>
	      </div>
	    </section>
		<div class="chatbot_box">
			<div class="chat_head">
				<span class="chat_title">펫밀리 쳇봇입니다</span>
				<span id="btnClose" class="close_btn"><i class="fa-solid fa-xmark btn_x"></i></span>			
			</div>
			<!-- 채팅내용 출력 영역 -->
			<div id="chattingBox" class="chatting_box"></div>
			<div>
				<form class="chat_form" id="chatForm" name="chatForm">
					<input type="text" class="input_message" id="message" name="message" size="30"  placeholder="궁금한 사항을 물어봐주세요"/>
					<input type="submit" class="send_text" value="전송">
				</form>
			</div>
		</div>
		<img id="chatBot" class="chat_bot" src="<c:url value='/images/chatbot.png'/>">
		<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>