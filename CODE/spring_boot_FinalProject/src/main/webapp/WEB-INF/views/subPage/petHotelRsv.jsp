<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		 <!-- header  -->
		 <c:import url="/WEB-INF/views/layout/header.jsp"/>
 		 <!-- css -->
 		 <link rel="stylesheet" type="text/css" href="<c:url value='/css/petHotelRsv.css'/>">
 		 <!-- js -->
 		 <script src="<c:url value='/js/petHotelRsv.js'/>"></script>
	</head>
	<body>
	<!-- top  -->
	<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<section class="wrap">
		<!-- middle -->
		<section class="sec_rsv_wrap">
			<div class="rsv_wrap">
				<div class="box_hotel_info">
					<div class="box_img_tlt">
						<div class="img_box"><img src="<c:url value='/images/stay2.jpg'/>"></div>
						<div class="info_txt_Box">
							<div class="info_tlt">콘래드 호텔</div>
							<div class="info_address"><i class="fa-solid fa-location-dot address_icon"></i>서울특별시 영등포구 국제금융로 10</div>
							<div class="info_period"><i class="fa-solid fa-calendar-days stay_calendar"></i>2022.08.20 ~ 2022.08.21</div>
							<div class="info_person_count"><i class="fa-solid fa-user person_icon"></i>성인 2인</div>
							<div class="info_bed"><i class="fa-solid fa-bed bed_icon"></i>더블침대 1개</div>
						</div>
					</div>
					<div class="box_type_price">
						<div class="room_type">디럭스 더블</div>
						<div class="ttl_price">352,000원</div>
					</div>
				</div>
				<div class="box_cus_info">
					<div class="first_cus_info">
						<div class="cus_info_tlt">투숙객 정보</div>
						<div class="name_rule">(투숙객 이름은 체크인 시 제시할 유효한 신분증 이름과 정확히 일치해야 합니다)</div>
						<div class="cus_name">
							<div class="tlt_all">투숙객명</div>
							<input type="text" id="cusName" class="input_cus_name">							
						</div>
						<div class="cus_phone">
							<div class="tlt_all">연락처</div>
							<input type="text" id="phNum" class="input_phone1">
						</div>
						<div class="cus_email">
							<div class="tlt_all">이메일</div>
							<input type="text" id="mailId" class="mail_id"> @
							<input type="text" id="mailAddress" class="mail_address" placeholder="직접입력">
							<select class="mail_address_select" id="cusSel" >
								<option value="" selected>직접입력</option>
								<option>naver.com</option>
					            <option>gmail.com</option>
					            <option>hanmail.net</option>
					            <option>hotmail.com</option>
							</select>
						</div>
					</div>
				</div>
				<div id="newCustomer" class="add_new_cus"><i id="plusBtn" class="fa-solid fa-plus add_customer"></i><span>투숙객 추가</span></div>
				<div class="box_cus_info2">
					<div class="first_cus_info">
						<div class="cus_info_tlt">투숙객 정보</div>
						<div class="name_rule">(투숙객 이름은 체크인 시 제시할 유효한 신분증 이름과 정확히 일치해야 합니다)</div>
						<div class="cus_name">
							<div class="tlt_all">투숙객명</div>
							<input type="text" class="input_cus_name">							
						</div>
						<div class="cus_phone">
							<div class="tlt_all">연락처</div>
							<input type="text" class="input_phone1">
						</div>
						<div class="cus_email">
							<div class="tlt_all">이메일</div>
							<input type="text" class="mail_id">@
							<input type="text" id="emailAddress" class="mail_address" placeholder="직접입력">
							<select class="mail_address_select" id="cusSel2" >
								<option value="" selected>직접입력</option>
								<option value="naver.com">naver.com</option>
					            <option value="gmail.com">gmail.com</option>
					            <option value="hanmail.net">hanmail.net</option>
					            <option value="hotmail.com">hotmail.com</option>
							</select>
						</div>
					</div>
				</div>
				<div class="contract_info_box">
         			<div class="introduce_contract">약관안내</div>
			        <div class="introduce_contract_box">
			        	<div class="agreement_a">(필수) 펫밀리가 떴다 이용 약관을 읽었으며 이에 동의합니다.</div>
			        	<div class="agreement_b">(필수) 펫밀리가 떴다 개인정보 처리방침 약관을 읽었으며 이에 동의합니다.</div>
			        	<div class="agreement_c">(필수) 펫밀리가 떴다 공급업체 서비스 약관 및 세금 명세 약관을 읽었으며 이에 동의합니다.</div>
			        </div>
			        <div class="agreement_check_final">
	          			<input type="checkbox" name="finalCheck" id="finalCheck" class="agree_text_final">위 약관을 확인 하였으며, 약관에 동의합니다
	        		</div>
        		</div>
			</div>
			<div class="follow_box">
				<div class="info_price">결제정보</div>
				<div class="price_per_night">
					<div class="one_night">1박 ~</div>
					<div class="one_night_price">352,000원</div>
				</div>
				<div id="insurancePrice" class="insurance_price">
					<i class="fa-solid fa-shield-dog"></i><span>펫밀리가 떴다 가격 보장제</span>
				</div>
				<div class="info_insurance">
					<p>펫밀리가 떴다는 고객님들께 가능한 한 최적의</p> 
					<p>가격을 제공해드리도록 노력합니다.</p>
					<p>다른 플랫폼에서 더 저렴한 상품을 찾으신 경우</p>
					<p>해당 차액을 환블해 드리겠습니다.</p>
				</div>
				<div class="final_price_box">
					<div class="price_txt">최종 금액</div>
					<div class="price_won">352,000원</div>
				</div>
				<button type="submit" id="finalPayBtn" class="final_pay_btn">예약하기</button>
			</div>
		</section>
	<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
	</section>
	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>