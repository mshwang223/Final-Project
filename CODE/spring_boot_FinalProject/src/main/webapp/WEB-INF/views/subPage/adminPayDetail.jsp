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
		
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/adminPayDetail.css"/>">
		
		<script src="<c:url value="/js/adminPayDetail.js"/>"></script>
	</head>

	<body>
		<!-- top  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section class="wrap">
			
			<!-- section -->
			<div>
			    <div class="pageTitle">
					<div>
						<span>#결제내역</span>
					</div>
				</div>
		    	<div class="userInfo_box">
			        <div class="custom_info">
						<div>
							<c:if test="${empty pay.userImg}">
								<img src="<c:url value='/images/profile.png'/>" id="profile_img__preview">
							</c:if>
							<c:if test="${not empty pay.userImg}">
								<img src="<c:url value='/profileImg/${pay.userImg}'/>" id="profile_img__preview">
							</c:if>
	                        <div class="hotel_info">
	                        	<div class="titleInfo">${pay.stayName}</div>
	                        	<div><i class="fa-solid fa-location-dot address_icon"></i><div class="txtAddress">${pay.address}</div></div>
	                        	<div><i class="fa-solid fa-calendar-days stay_calendar"></i>${pay.period}</div>
	                        	<div><i class="fa-solid fa-user person_icon"></i>성인${pay.manCnt}, 반려동물${pay.petCnt}</div>
	                        	<div><i class="fa-solid fa-bed bed_icon"></i>${pay.roomType}</div>
	                        </div>
	                    </div>
	                    <div class="txtTitle">투숙객 정보</div>
	                    <div class="txtContents"><div>투숙객명 :</div><div>${pay.rcvName}</div></div>
	                    <div class="txtContents"><div>연락처 :</div><div>${pay.rcvPhone}</div></div>
	                    <div class="txtContents mbottom"><div>이메일 :</div><div>${pay.rcvEmail}</div></div>
	                    
	                    <div class="txtTitle">결제정보</div>
	                    <div class="txtContents">
	                    	<div>${pay.periodDay}박(1박 : <fmt:formatNumber type="currency" value="${pay.roomPrice}" />원)</div>
	                    	<div><fmt:formatNumber type="currency" value="${pay.periodDay * pay.roomPrice}" />원</div>
	                    </div>
	                    <div class="txtContents"><div>청소비</div><div><fmt:formatNumber type="currency" value="15000" />원</div></div>
	                    <div class="txtContents"><div>서비스 수수료</div><div><fmt:formatNumber type="currency" value="30000" />원</div></div>
	                    <div class="txtContents"><div>숙박세 외 수수료</div><div><fmt:formatNumber type="currency" value="3000" />원</div></div>
	                    <div class="txtContents mbottom"><div>할인금액</div><div><fmt:formatNumber type="currency" value="${pay.discount}" />원</div></div>
	                    <hr/>
	                    <div class="txtContents total"><div>최총 금액</div><div><fmt:formatNumber type="currency" value="${pay.price}" />원</div></div>
	                    
	                    <div class="txtTitle">그 외</div>
	                    <div class="txtContents"><div>결제수단</div><div>${pay.payment}</div></div>
	                    <div class="txtContents"><div>결제일</div><div><fmt:formatDate value="${pay.payDate}" pattern="yyyy-MM-dd HH:mm:dd"/></div></div>
		        	</div>
		    	</div>
		    	<div class="btn_list_box">
				   	<button type="button" class="btn_list_done">목록</button>
				</div>
		    </div>
		<img class="top_btn" src="<c:url value='/images/top_dog.png'/>">
		</section>
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>