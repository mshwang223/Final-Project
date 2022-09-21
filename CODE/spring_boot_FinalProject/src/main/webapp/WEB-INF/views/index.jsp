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
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>">
		<script defer src="<c:url value='/js/index.js'/>"></script>
	</head>

<body>
<!-- top  -->
		 <c:import url="/WEB-INF/views/layout/top.jsp"/>
	
		<!-- section -->
		<section class="main_slide_section">
			<article class="main_slide">
				<div class="main_slide_box" id="slideBox">
					<div class="promotion_area">
						<div class="promotion_area_img">
							<img src="<c:url value='/images/promotion1.png'/>" alt="반려동물 생일">
						</div>
						<div class="promotion_area_contents">
							<div>아늑한 공간에서 특별한 생일을 보내 보세요</div>
							<button class="slide_btn" id="careBtn">자세히보기</button>
						</div>
					</div>
					<div class="promotion_area">
						<div class="promotion_area_img">
							<img src="<c:url value='/images/promotion2.png'/>" alt="반려동물 생일">
						</div>
						<div class="promotion_area_contents">
							<div>아늑한 공간에서 특별한 생일을 보내 보세요</div>
							<button class="slide_btn" id="partyBtn">자세히보기</button>
						</div>
					</div>
					<div class="promotion_area">
						<div class="promotion_area_img">
							<img src="<c:url value='/images/promotion3.jpg'/>" alt="반려동물 사진">
						</div>
						<div class="promotion_area_contents">
							<div>반려동물과 추억이 담긴 사진을 찍어봐요</div>
							<button class="slide_btn" id="photoBtn">자세히보기</button>
						</div>
					</div>
					<div class="promotion_area">
						<div class="promotion_area_img">
							<img src="<c:url value='/images/promotion4.png'/>" alt="반려동물 장난감">
						</div>
						<div class="promotion_area_contents">
							<div>다양한 용품을 제공해드려요</div>
							<button class="slide_btn" id="itemBtn">자세히보기</button>
						</div>
					</div>
					<div class="promotion_area">
						<div class="promotion_area_img">
							<img src="<c:url value='/images/promotion5.png'/>" alt="반려동물 활동">
						</div>
						<div class="promotion_area_contents">
							<div>반려동물과 함께 다양한 활동을 해봐요</div>
							<button class="slide_btn" id="playBtn">자세히보기</button>
						</div>
					</div>
				</div>
				<div class="slide_bar_box">
					<span class="slide_bar"></span> <span class="slide_bar"></span> <span
						class="slide_bar"></span> <span class="slide_bar"></span> <span class="slide_bar"></span>
				</div>
			</article>
		</section>
	<section class="wrap">
		<section class="photo_area" id="photoArea">
			<div class="photo_title"># 반려 돌봄 서비스</div>
			<div class="photo_box">
				<div class="photo_description">
					<span>펫밀리가 떴다는 반려동물을 돌봐드립니다. 가족의 안전을 약속 드리면서</span>
					<div>
						<span>전문 인력으로 안전하게 가족을 돌봐드려요.</span> <img
							src="<c:url value='/images/dog_walk.png'/>" alt="">
					</div>
					<span>지금까지 없었던 서비스를 저희와 함께해요</span>
				</div>
				<div class="photo_img">
					<img src="<c:url value='/images/petsitter1.png'/>" alt=""> <img
						src="<c:url value='/images/petsitter2.png'/>" alt=""> <img
						src="<c:url value='/images/petsitter3.png'/>" alt="">
				</div>
			</div>
		</section>
		<section class="party_area" id="partyArea">
			<div class="party_title"># 파티용품</div>
			<div class="party_box">
				<div>구성1</div>
				<div class="party_img">
					<img src="<c:url value='/images/party1.png'/>" alt=""> <img
						src="<c:url value='/images/party2.png'/>" alt="">
				</div>
				<div class="party_description">
					<div class="party_description_list">
						<img src="<c:url value='/images/search.png'/>" alt=""><span>블링블링 글리터
							스팽글 꼬깔모자 / 리본타이</span>
					</div>
					<div class="party_description_list">
						<img src="<c:url value='/images/search.png'/>" alt=""><span>알록달록 알파벳
							생일초 1세트</span>
					</div>
					<div class="party_description_list">
						<img src="<c:url value='/images/search.png'/>" alt=""><span>골드 가랜더
							1세트</span>
					</div>
					<div class="party_description_list">
						<img src="<c:url value='/images/search.png'/>" alt=""><span>파스텔 풍선
							21개</span>
					</div>
				</div>
			</div>
			<div class="party_box">
				<div>구성2</div>
				<div class="party_img">
					<img src="<c:url value='/images/party3.png'/>" alt=""> <img
						src="<c:url value='/images/party4.png'/>" alt=""> <img
						src="<c:url value='/images/party5.png'/>" alt=""> <img
						src="<c:url value='/images/party6.png'/>" alt="">
				</div>
				<div class="party_description">
					<div class="party_description_list">
						<img src="<c:url value='/images/search.png'/>" alt=""><span>파스텔 생일
							가랜더 1세트</span>
					</div>
					<div class="party_description_list">
						<img src="<c:url value='/images/search.png'/>" alt=""><span>파스텔 풍선
							10개</span>
					</div>
					<div class="party_description_list">
						<img src="<c:url value='/images/search.png'/>" alt=""><span>이름 꼬깔모자</span>
					</div>
					<div class="party_description_list">
						<img src="<c:url value='/images/search.png'/>" alt=""><span>파티 접시</span>
					</div>
					<div class="party_description_list">
						<img src="<c:url value='/images/search.png'/>" alt=""><span>생일 토퍼</span>
					</div>
				</div>
			</div>
		</section>
		<section class="photo_area" id="photoArea">
			<div class="photo_title"># 추억이 담긴 사진</div>
			<div class="photo_box">
				<div class="photo_description">
					<span>호텔 및 펜션 예약 시 촬영을 원하시면(유선상담 서비스 : 02-222-2334)</span>
					<div>
						<span>반려동물과의 소중한 추억을 사진으로 남겨드려요</span> <img
							src="<c:url value='/images/camera.png'/>" alt="">
					</div>
					<span>각 지역의 포토그래퍼님과 연계하여 진행됩니다 :) [ 6만원 추가 / 1시간 ]</span>
				</div>
				<div class="photo_img">
					<img src="<c:url value='/images/photo1.jpg'/>" alt=""> <img
						src="<c:url value='/images/photo2.jpg'/>" alt=""> <img
						src="<c:url value='/images/photo3.jpg'/>" alt="">
				</div>
			</div>
		</section>
		<section class="item_area" id="itemArea">
			<div class="item_title"># 반려용품 및 장난감</div>
			<div class="item_ps">
				* 자세한 사항은 결제 시 <strong>요청사항에</strong> 기재부탁드립니다.
			</div>
			<div class="item_box">
				<div class="item">
					<img src="<c:url value='/images/pet_item1.jpg'/>" alt="">
					<div class="item_info">
						<div>- 펫하우스 제공</div>
						<div>- 견고한 자작나무 원목 하우스</div>
						<div>- 청결한 패브릭 쿠션</div>
					</div>
				</div>
				<div class="item">
					<img src="<c:url value='/images/pet_item2.jpg'/>" alt="">
					<div class="item_info">
						<div>- 배변패드 제공</div>
						<div class="item_info_detail">[프랑소와펫] 차콜 밤부 배변패드</div>
						<div class="item_info_detail">변경 사항이 있을 수 있으니 문의바랍니다.</div>
					</div>
				</div>
				<div class="item">
					<img src="<c:url value='/images/pet_item3.jpg'/>" alt="">
					<div class="item_info">
						<div>- 캣타워 제공</div>
						<div>- 견고한 원목 캣타워</div>
						<div>- 안락한 해먹 포함</div>
					</div>
				</div>
				<div class="item">
					<img src="<c:url value='/images/pet_item4.jpg'/>" alt="">
					<div class="item_info">
						<div>- 반려묘 화장실 제공</div>
						<div class="item_info_detail">[캣아이디어] 평판형 화장실</div>
						<div class="item_info_detail">두부모래 / 벤토나이트</div>
						<div class="item_info_detail">* 개인 모래 사용 가능</div>
					</div>
				</div>
				<div class="item">
					<img src="<c:url value='/images/pet_item5.jpg'/>" alt="">
					<div class="item_info">
						<div>- 식기 제공</div>
						<div>- 높이 조절 우드 식기 세트</div>
					</div>
				</div>
				<div class="item">
					<img src="<c:url value='/images/pet_item6.jpg'/>" alt="">
					<div class="item_info">
						<div>- 장난감 제공</div>
						<div class="item_info_detail">노즈워크, 오뎅막대, 캣닢 인형, 장난감 볼 등</div>
					</div>
				</div>
			</div>
		</section>
		<section class="play_area" id="playArea">
			<div class="play_title"># 즐거운 놀이공간</div>
			<div class="play_box">
				<div>
					<img src="<c:url value='/images/play1.jpg'/>" alt="애견 놀이터"> <img
						src="<c:url value='/images/play2.jpg'/>" alt="애견 수영장">
				</div>
				<div>
					<div class="play_info">
						<span>자유롭게 뛰어 놀 수 있는 놀이터(playground)</span> <span
							class="play_info_detail">놀이 시설의 유무는 시설에 따라 상이할 수 있습니다.</span>
					</div>
					<div class="play_info">
						<span>함께 수영할 수 있는 수영장</span> <span class="play_info_detail">장소에
							따라 이미지와 상이할 수 있습니다.</span>
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
					<input type="text" class="input_message" id="message" name="message" size="30" autocomplete="off"  placeholder="궁금한 사항을 물어봐주세요"/>
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