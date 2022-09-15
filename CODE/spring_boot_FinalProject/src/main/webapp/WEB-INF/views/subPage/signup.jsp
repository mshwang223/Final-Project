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
		
		<link rel="stylesheet" type="text/css" href="css/signup.css">
		<link rel="stylesheet" type="text/css" href="css/signup-modal.css">
		
		
		<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
		
		<script src="js/signup.js"></script>
		<script src="js/signup-modal.js"></script>
	</head>

	<body>
		<!-- top  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section class="wrap">
			
			<!-- section -->
			<form method="post" id="signup" class="signup">
			    <div class="pageTitle">
					<div>
						<span>#회원가입</span>
					</div>
				</div>
		    	<div class="signup_box">
			        <div class="custom_info">
			        	<div class="signup_id">
			            	<p class="title">아이디</p>
			            	<input type="text" id="signupId" class="text_signup_id" placeholder="아이디 입력(5~10자리)" pattern=".{5,10}" required title="아이디는 5~10자리까지 입력해야 합니다.">
			            	<button type="button" class="btn_idcheck">중복확인</button>
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
			          	<div class="signup_email">
			            	<p class="title">이메일</p>
			            	<input type="text" id="signupEmail" class="text_signup_email" placeholder="abc@example.com">
			          		<button type="button" class="btn_emailcheck">중복확인</button>
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
				                	<input type="checkbox" id="agree_subcheck1" class="agree_subcheck essential" name="agree_subcheck1">
				                	<p>서비스 이용약관(필수)</p>
				                	<div id="subDetail1" class="subDetail">상세보기</div>
				              	</div>
				            </div>
				            <div class="agree_sub">
				            	<div class="agree_sub2">
				                	<input type="checkbox" id="agree_subcheck2" class="agree_subcheck essential" name="agree_subcheck2">
				                	<p>개인정보 수집 및 이용 동의(필수)</p>
				                	<div id="subDetail2" class="subDetail">상세보기</div>
				              	</div>
				            </div>
				            <div class="agree_sub">
				            	<div class="agree_sub3">
				                	<input type="checkbox" id="agree_subcheck3" class="agree_subcheck" name="agree_subcheck3">
				                	<p>개인정보 수집 및 이용 동의(선택)</p>
				                	<div id="subDetail3" class="subDetail">상세보기</div>
				              	</div>
				            </div>
				            <div class="agree_sub">
				              	<div class="agree_sub4">
				                	<input type="checkbox" id="agree_subcheck4" class="agree_subcheck essential" name="agree_subcheck4">
				                	<p>개인정보 제 3자 제공 동의(필수)</p>
				                	<div id="subDetail4" class="subDetail">상세보기</div>
				              	</div>
			            	</div>
			          	</div>
		        	</div>
		    	</div>
			    
			    <div class="btn_signup_box">
			    	<button type="button" class="btn_cancel_done">취 소</button>
			        <button type="submit" class="btn_signup_done">가입하기</button>
			    </div>
			    		    	
		    	<!-- The Modal -->
				<div id="signupModal" class="modal">
					<!-- Modal content -->
					<div class="modal-content">
						<span class="close">&times;</span>
						<div></div>
					</div>
				</div>
		    </form>
		<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>