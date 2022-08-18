<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<link rel="icon" href="images/logo_ico.png">
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/petHotel.css">
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/moment.min.js"></script>
		<script defer src="js/daterangepicker.js"></script>
  		<script defer src="js/petHotel.js"></script>
  		<script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	</head>

	<body>
		<section class="wrap">
			<!-- header  -->
			<c:import url="/WEB-INF/views/layout/header.jsp"/>
			
			<section class="reservation_container">
				<article>
			    	<div class="background_img_box">
			        	<img class="background_img" src="images/background.jpg" alt="반려동물들">
			        </div>
			        <div class="reservation_area">
			        	<div class="reservation_title">야옹아 멍멍아 놀러가자</div>
			          	<div class="reservation_box">
				            <div class="search_area">
				            	<div>
				                	<div class="search_area_title">지역<img src="images/location.png" alt="지역"></div>
				                	<input type="text" class="search_box" id="searchBox" placeholder="지역을 검색하세요" autocomplete="off">
				              	</div>
				              	<div class="search_pop" id="searchPop">
				                	<ul id="searchList">
					                  	<li>서울</li>
					                  	<li>부산</li>
					                  	<li>제주도</li>
					                  	<li>강원도</li>
					                  	<li>강릉</li>
				                	</ul>
				              </div>
				            </div>
				            <div class="option_area">
				            	<div>
				                	<div class="option_area_title">옵션<img src="images/choice.png" alt="옵션"></div>
				                	<input type="text" class="option_box" id="optionBox" placeholder="옵션을 선택하세요" autocomplete="off">
				              	</div>
				              	<div class="option_pop" id="optionPop">
					                <!-- <span>픽업<img src="../images/close.png" alt="옵션 삭제" class="option_close"></span> -->
					                <div>
					                	<span>픽업</span>
					                  	<span>촬영</span>
					                  	<span>패키지</span>
					                  	<span>풀장</span>
					                </div>
				              	</div>
				            </div>
				            <div class="date_area">
				            	<div>
				                	<div class="date_area_title">날짜<img src="images/calendar.png" alt="날짜"></div>
				                	<input type="text" id="rangepicker" class="stay_date" name="daterange" autocomplete="off">
				              	</div>
				            </div>
				            <div class="count_area">
				              	<div>
				                	<div class="count_area_title">인원수 | 반려동물 수<img src="images/owner.png" alt="구성원 수"></div>
				                	<input type="text" class="count_box" autocomplete="off">
				              	</div>
				            </div>
				            <button class="reservation_btn">
				              	<div>
				                	<span>검색</span> 
				                	<img src="images/search.png" alt="검색">
				              	</div>
				            </button>
			          	</div>
			        </div>
				</article>
			</section>			
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>			
	</body>
</html>