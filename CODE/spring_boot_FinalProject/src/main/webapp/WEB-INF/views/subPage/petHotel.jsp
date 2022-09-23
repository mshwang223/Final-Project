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
				<form id="userFrm" class="reservation_box" method="post" action="<c:url value="/petHotelList/0"/>">
					<div class="search_area">
						<div>
							<div class="search_area_title">
								지역<img src="<c:url value='/images/location.png'/>" alt="지역">
							</div>
							<input type="text" class="search_box" id="searchBox" name="area"
								placeholder="목적지를 검색하세요" autocomplete="off" readOnly>
							<input type="hidden" id="areaCode" name="areaCode">
						</div>
						<div class="search_pop" id="searchPop">
							<ul id="searchList">
								<c:forEach var="list" items="${lists}" varStatus="loop">
									<li value="${list.stateId}">${list.stateName}</li>
								</c:forEach>
							</ul>
						</div>
					</div>
<%-- 					<div class="option_area"> 
						<div>
							<div class="option_area_title">
								옵션<img src="<c:url value='/images/choice.png'/>" alt="옵션">
							</div>
							<div class="option_box" id="optionBox" autocomplete="off"></div>
						</div>
						<div class="option_pop" id="optionPop">
							<div>
								<span class="option_span" id="option1">픽업</span>
								<span class="option_span" id="option2">촬영</span>
								<span class="option_span" id="option3">패키지</span>
								<span class="option_span" id="option4">풀장</span>
							</div>
						</div>
					</div> --%>
					<div class="date_area">
						<div>
							<div class="date_area_title">
								날짜<img src="<c:url value='/images/calendar.png'/>" alt="날짜">
							</div>
							<input type="text" id="rangepicker" class="stay_date"
								name="daterange" autocomplete="off" value="날짜를 입력해주세요" readOnly>
						</div>
					</div>
					<div class="count_area">
						<div>
							<div class="count_area_title">
								인원수 | 반려동물 수<img src="<c:url value='/images/owner.png'/>" alt="구성원 수">
							</div>
							<input type="text" class="count_box" id="btnCount" name="count" autocomplete="off" value="성인0, 반려동물1" spellcheck="false" readOnly>
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
					<div class="stay_container"  id="specialContainer">
						<c:forEach var="approveList" items="${approveList}"  varStatus="status">
							<form id="special${approveList.regId }" class="like_insert" method="post" action="<c:url value='petHotelDetail/${approveList.regId }'/>">
								<input type="hidden" name="chk1" value="1">
								<input type="hidden" id="userId" name="userId" value="${sessionScope.sid }">
								<input type="hidden" id="regId" name="regId" value="${approveList.regId }">
								<input type="hidden" name="serviceImg" value="${fn:split(approveList.serviceImg,'.')[0]}">
								<div id="specialBox${approveList.regId }" class="special_img_box">
									<img src="<c:url value='/comImg/${fn:split(approveList.serviceImg,".")[0]}/1.png'/>" alt="">
									<div class="stay_info">
										<div class="stay_name">
											<span>${approveList.name }</span>
										</div> 
										<div>${approveList.period}</div>
										<input type="hidden" name="startDate" value="${fn:substring(approveList.period,5,14) }">
										<input type="hidden" name="endDate" value="${fn:substring(approveList.period,21,29) }">
										<div><fmt:formatNumber type="currency" value="${approveList.price}" />원 / 1박</div>
									</div>
										<span class="like_hover">
											<img src="<c:url value='/images/heart.png'/>" alt="찜하기" class="like_btn" data-id="${approveList.regId }" data-flag="regId" data-img="${fn:split(approveList.serviceImg,'.')[0]}">
										</span>
								</div>
								<script>
								    $('#specialBox${approveList.regId}').click(function(){
								    	$('#special${approveList.regId}').submit();
								    })
								</script>
							</form>
						</c:forEach>	
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
					<div class="stay_container"  id="popularContainer">
						<c:forEach begin="22" end="32" var="stayList" items="${stayList}" varStatus="status">
							<form id="popular${stayList.stayNo }" class="like_insert" method="post" action="<c:url value='petHotelDetail/stayNo=${stayList.stayNo }'/>">
								<input type="hidden" name="chk1" value="2">
								<input type="hidden" name="userId" value="${sessionScope.sid }">
								<input type="hidden" class="likeStayNo" name="likeStayNo" value="${stayList.stayNo }">
								<div id="popularBox${stayList.stayNo }" class="popular_img_box">
									<input type="hidden" id="stayNo" name="stayNo" value="<c:url value='${stayList.stayNo}'/>">
									<img src="<c:url value='/petHotelImg/${stayList.stayNo }/1.png'/>" alt="">
									<div class="stay_info">
										<div class="stay_name">
											<span>${stayList.stayName}</span><span class="stay_star"><img
												src="<c:url value='/images/star.png'/>" alt="평점">${stayList.star }</span>
										</div>
										<div><fmt:formatNumber type="currency" value="${stayList.price}" />원 / 1박</div>
									</div>
									<span class="like_hover">
												<img src="<c:url value='/images/heart.png'/>"  alt="찜하기" class="like_btn" data-id="${stayList.stayNo }" data-flag="stayNo" data-img=${stayList.stayNo }>
									</span>
								</div>
								<script>
							    $('#popularBox${stayList.stayNo }').click(function(){
							    	$('#popular${stayList.stayNo}').submit();
							    })
								</script>
							</form>
						</c:forEach>
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
					<div class="stay_container"  id="seoulContainer">
						<c:forEach begin="2" end="11" var="stayList" items="${stayList}">
							<form id="seoul${stayList.stayNo }" class="like_insert" method="post" action="<c:url value='petHotelDetail/stayNo=${stayList.stayNo }'/>">
								<input type="hidden" name="chk1" value="2">
								<input type="hidden" name="userId" value="${sessionScope.sid }">
								<div id="seoulBox${stayList.stayNo }" class="seoul_img_box">
									<img src="<c:url value='/petHotelImg/${stayList.stayNo }/1.png'/>" alt="">
									<div class="stay_info">
										<div class="stay_name">
											<span>${stayList.stayName}</span><span class="stay_star"><img
												src="<c:url value='/images/star.png'/>" alt="평점">${stayList.star }</span>
										</div>
										<div><fmt:formatNumber type="currency" value="${stayList.price}" />원 / 1박</div>
									</div>
									<span class="like_hover">
												<img src="<c:url value='/images/heart.png'/>"  alt="찜하기" class="like_btn" data-id="${stayList.stayNo }" data-flag="stayNo" data-img=${stayList.stayNo }>
									</span>
								</div>
								<script>
							    $('#seoulBox${stayList.stayNo }').click(function(){
							    	$('#seoul${stayList.stayNo}').submit();
							    })
								</script>
							</form>
						</c:forEach>
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
					<div class="stay_container"  id="busanContainer">
						<c:forEach begin="81" end="90" var="stayList" items="${stayList}" varStatus="status">
							<form id="busan${stayList.stayNo }" class="like_insert" method="post" action="<c:url value='petHotelDetail/stayNo=${stayList.stayNo }'/>">
								<input type="hidden" name="chk1" value="2">
								<input type="hidden" name="userId" value="${sessionScope.sid }">
								<div id="busanBox${stayList.stayNo }" class="busan_img_box">
									<img src="<c:url value='/petHotelImg/${stayList.stayNo }/1.png'/>" alt="">
									<div class="stay_info">
										<div class="stay_name">
											<span>${stayList.stayName }</span><span class="stay_star"><img
												src="<c:url value='/images/star.png'/>" alt="평점">${stayList.star }</span>
										</div>
										<div><fmt:formatNumber type="currency" value="${stayList.price}" />원 / 1박</div>
									</div>
									<span class="like_hover">
												<img src="<c:url value='/images/heart.png'/>"  alt="찜하기" class="like_btn" data-id="${stayList.stayNo }" data-flag="stayNo" data-img=${stayList.stayNo }>
									</span>
								</div>
								<script>
								
							    $('#busanBox${stayList.stayNo }').click(function(){
							    	$('#busan${stayList.stayNo}').submit();
							    })
								</script>
							</form>
						</c:forEach>
					</div>
					<img class="busan_prev" src="<c:url value='/images/left-arrow.png'/>" alt=""> <img
						class="busan_next" src="<c:url value='/images/next.png'/>" alt="">
				</div>
			</article>
	
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
					<input type="text" class="input_message" id="message" name="message" size="30" autocomplete="off" placeholder="궁금한 사항을 물어봐주세요"/>
					<input type="submit" class="send_text" value="전송">
				</form>
			</div>
		</div>
		<img id="chatBot" class="chat_bot" src="<c:url value='/images/chatbot.png'/>">
		<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
	</section>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
<script type="text/javascript">
$(document).ready(function(){
	
    <c:forEach var="likeRegList" items="${likeRegList}">
	    $('img[class=like_btn]').each(function(){
	        if($(this).data('id') == "${likeRegList.regId}")
	           $(this).attr('src', '/images/red_heart.png')
	     });
	 </c:forEach>
	 <c:forEach var="likeStayList" items="${likeStayList}">
		 $('img[class=like_btn]').each(function(){
		      if($(this).data('id') == "${likeStayList.stayNo}")
		         $(this).attr('src', '/images/red_heart.png')
		   });
	 </c:forEach>

});
</script>
</html>