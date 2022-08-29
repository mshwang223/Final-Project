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
			<form method="post" id="signupPet" class="signupPet">
			    <div class="pageTitle">
					<div>
						<span>#펫등록</span>
					</div>
				</div>
		    	<div class="signup_box">
                    <div class="pet_img">
                    	<img id="profile_img_preview" src="<c:url value='/images/profilePet.png'/>"/>
                    	<input type="hidden" id="sessionFile" name="sessionFile" value="${sessionScope.userImg}"/>
						<input type="file" id="uploadFile" name="uploadFile" style="display:none"/>
                    </div>
			        <div class="pet_info">
			        	<div class="pet_user">
			            	<p class="title">신청자</p>
			            	<input type="hidden" id="userId" name="userId" value="<c:url value='${sessionScope.sid}'/>">
			            	<input type="text" name="userName" class="text_pet_user input_layout" value="<c:url value='${sessionScope.userName}'/>" readonly>
			          	</div>
			          	<br>
			          	<div class="pet_name">
			            	<p class="title">이름</p>
			            	<input type="text" id="petName" name="petName" class="text_pet_name input_layout" placeholder="이름을 입력해 주세요" required>
			          	</div>
			          	<br>
			          	<div class="pet_race">
			            	<p class="title">종류</p>
			            	<input type="text" id="petRace" name="petRace" class="text_pet_Race input_layout" placeholder="종류를 입력해 주세요(개, 고양이, 햄스터 등)" required>
			          	</div>
			          	<br>
			          	<div class="pet_kind">
			            	<p class="title">나이</p>
			            	<input type="text" id="petAge" name="petAge" class="text_pet_age input_layout" type="number" maxlength="2" placeholder="나이를 입력해 주세요. 모르면 공란">
			          	</div>
			          	<br>
			          	<div class="pet_kind">
			            	<p class="title">품종</p>
			            	<input type="text" id="petKind" name="petKind" class="text_pet_kind input_layout" placeholder="품종을 입력해 주세요. 모르면 공란">
			          	</div>
			          	<br>
			          	<div class="pet_size">
			            	<p class="title">크기</p>
			            	<div>
								<div class="dropdown-box">
									<div id="petSize" class="dpBox-pet-size">소형</div>
									<input type="hidden" name="petSize" readonly />	<!-- 컨트롤러에 넘길 파라미터 -->
									<div class="dpBox-div">▼</div>
								</div>
								<ul class="dropdown-contents">
									<li class="small">소형</li>
									<li class="midium">중형</li>
									<li class="large">대형</li>
								</ul>
				            	<div id="subDetail" class="subDetail"><span>상세보기</span></div>
			            	</div>
			          	</div>			          	
			          	<br>
			          	<div class="pet_comment">
			            	<p class="title">특이사항</p>
			            	<textarea cols="48" rows="10" id="petComment" name="comment" class="text_pet_comment textarea_layout" maxlength="220" placeholder="펫이 가진 특별한 점을 입력하세요"></textarea>
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