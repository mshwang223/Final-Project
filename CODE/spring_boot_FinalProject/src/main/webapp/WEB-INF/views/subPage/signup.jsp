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
		
		<link rel="stylesheet" type="text/css" href="css/signup.css">
		<script src="js/signup.js"></script>
		
	</head>

	<body>
		<!-- top  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		
		<section class="wrap">
			<!-- section -->
			<section>
		    	<div>
			        <div class="pageTitle">
						<div>
							<span>#회원가입</span>
						</div>
					</div>
			        <div class="terms-box">
			        	<div class="termsTitle">약관 동의<em></em></div>
			        	<div>
			        		<div class="agree_sub">
			        			<input type="checkbox" id="agree_subcheck1" class="agree_subcheck">
			        			<label for="agree_subcheck1">서비스 이용약관(필수)</label>
			        			<button class="btn-close sub1">▼</button>
			        		</div>
			        		<div class="termsline sub1"></div>
			        		<div class="subDetail-box sub1">
				        		<div id="subpage1" class="showDetail"></div>
			        		</div>
			        		
			        		<div class="agree_sub">
			        			<input type="checkbox" id="agree_subcheck2" class="agree_subcheck">
			        			<label for="agree_subcheck2">개인정보 수집 및 이용 동의(필수)</label>
			        			<button class="btn-close sub2">▼</button>
			        		</div>
			        		<div class="termsline"></div>
			        		<div class="subDetail-box sub2">
				        		<div id="subpage2" class="showDetail"></div>
			        		</div>
			        		
			        		<div class="agree_sub">
			        			<input type="checkbox" id="agree_subcheck3" class="agree_subcheck">
			        			<label for="agree_subcheck3">개인정보 수집 및 이용 동의(선택)</label>
			        			<button class="btn-close sub3">▼</button>
			        		</div>
			        		<div class="termsline"></div>
			        		<div class="subDetail-box sub3">
				        		<div id="subpage3" class="showDetail"></div>
			        		</div>
			        		
			        		<div class="agree_sub">
			        			<input type="checkbox" id="agree_subcheck4" class="agree_subcheck">
			        			<label for="agree_subcheck4">개인정보 제 3자 제공 동의(필수)</label>
			        			<button class="btn-close sub4">▼</button>
			        		</div>
			        		<div class="termsline"></div>
			        		<div class="subDetail-box sub4">
				        		<div id="subpage4" class="showDetail"></div>
			        		</div>
			        		
			        		<div class="agree_sub last">
			        			<input type="checkbox" id="agree_checkAll">
			        			<label for="agree_checkAll">전체동의</label>
			        			<span>
			        				서비스 이용약관(필수), 개인정보 수집 및 이용 동의(필수), 개인정보 수집 및 이용 동의(선택), 개인정보 제 3자 제공<br> 동의(필수) 내용에 모두 동의 합니다.
			        			</span>
			        		</div>
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