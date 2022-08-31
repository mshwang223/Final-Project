<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminSidebar.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminInsertDetail.css'/>">
		
		<script src="<c:url value='js/adminInsertDetail.js'/>"></script>
	</head>
	
	<body>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
			
		<section class="wrap">
			<!-- 관리자 레이아웃 시작 -->
			<article>
				<!-- slide bar -->
				<c:import url="/WEB-INF/views/layout/adminSide.jsp"/>

				<div class="approve_area">
					
					<div class="approve_wrap">
						<div class="company_title">
							<span>업체명 : </span>
							<span>${name}</span>
						</div>
						<div class="company_address">
							<span>주소 : </span>
							<span>${address1}</span>
							<span>${address2}</span>
						</div>
						<div class="company_img">
							<span>이미지 파일 : </span>
							<a href="<c:url value='/fileDownload/${file}' /> ">${file} 파일 다운로드</a>
						</div>
						<div class="company_contact">
							<span>연락처 : </span>
							<span>${telNumber}</span>
						</div>
						<div class="company_price">
							<span>가격 : </span>
							<span><fmt:formatNumber value="${price}"/>원</span>
						</div>
						<div class="company_person_count">
							<span>최대 인원수 : </span>
							<span><fmt:formatNumber value="${maxManCnt}"/>명</span>
						</div>
						<div class="company_pet_count">
							<span>최대 반려동물 수 : </span>
							<span><fmt:formatNumber value="${maxPetCnt}"/>마리</span>
						</div>
						<div class="company_service">
							<span>제공서비스 : </span>
							<span>${facility1}</span>
						</div>
						<div class="company_facility">
							<span>제공시설 : </span>
							<span>${facility2}</span>
						</div>
						<div class="company_add_facility">
							<span>등록기간 : </span>
							<span>${facility3}</span>
						</div>
						<div class="company_pet_count">
							<span>특이사항 : </span>
							<span>${comment}</span>
						</div>
					</div>
			
				</div>

			</article>
			<!-- 관리자 레이아웃 종료 -->
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>