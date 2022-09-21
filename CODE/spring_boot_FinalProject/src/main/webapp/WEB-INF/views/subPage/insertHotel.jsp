<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<form id="fileUploadFormMulti" method="post" enctype="multipart/form-data" class="wrap_insert_box">
				<div class="tlt_insert"><div># 업체등록</div></div>
				<div class="whole_info_box">
					<p>* 기간한정 특가 호텔을 등록해 주세요!</p>
					<div class="hotel_insert_info">
						<div class="filebox">
							<input type="hidden" id="userId" name="userId" value="<c:url value='${sessionScope.sid}'/>">
						    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
						    <label for="file">파일찾기</label> 
						    <input type="file" id="file" name="uploadFile">
						</div>
										
						<div class="hotel_tlt">
							<p>업체명</p>
							<input type="text" id="inputHotelName" name="inputHotelName" class="input_hotel_name" autocomplete="off">
						</div>
						<br> 
						<div class="signup_address">
				            <p class="title">업체주소</p>
				            <input type="text" id="zipCode" class="zipcode" name="zipcode" readonly>
				            <button type="button" class="btn_zipcode">우편번호찾기</button><br>
				            <input type="text" id="address1" name="address1" class="check_address1" placeholder="주소 입력"><br>
				            <input type="text" id="address2" name="address2" class="check_address2" placeholder="상세 주소 입력">
          				</div>
          				<br>
          				<div class="hotel_phone">
          					<p>숙박 연락처</p>
          					<input type="text" name="inputPhone" class="input_phone" placeholder="'-' 없이 입력해주세요">
          				</div>
          				<br>
          				<div class="insert_hotel_price">
          					<p>숙박 가격</p>
          					<input type="text" id="inputPrice" name="inputPrice" class="input_price_hotel">
          				</div>
          				<br>
          				<div class="limit_person">
          					<p>제한 인원수</p>
          					<input type="text" id="inputLimitPerson" name="inputLimitPerson" class="input_limit_person">
          				</div>
          				<br>
          				<div class="limit_pet">
          					<p>제한 반려동물 수</p>
          					<input type="text" id="inputLimitPet" name="inputLimitPet" class="input_limit_pet">
          				</div>
          				<br>
          				<div class="room_type">
          					<p>방 타입을 적어주세요</p>
          					<input type="text" id="inputRoom" name="inputRoom" class="input_room_type">
          				</div>
          				<br>
          				<div class="comp_service">
          					<p>제공 서비스</p>
          					<div class="box_service">
          						<span>픽업<input type="checkbox" id="pickUp" name="service" class="box_comp_service" value="픽업"></span>
          						<span>넷플릭스<input type="checkbox" id="streaming" name="service" class="box_comp_service" value="넷플릭스"></span>
          						<span>와이파이<input type="checkbox" id="wireless" name="service" class="box_comp_service" value="와이파이"></span>
          						<span>돌봄서비스<input type="checkbox" id="petCare" name="service" class="box_comp_service" value="돌봄서비스"></span>
          					</div>
          				</div>
          				<br>
          				<div class="comp_facility">
          					<p>제공 시설</p>
          					<div class="box_facility">
          						<span>주방<input type="checkbox" id="kitchen" name="provide" class="box_comp_facility" value="주방"></span>
          						<span>주차공간<input type="checkbox" id="parkingLot" name="provide" class="box_comp_facility" value="주차공간"></span>
          						<span>수영장<input type="checkbox" id="swimPool" name="provide" class="box_comp_facility" value="수영장"></span>
          						<span>마당<input type="checkbox" id="yard" name="provide" class="box_comp_facility" value="마당"></span>
          					</div>
          				</div>
          				<br>
          				<div class="comp_add_facility">
          					<p>추가 시설</p>
          					<div class="box_add_facility">
          						<span>세탁기<input type="checkbox" id="cleanMachine" name="additional" class="box_comp_add_facility" value="세탁기"></span>
          						<span>건조기<input type="checkbox" id="dryMachine" name="additional" class="box_comp_add_facility" value="건조기"></span>
          						<span>욕실용품<input type="checkbox" id="bathKit" name="additional" class="box_comp_add_facility" value="욕실용품"></span>
          						<span>에어컨<input type="checkbox" id="ariCon" name="additional" class="box_comp_add_facility" value="에어컨"></span>
          					</div>
          				</div>
          				<br>                				            				
          				<div class="period_insert">
          					<p>등록기간</p>
          					<input type="text" id="rangepicker" class="stay_date" name="daterange" autocomplete="off" placeholder="날짜를 입력해 주세요">
          				</div>
          				<br>
          				<div class="stay_rule">
          					<p>특이사항</p>
          					<textarea class="input_stay_rule" type="text" id="stayRule" name="stayRule" placeholder="이용수칙을 남겨주세요" maxlength=100;></textarea>
          				</div>
					</div>
				</div>
				<div class="insert_cancel_box">
					<div class="cxl_btn">취소</div>
					<button type="submit" id="registerBtn" class="insert_btn">등록</button>
				</div>
			</form>
			
			<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>