<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminInsertDetail.css'/>">
		<script src="<c:url value='/js/adminInsertDetail.js'/>"></script>
	</head>
	
	<body>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
			
		<section class="wrap">
			<!-- 관리자 레이아웃 시작 -->
			<article>
				<!-- slide bar -->
				<c:import url="/WEB-INF/views/layout/adminSide.jsp"/>

				<form id="approveForm" action="/adminApproveHotel" method="post">
					<div class="approve_area">			
						<div class="approve_btn_box">
							<button type="submit" class="approve_submit">승인</button>
							<input type="hidden" name="approve" id="approve" value="Y">
							<button type="button" id="approve_cancle">취소</button>	
						</div>
						
						<div class="approve_wrap">
							<div class="company_title">
								<span>업체명 : </span>
								<span>${name}</span>
								<input type="hidden" name="name" id="name" value="${name }">
							</div>
							<div class="company_address">
								<span>주소 : </span>
								<span>${address1}</span>
								<span>${address2}</span>
								<input type="hidden" name="address1" id="address1" value="${address1 }">
								<input type="hidden" name="address2" id="address2" value="${address2 }">
							</div>
							<div class="company_img">
								<span>이미지 파일 : </span>
								<input type="hidden" name="serviceImg" id="serviceImg" value="${serviceImg }">
								<div class="file_items_wrap">
										<div class="file_container">
											<c:forEach begin="0" end="10" step="1" varStatus="loop">
												<div class="file_img_box">
													<img src="<c:url value='/comImg/${fn:split(fileImg,".")[0]}/${loop.index +1 }.png'/>" alt="">
												</div>
											</c:forEach>
										</div>
										<img class="file_prev" src="<c:url value='/images/left-arrow.png'/>" alt=""> 
										<img class="file_next" src="<c:url value='/images/next.png'/>" alt="">
								</div>
							</div>
							<div class="company_contact">
								<span>연락처 : </span>
								<span>${telNumber}</span>
								<input type="hidden" name="telNumber" id="telNumber" value="${telNumber }">
							</div>
							<div class="company_price">
								<span>가격 : </span>
								<span><fmt:formatNumber value="${price}"/>원</span>
								<input type="hidden" name="price" id="price" value="${price }">
							</div>
							<div class="company_person_count">
								<span>최대 인원수 : </span>
								<span><fmt:formatNumber value="${maxManCnt}"/>명</span>
								<input type="hidden" name="maxManCnt" id="maxManCnt" value="${maxManCnt }">
							</div>
							<div class="company_pet_count">
								<span>최대 반려동물 수 : </span>
								<span><fmt:formatNumber value="${maxPetCnt}"/>마리</span>
								<input type="hidden" name="maxPetCnt" id="maxPetCnt" value="${maxPetCnt }">
							</div>
							<div class="company_service">
								<span>제공서비스 : </span>
								<span>&nbsp;${facility1}</span>
								<input type="hidden" name="facility1" id="facility1" value="${facility1 }">
							</div>
							<div class="company_facility">
								<span>제공시설 : </span>
								<span>&nbsp;${facility2}</span>
								<input type="hidden" name="facility2" id="facility2" value="${facility2 }">
							</div>
							<div class="company_add_facility">
								<span>추가시설 : </span>
								<span>&nbsp;${facility3}</span>
								<input type="hidden" name="facility3" id="facility3" value="${facility3}">
							</div>
							<div class="company_add_facility">
								<span>등록기간 : </span>
								<span>&nbsp;${period}</span>
								<input type="hidden" name="facility3" id="facility3" value="${facility3}">
							</div>
							<div class="company_pet_count">
								<span>특이사항 : </span>
								<span>${comment}</span>
								<input type="hidden" name="comment" id="comment" value="${comment}">
							</div>
							<div class="company_pet_room">
								<span>방타입 : </span>
								<span>${roomType}</span>
								<input type="hidden" name="roomType" id="roomType" value="${roomType}">
							</div>
						</div>
				
					</div>
				</form>
				<!-- 승인 취소 -->
				<form id="cancleForm" method="post" action="/adminApproveHotel">
					<input type="hidden" name="name" value="${name }">
					<input type="hidden" name="approve" value="N">
				</form>
			</article>
			<!-- 관리자 레이아웃 종료 -->
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>