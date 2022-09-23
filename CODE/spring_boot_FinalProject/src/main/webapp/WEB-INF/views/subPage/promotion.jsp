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
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/promotion.css'/>">
<!-- js -->
<script src="<c:url value='/js/promotion.js'/>"></script>
</head>
<body>
	<!-- top  -->
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<section class="wrap">

		<!-- middle -->
		<section class="promotion_menu">
			<div class="wrap_pro_box">
				<div class="main_pro_txt">
					<div class="main_pro_tlt"># 이달의 프로모션</div>
				</div>
				<div class="whole_pro_box">
					<div class="promotion_txt_img">
						<div class="promotion_img">
							<img class="main_img" src="<c:url value='/images/dogsuffing.jpg'/>">
						</div>
						<div class="promotion_txt">
							<div class="main_txt">
								<img src="<c:url value='/images/search.png'/>">무더운 여름, 반려가족과 함께 수상레저를!
							</div>
							<div class="sub_txt">
								반려가족을 위한 특별한 선물!<br>
								<br> 자연을 느낄 수 있는, 야외 레저활동을 경험해 보세요!<br>
								<br> 사랑스러운 반려가족과 함께하면 행복은 두 배!<br>
								<br>
							</div>
							<button type="submit" id="btnView" class="view_detail">상세 보기</button>
						</div>
					</div>
					<div id="showDetail" class="sub_info_detail">
						<div class="info_detail_period">
							<span><img src="<c:url value='/images/search.png'/>">적용기간 :</span>
							<span class="sub_period">2022.08.08 ~ 2022.09.30</span>
						</div>
						<div class="info_detail_profit">
							<span><img src="<c:url value='/images/search.png'/>">적용혜택 :</span>
							<div class="whole_profit">
								<div class="first_profit">
									▶ 반려동물 구명조끼 제공<br><br>
									▶ 반려동물과 함께 서핑 액티비티 활동(2시간권 제공)<br><br>
									▶ 반려동물 간식 함께 제공
								</div>
								<div class="second_profit">
									▶ 성인 조식 1인 포함(추가시 성인 1인 35,000원)<br><br>
									▶ 무료 픽업 서비스(차량이 없는 경우)<br><br>
									▶ 객실 포함 요금 15% 할인 적용
								</div>
							</div>
						</div>
						<div class="use_rule">
							<span><img src="<c:url value='/images/search.png'/>">이용수칙 :</span>
							<div class="whole_rule">
								<div class="first_rule">
									▶ 한정 수량 객실 패키지 입니다<br><br>
									▶ 객실내 대여품목은 가져가실 수 없습니다<br><br>
									▶ 객실 반려동물 대여품 파손시 부담금이 발생합니다
								</div>
								<div class="second_rule">
									▶ 우천 및 자연재해시 예약이 불가능합니다<br><br>
									▶ 본 패키지는 시즌별 상품으로 해당 기간에만 적용가능합니다<br><br>
									▶ 본 패키지는 연박이 불가능합니다
								</div>
							</div>
						</div>
						<button type="submit" class="search_pro_room">객실요금조회</button>
					</div>
				</div>
				<div class="sub_pro_txt">
					<div class="sub_pro_tlt"># 강아지와 함께 추억 패키지</div>
				</div>
				<div class="whole_subpro_box">
					<div class="sub_promotion_txt_img">
						<div class="sub_promotion_img">
							<img class="sub_img" src="<c:url value='/images/photo1.jpg'/>"> 
							<img class="photo_plus" src="<c:url value='/images/plus.png'/>">
							<img class="sub_img" src="<c:url value='/images/photo3.jpg'/>">
						</div>
						<div class="promotion_txt">
							<div class="sub_main_txt">
								<img src="<c:url value='/images/search.png'/>">반려가족과 한컷, 추억남기기~!
							</div>
							<div class="sub_txt">
								<div class="sub_txt">
									사람만 찍냐? 이제 반려가족도 찍는다~<br>
									<br> 반려가족과 함께 화보촬영을 해봐요!<br>
									<br> 보면 볼수록 사랑스러운 가족을 액자속에 담아봐요<br>
									<br>
								</div>
								<button id="btnView1" class="sub_view_detail">상세 보기</button>
							</div>
						</div>
					</div>
					<div id="showDetail1" class="sub_info_detail">
						<div class="info_detail_period">
							<span><img src="<c:url value='/images/search.png'/>">적용기간 :</span>
							<span class="sub_period">2022.08.08 ~ 2022.12.30</span>
						</div>
						<div class="info_detail_profit">
							<span><img src="<c:url value='/images/search.png'/>">적용혜택 :</span>
							<div class="whole_profit">
								<div class="first_profit">
									▶ 반려동물 어메니티 제공<br><br>
									▶ 촬영한 사진 액자로 제공(요청시 자택으로 배송가능),펫 등록증 제공<br><br>
									▶ 객실 내 반려동물 하우스 제공
								</div>
								<div class="second_profit">
									▶ 성인 조식 1인 포함(추가시 성인 1인 35,000원)<br><br>
									▶ 무료 픽업 서비스(차량이 없는 경우)<br><br>
									▶ 객실 포함 요금 15% 할인 적용
								</div>
							</div>
						</div>
						<div class="use_rule">
							<span><img src="<c:url value='/images/search.png'/>">이용수칙 :</span>
							<div class="whole_rule">
								<div class="first_rule">
									▶ 한정 수량 객실 패키지 입니다<br><br>
									▶ 객실내 대여품목은 가져가실 수 없습니다<br><br>
									▶ 객실 반려동물 대여품 파손시 부담금이 발생합니다
								</div>
								<div class="second_rule">
									▶ 우천 및 자연재해시 실내에서만 촬영가능합니다<br><br>
									▶ 촬영장소는 정해진 장소에서만 촬영 가능합니다<br><br>
									▶ 본 패키지는 연박이 불가능합니다
								</div>
							</div>
						</div>
						<button type="submit" class="search_pro_room">객실요금조회</button>
					</div>
				</div>
				<div class="sub_pro_txt">
					<div class="sub_pro_tlt"># 견생네컷 패키지</div>
				</div>
				<div class="whole_subpro_box">
					<div class="sub_promotion_txt_img">
						<div class="sub_promotion_img">
							<img class="sub_img" src="<c:url value='/images/T_shirts.png'/>">
							<img class="photo_plus" src="<c:url value='/images/plus.png'/>">
							<img class="sub_img" src="<c:url value='/images/dog4cut.jpg'/>">
						</div>
						<div class="promotion_txt">
							<div class="sub_main_txt">
								<img src="<c:url value='/images/search.png'/>">반려가족을 T-shirt 모델로!
							</div>
							<div class="sub_txt">
								<div class="sub_txt">
									우리집 귀염둥이를 셔츠안에 쏙~<br>
									<br> 댕댕이 4컷을 셔츠로 제작하고 싶으신가요?<br>
									<br> 견생네컷 패키지로 댕댕이 셔츠를 제작해봐요<br>
									<br>
								</div>
								<button id="btnView2" class="sub_view_detail">상세 보기</button>
							</div>
						</div>
					</div>
					<div id="showDetail2" class="sub_info_detail">
						<div class="info_detail_period">
							<span><img src="<c:url value='/images/search.png'/>">적용기간 :</span>
							<span class="sub_period">2022.08.08 ~ 2022.12.30</span>
						</div>
						<div class="info_detail_profit">
							<span><img src="<c:url value='/images/search.png'/>">적용혜택 :</span>
							<div class="whole_profit">
								<div class="first_profit">
									▶ 견생네컷 촬영서비스 제공<br><br>
									▶ 촬영한 견생네컷 티셔츠로 제작 (자택으로 배송가능)<br><br>
									▶ 객실 내 반려동물 하우스 제공
								</div>
								<div class="second_profit">
									▶ 성인 조식 1인 포함(추가시 성인 1인 35,000원)<br><br>
									▶ 무료 픽업 서비스(차량이 없는 경우)<br><br>
									▶ 객실 포함 요금 15% 할인 적용
								</div>
							</div>
						</div>
						<div class="use_rule">
							<span><img src="<c:url value='/images/search.png'/>">이용수칙 :</span>
							<div class="whole_rule">
								<div class="first_rule">
									▶ 한정 수량 객실 패키지 입니다<br><br>
									▶ 객실내 대여품목은 가져가실 수 없습니다<br><br>
									▶ 객실 반려동물 대여품 파손시 부담금이 발생합니다
								</div>
								<div class="second_rule">
									▶ 셔츠내 사진위치는 변경 불가합니다<br><br>
									▶ 호텔사정에 따라 촬영은 외부에서 합니다<br><br>
									▶ 본 패키지는 연박이 불가능합니다
								</div>
							</div>
						</div>
						<button type="submit" class="search_pro_room">객실요금조회</button>
					</div>
				</div>
				<div class="sub_pro_txt">
					<div class="sub_pro_tlt"># 반려 캐리어 패키지</div>
				</div>
				<div class="whole_subpro_box">
					<div class="sub_promotion_txt_img">
						<div class="sub_promotion_img">
							<img class="sub_img" src="<c:url value='/images/petBag.jpg'/>">
							<img class="photo_plus" src="<c:url value='/images/plus.png'/>">
							<img class="sub_img" src="<c:url value='/images/petPinkBag.jpg'/>">
						</div>
						<div class="promotion_txt">
							<div class="sub_main_txt">
								<img src="<c:url value='/images/search.png'/>">반려가족에게 이쁜 캐리어선물!
							</div>
							<div class="sub_txt">
								<div class="sub_txt">
									사랑스러운 반려가족을 이동할때도 한눈에~<br>
									<br> 귀염둥이들이 이동중에 구경할수있게<br>
									<br> 최고의 핫 아이템을 선물해 보아요~<br>
									<br>
								</div>
								<button id="btnView3" class="sub_view_detail">상세 보기</button>
							</div>
						</div>
					</div>
					<div id="showDetail3" class="sub_info_detail">
						<div class="info_detail_period">
							<span><img src="<c:url value='/images/search.png'/>">적용기간 :</span>
							<span class="sub_period">2022.08.08 ~ 2022.12.30</span>
						</div>
						<div class="info_detail_profit">
							<span><img src="<c:url value='/images/search.png'/>">적용혜택 :</span>
							<div class="whole_profit">
								<div class="first_profit">
									▶ 휴대용 배변패드 함께 제공<br><br>
									▶ 최고급 반려동물 캐리어 제공(요청시 자택으로 배송)<br><br>
									▶ 반려동물 목걸이 함께 제공
								</div>
								<div class="second_profit">
									▶ 성인 조식 1인 포함(추가시 성인 1인 35,000원)<br><br>
									▶ 무료 픽업 서비스(차량이 없는 경우)<br><br>
									▶ 객실 포함 요금 10% 할인 적용
								</div>
							</div>
						</div>
						<div class="use_rule">
							<span><img src="<c:url value='/images/search.png'/>">이용수칙 :</span>
							<div class="whole_rule">
								<div class="first_rule">
									▶ 한정 수량 객실 패키지 입니다<br><br>
									▶ 객실내 대여품목은 가져가실 수 없습니다<br><br>
									▶ 객실 반려동물 대여품 파손시 부담금이 발생합니다
								</div>
								<div class="second_rule">
									▶ 캐리어 재고가 떨어지면 해당 패키지는 종료됩니다<br><br>
									▶ 캐리어 파손시 A/S기간은 1년입니다<br><br>
									▶ 본 패키지는 연박이 불가능합니다
								</div>
							</div>
						</div>
						<button type="submit" class="search_pro_room">객실요금조회</button>
					</div>
				</div>
			</div>
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
	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>