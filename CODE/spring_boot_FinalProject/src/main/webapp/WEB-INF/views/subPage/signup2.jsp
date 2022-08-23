<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<link rel="icon" href="images/logo_ico.png">
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		
		<link rel="stylesheet" type="text/css" href="css/signup.css">
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="js/signup.js"></script>
		
	</head>

	<body>
		<!-- top  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section class="wrap">
			
			<!-- section -->
			<section class="signup">
		    	<div class="signup_box">
			        <div class="signup_title">
			        	<p>회원가입</p>
			        </div>
			        <div class="custom_info">
			        	<div class="signup_id">
			            	<p class="title">아이디</p>
			            	<input type="text" class="text_signup_id" placeholder="아이디 입력">
			            	<button class="btn_idcheck">중복확인</button>
			          	</div>
			          	<br>
			          	<div class="signup_pwd">
			            	<p class="title">비밀번호</p>
			            	<input type="password" id="signupPwd1" class="text_signup_pwd"
			              	placeholder="영문 숫자 특수문자 포함 8~12자리">
			            	<!-- <div class="pwd_eyes"><img src="../images/show.png"></div> -->
			          	</div>
			          	<div class="check_pwd">
			            	<p class="title">비밀번호 확인</p>
			            	<input type="password" id="signupPwd2" class="text_check_pwd"
			              	placeholder="영문 숫자 특수문자 포함 8~12자리">
			            	<!-- <div class="pwd_eyes"><img src="../images/show.png"></div> -->
			          	</div>
			          	<br>
			          	<div class="signup_name">
			            	<p class="title">이름</p>
			            	<input type="text" id="signupName" class="text_signup_name"
			              	placeholder="이름을 입력해 주세요">
			          	</div>
			          	<br>
			          	<div class="signup_phone">
			            	<p class="title">휴대폰 인증</p>
			            	<input type="text" class="text_signup_phone" placeholder="번호를 입력해 주세요">
			            	<button class="confirm_phone">번호전송</button>
			          	</div>
			          	<div class="signup_phone_check">
			            	<input type="text" class="check_signup_phone" placeholder="인증번호를 입력해 주세요">
			            <button class="check_phone">인증하기</button>
			          	</div>
			          	<br>
			          	<div class="signup_address">
			            	<p class="title">주소</p>
			            	<input type="text" id="zipCode" class="zipcode" name="zipcode" readonly>
			            	<button class="btn_zipcode">우편번호찾기</button>
			            	<input type="text" id="address1" class="check_address1" placeholder="주소 입력"><br>
			            	<input type="text" id="address2" class="check_address2" placeholder="상세 주소 입력">
			          	</div>
			          	<br>
			          	<div class="signup_email">
			            	<p class="title">이메일</p>
			            	<input type="text" id="signupEmail" class="text_signup_email" placeholder="abc@example.com">
			          	</div>
			          	<br>
			          	<br>
			          	<div class="agree_rule">
			            	<div class="agree_all">
				            	<input type="checkbox" id="allCheck" class="agree_all_check" name="agree_all_check">
				              	<p class="title">약관 전체 동의</p>
				            </div>
				            <div class="agree_sub">
				            	<div class="agree_sub1">
				                	<input type="checkbox" class="agree_subcheck1" name="agree_subcheck1">
				                	<p>이용 약관(필수)</p>
				                	<a href="#" class="agree_link1">상세보기</a>
				              	</div>
				            </div>
				            <div class="agree_sub">
				            	<div class="agree_sub2">
				                	<input type="checkbox" class="agree_subcheck2" name="agree_subcheck2">
				                	<p>개인정보 수집 및 이용(필수)</p>
				                	<a href="#" class="agree_link2">상세보기</a>
				              	</div>
				            </div>
				            <div class="agree_sub">
				            	<div class="agree_sub3">
				                	<input type="checkbox" class="agree_subcheck3" name="agree_subcheck3">
				                	<p>이벤트 / 프로모션 SMS수신(선택)</p>
				                	<a href="#" class="agree_link3">상세보기</a>
				              	</div>
				            </div>
				            <div class="agree_sub">
				              	<div class="agree_sub4">
				                	<input type="checkbox" class="agree_subcheck4" name="agree_subcheck4">
				                	<p>이벤트 / 프로모션 Email수신(선택)</p>
				                	<a href="#" class="agree_link4">상세보기</a>
				              	</div>
			            	</div>
			          	</div>
			          	<div class="btn_signup_box">
			            	<button class="btn_signup_done">가입하기</button>
			          	</div>
		        	</div>
		    	</div>
		    </section>
		<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>