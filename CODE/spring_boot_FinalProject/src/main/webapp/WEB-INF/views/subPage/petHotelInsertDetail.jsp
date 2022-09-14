<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 양식다시제출 제거 -->
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
    <!-- header  -->
    <c:import url="/WEB-INF/views/layout/header.jsp"/>

    <!-- naver maps api -->
    <script type="text/javascript"
            src="<c:url value='https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dmtzzphj4x'/>"></script>

    <!-- lightbox -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/petHotelDetail.css'/>">
    <!-- js -->
    <script defer src="<c:url value='/js/clipboard.js'/>"></script>
    <script defer src="<c:url value='/js/petHotelDetail.js'/>"></script>

</head>

<body>
<!-- top  -->
<c:import url="/WEB-INF/views/layout/top.jsp"/>
<section class="wrap">

    <section>
        <article class="stay_detail">
            <div>
                <div class="stay_title">${list.stayName}</div>
                <div class="stay_sub_info">
                    <div class="stay_sub_box">
                        <img src="/images/star.png" alt="별점"> <span>${pointAvg}</span>
                        <div class="review_move">후기 ${reviewCount}개</div>
                    </div>
                    <div class="stay_pick">
                        <span>찜하기</span>
                        <img class="like_btn" src="/images/heart.png" alt="찜하기">
                    </div>
                </div>
            </div>
            <div class="stay_img_container">
                <div class="stay_img_box1">
                    <a href="<c:url value='/petHotelImg/${list.stayNo }/1.png'/>" data-lightbox="example"><img
                            src="<c:url value='/petHotelImg/${list.stayNo }/1.png'/>" alt=""></a>
                </div>
                <div class="stay_img_box2">
                    <c:forEach begin="2" end="10" step="1" varStatus="loop">
                        <a href="<c:url value='/petHotelImg/${list.stayNo }/${loop.index }.png'/>"
                           data-lightbox="example"><img
                                src="<c:url value='/petHotelImg/${list.stayNo }/${loop.index }.png'/>" alt="">
                            <div>+ 이미지 더보기</div>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </article>
        <article class="stay_info_area">
            <div class="info_content_area">
                <div class="info_content_box1">
                    <div class="content_title">${list.stayName}</div>
                    <div class="simple_info_box">
                        <span>침실 1개 · </span> <span>침대 1개 · </span>
                        <span>욕실 1개 · </span> <span>플레이그라운드</span>
                    </div>
                </div>
                <div class="info_content_box2">
                    <div class="location_box">
                        <img src="/images/location.png" alt=""><span class="spanWidth">주소 : </span>
                        <span id="address">${list.stayAddress}</span>
                        <i class="fa-regular fa-copy" id="locationCopy" data-clipboard-action="copy"
                           data-clipboard-target="#address"></i>
                        <p class="copy">Copy!</p>
                    </div>
                    <div class="contact_box">
                        <img src="/images/phone.png" alt=""><span class="spanWidth">연락처 : </span>
                        <span id="hotelCallNumber">${list.telNumber}</span>
                        <i class="fa-regular fa-copy" id="phoneCopy" data-clipboard-action="copy"
                           data-clipboard-target="#hotelCallNumber"></i>
                        <p class="copy">Copy!</p>
                    </div>
                </div>
                <div class="info_content_box5">
                    <div id="map" class="map"></div>
                    <input type="hidden" id="coordinate" value="<c:url value='${coordinate}'/>"/>
                </div>
                <c:if test="${not empty lists2}">
                    <div class="info_content_box3">
                        <div>숙박타입</div>
                        <c:forEach var="room" items="${lists2}" varStatus="loop">
                            <div>
                                <img src="<c:url value='/petHotelImg/${room.stayNo }/${room.roomImg}.png'/>" alt="">
                                <div class="room_box">
                                    <c:if test="${room.roomType eq 1}"><span># 스탠다드 더블</span></c:if>
                                    <c:if test="${room.roomType eq 2}"><span># 스탠다드 트윈</span></c:if>
                                    <div><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency"
                                                                                         value="${room.price}"/>원
                                    </div>
                                    <button class="room_btn">선택</button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <div class="info_content_box4">
                    <div>숙소 편의 시설</div>
                    <div class="cs_box">

                        <div class="cs_box1">
                            <c:forEach var="f1" items="${flist1}" varStatus="loop">
                                <div>
                                    <img src="/images/${f1.facilityImg}" alt="">${f1.facilityName}
                                </div>
                            </c:forEach>
                        </div>
                        <div class="cs_box2">
                            <c:forEach var="f2" items="${flist2}" varStatus="loop">
                                <div>
                                    <img src="/images/${f2.facilityImg}" alt="">${f2.facilityName}
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <c:if test="${not empty flist3}">
                        <div class="additional_click">
                            <span>추가 편의시설 더 보기</span><i id="additionalClick"
                                                        class="fa-solid fa-chevron-down"></i>
                        </div>


                        <div class="additional_cs">
                            <c:forEach var="f3" items="${flist3}" varStatus="loop">
                                <div class="cs_box${loop.count}">
                                    <div>
                                        <img src="/images/${f3.facilityImg}" alt="">${f3.facilityName}
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>

                <div class="info_content_box6">
                    <div class="rule_title">알아두어야 할 사항</div>
                    <div class="rule_container">
                        <div class="rule_box">
                            <div class="rule_sub_title">숙소 이용 규칙</div>
                            <div>
                                <i class="fa-solid fa-clock"></i>체크인 : ${list.checkIn}
                            </div>
                            <div>
                                <i class="fa-solid fa-clock"></i>체크아웃 : ${list.checkOut}
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
                        <img src="/images/star.png" alt="별점"> <span>${pointAvg}</span>
                        <div>후기 ${reviewCount}개</div>
                    </div>
                    <div class="review_content_container">
                        <div class="review_content_box">
                            <c:forEach items="${reviewList}" var="review" varStatus="status" end="3">
                                <div class="review_user_content">
                                    <div class="user_img_box">
                                        <img src="<c:url value='/userImg/${review.userId}'/>">
                                    </div>
                                    <div class="review_info">
                                        <div class="modal_nickname">${review.userId}</div>
                                        <div class="modal_review_date">${review.createDate}</div>
                                    </div>
                                    <div class="review_content"> ${review.contents}
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <button class="review_more_btn">후기 더보기</button>
                    <div class="black_bg">
                        <div class="review_container">
                            <div class="modal_review_title">
                                <img src="/images/star.png" alt="별점"> <span>${pointAvg}</span>
                                <div>후기 ${reviewCount}개</div>
                            </div>
                            <div class="review_close"><i class="fa-regular fa-circle-xmark"></i></div>
                            <div class="review_box">

                                <c:forEach items="${reviewList}" var="review" varStatus="status">
                                    <div class="modal_user_review">
                                        <div class="modal_user_info">
                                            <img src="<c:url value='/userImg/${review.userId}'/>">
                                            <div>
                                                <div class="modal_nickname">${review.userId}</div>
                                                <div class="modal_review_date">${review.createDate}</div>
                                            </div>
                                        </div>
                                        <div class="modal_content">
                                                ${review.contents}
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sticky_area">
                <div class="charge_area">
                    <div>
                        <span id="roomPrice"></span><span> / 1박</span>
                    </div>
                    <div>
                        <img src="/images/star.png" alt="별점"> <span>${pointAvg}</span>
                        <div class="review_move">${reviewCount}개</div>
                    </div>
                </div>
                <div class="check_date">
                    <div class="checkin">
                        <div>체크인</div>
                        <input type="text" id="rangepicker1" class="stay_date"
                               name="daterange" autocomplete="off" value="${fn:substring(map.period,5,14) }">
                    </div>
                    <div class="checkout">
                        <div>체크아웃</div>
                        <input type="text" id="rangepicker2" class="stay_date" name="daterange" autocomplete="off"
                               spellcheck="false" value="${fn:substring(map.period,21,29) }">
                    </div>
                    <div class="total_count">
                        <span>인원수 | 반려동물 수</span>

                        <form id="rsvForm" name="rsvForm" method="post" action="<c:url value="/petHotelRsv"/>">
                            <input type="text" class="info_content_count" id="infoCount" name="countAll"
                                   spellcheck="false" value="${map.count}">
                            <input type="hidden" id="roomType" name="roomType" value=""/>
                            <input type="hidden" id="rPrice" name="rPrice" value="0"/>
                            <input type="hidden" id="rangepicker" name="rangepicker" value="${map.period}"/>
                            <input type="hidden" id="discount" name="discount" value="0"/>
                            <input type="hidden" id="total" name="total" value=""/>
                            <input type="hidden" id="diffDay" name="diffDay" value=""/>
                            <input type="hidden" id="stayNo" name="stayNo" value="<c:url value='${list.stayNo}'/>">
                        </form>

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
                                    <span id="personPlusBtn"
                                          class="btn_popup_count btn_adult_plus btn_count_active">+</span>
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
                        <span>서비스 수수료</span><span>30,000원</span>
                    </div>
                    <div class="charge_box4">
                        <span>숙박세와 수수료</span><span>3,000원</span>
                    </div>
                    <c:if test="${petChkYn eq 'Y'}">
                        <div class="charge_box5">
                            <span>펫등록증 (30%)할인</span>
                            <span><button id="dicntClick" class="dicntClick">클릭!</button></span>
                        </div>
                        <form id="petForm" name="petForm" class="dicnt-dropBox">
                            <div class="btnUpload_box">
                                <button id="cancel" type="button">취소</button>
                                <button id="confirm" type="button">확인</button>
                            </div>
                            <div class="uploadImg-box">
                                <img id="profile_img_preview" src="<c:url value='/images/bgpetCard.png'/>"/>
                                <i class="fa-solid fa-circle-plus add_img_file"></i>
                                <input type="file" id="uploadFile" name="uploadFile" style="display:none"/>
                                <div>(등록증을 업로드 하세요)</div>
                            </div>
                            <div class="btn_signup_box">
                                <button type="submit" class="btn_signup_done">적용</button>
                            </div>
                        </form>
                        <div class="disCount_total">
                            <span>할인 가격</span><span>0원</span>
                        </div>
                    </c:if>
                </div>
                <div class="total_charge">
                    <span>총합계</span> <span>0원</span>
                </div>
                <button class="book_btn">예약하기</button>


            </div>
        </article>
    </section>
	<div id="chatbotBox" class="chatbot_box">
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
<!-- 복사 시 팝업 박스 -->
<div id="copy_box">클립보드에 복사되었습니다.</div>
<!-- footer -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>