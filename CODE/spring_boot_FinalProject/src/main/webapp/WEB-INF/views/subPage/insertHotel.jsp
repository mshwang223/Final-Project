<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/insertHotel.css">
		
		<!-- js -->
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/insertHotel.js'/>"></script>
		
	</head>
	
	<body>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		
		<!-- middle -->
		<section>
			<div class="wrap_insert_box">
				<div class="tlt_insert"><div># 업체등록</div></div>
				<div class="whole_info_box">
					<div class="img_box">
						<i class="fa-solid fa-circle-plus add_img_file"></i>
						<div>(사진을 업로드 해주세요)</div>
					</div>
					<div class="hotel_insert_info">
						<div class="hotel_tlt">
							<p>업체명</p>
							<input type="text" class="input_hotel_name">
						</div>
						<br> 
						<div class="signup_address">
				            <p class="title">업체주소</p>
				            <input type="text" id="zipCode" class="zipcode" name="zipcode" readonly>
				            <button class="btn_zipcode">우편번호찾기</button><br>
				            <input type="text" id="address1" class="check_address1" placeholder="주소 입력"><br>
				            <input type="text" id="address2" class="check_address2" placeholder="상세 주소 입력">
          				</div>
          				<br>
          				<div class="hotel_phone">
          					<p>숙박 연락처</p>
          					<input type="text" class="input_phone" placeholder="'-' 없이 입력해주세요">
          				</div>
          				<br>
          				<div class="insert_hotel_price">
          					<p>숙박 가격</p>
          					<input type="text" class="input_price_hotel">
          				</div>
          				<br>
          				<div class="period_insert">
          					<p>등록기간</p>
          					<input type="text" id="rangepicker" class="stay_date" name="daterange" autocomplete="off" placeholder="날짜를 입력해 주세요">
          				</div>
          				<br>
          				<div class="stay_rule">
          					<p>특이사항</p>
          					<textarea class="input_stay_rule" type="text" id="stayRule" placeholder="이용수칙을 남겨주세요" maxlength=100;></textarea>
          				</div>
					</div>
				</div>
				<div class="insert_cancel_box">
					<div class="cxl_btn">취소</div>
					<div class="insert_btn">등록</div>
				</div>
			</div>
			<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>