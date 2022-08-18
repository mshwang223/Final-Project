<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
	</head>
	
	<body>
		<!-- footer 시작 -->
		<footer>
			<div class="footer_container">
				<div class="footer_box">
					<div class="div_terms">
						<span class="btn_terms">이용 약관 |</span>
						<span class="btn_terms">개인정보 처리방침 |</span>
						<span class="btn_terms">고객센터</span>
					</div>
					<div class="div_cpy_info">
						<p>
							상호명: (주)펫밀리가 떴다 | 대표 황재윤 | 개인정보보호책임자 곽경록<br>
							주소: 서울특별시 마포구 양화로 12길 8-9, 3층 (서교동, 예현빌딩) | 이메일 help@petmily.com | 마케팅/제휴 문의 marketing@petmily.com <br>
							대표번호: 02-222-0333 팩스: 050-1122-3030 사업자등록번호: 226-81-52531 통신판매업신고번호: 제2020-서울마포-3555호
						</p> 
					</div>
				</div>	
				<div class="footer_image">
					<div class="sns_box">
						<span class="sns"><img src="<c:url value='/images/facebook.png'/>"></span>
						<span class="sns"><img src="<c:url value='/images/instagram.png'/>"></span>
						<span class="sns"><img src="<c:url value='/images/twitter.png'/>"></span>
						<span class="sns"><img src="<c:url value='/images/youtube.png'/>"></span>
					</div>
					<img src="<c:url value='/images/petmilylogo.png'/>">
				</div>
			</div>
		</footer>
		<!-- footer 종료 -->
	</body>
</html>