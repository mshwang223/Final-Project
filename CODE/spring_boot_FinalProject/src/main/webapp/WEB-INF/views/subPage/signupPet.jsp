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
		
		<link rel="stylesheet" type="text/css" href="css/signupPet.css">
		<link rel="stylesheet" type="text/css" href="css/signup-modal.css">
		
		<script src="js/signupPet.js"></script>
		<script src="js/signupPet-modal.js"></script>
		

		
	</head>

	<body>
		<!-- top  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section class="wrap">
			
			<!-- section -->
			<form method="post" id="signup" class="signup">
			    <div class="pageTitle">
					<div>
						<span>#펫등록</span>
					</div>
				</div>
		    	<div class="signup_box">
                    <div class="pet_img">
                    	<img src="<c:url value='/images/profilePet.png'/>" id="profile_img_preview">
                    </div>
			        <div class="pet_info">
			          	<div class="pet_name">
			            	<p class="title">이름</p>
			            	<input type="text" id="petName" class="text_pet_name input_layout" placeholder="이름을 입력해 주세요">
			          	</div>
			          	<br>
			          	<div class="pet_race">
			            	<p class="title">종류</p>
			            	<input type="text" id="petRace" class="text_pet_Race input_layout" placeholder="종류를 입력해 주세요">
			          	</div>
			          	<br>
			          	<div class="pet_kind">
			            	<p class="title">품종</p>
			            	<input type="text" id="petKind" class="text_pet_kind input_layout" placeholder="품종을 입력해 주세요">
			          	</div>
			          	<br>
			          	<div class="pet_size">
			            	<p class="title">크기</p>
			            	<div>
								<div class="dropdown-box">
									<div id="pet_size" class="dpBox-pet-size">소형</div>
									<div class="dpBox-div">▼</div>
								</div>
								<ul class="dropdown-contents">
									<li class="small" value="small">소형</li>
									<li class="midium" value="midium">중형</li>
									<li class="large" value="large">대형</li>
								</ul>
				            	<div id="subDetail" class="subDetail"><span>상세보기</span></div>
			            	</div>
			          	</div>			          	
			          	<br>
			          	<div class="pet_comment">
			            	<p class="title">특이사항</p>
			            	<textarea cols="48" rows="10" id="petComment" class="text_pet_comment textarea_layout" maxlength="220" placeholder="펫이 가진 특별한 점을 입력하세요"></textarea>
			          	</div>
		        	</div>
		    	</div>
			    
			    <div class="btn_signup_box">
			    	<button class="btn_cancel_done">취 소</button>
			        <button type="submit" class="btn_signup_done">등록하기</button>
			    </div>
		    </form>
			<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		
		<!-- The Modal -->
		<div id="signupPetModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
				<span class="close">&times;</span>
				<div></div>
			</div>
		</div>
				
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>