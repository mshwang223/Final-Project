<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/signupPetComplete.css'/>">
		
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/signupPetComplete.js'/>"></script>
		<script src="<c:url value='/js/html2canvas.js'/>"></script>
	</head>

	<body>
		<section class="wrap">
			
			<!-- section -->
			<article>
			    <div class="pageTitle">
					<div>
						<span>#펫 등록 완료</span>
					</div>
				</div>
				<div class="completeBox">
					<ul class="joinMent">	
						<li>펫 등록이 <span class="colorFont">완료</span> 되었습니다.<br><br></li>
						<li>아래 <span class="colorFont">등록증</span>을 다운로드하세요.(해당 이미지 클릭!)<br><br></li>
					</ul>
					
					<div id="petCard" class="card_box">
						<div class="title-box">등&nbsp;&nbsp;록&nbsp;&nbsp;증</div>
						
						<div class="pet_img">
							<!-- 프로필 사진이 없을 경우 기본 이미지 출력 -->
							<c:if test="${empty petImg}">
								<img id="profile_img_preview" src="<c:url value='/images/profilePet.png'/>"/>
							</c:if>
							
							<c:if test="${not empty petImg}">
								<img id="profile_img_preview" src="<c:url value='/petImg/${petImg}'/>"/>
							</c:if>
                    	</div>
                    	
                    	<div class="content-box name">
                    		<div class="titleDiv">이 름</div>
                    		<div class="contentDiv">${petName}</div>
                    	</div>
                    	
                    	<div class="content-box age">
                    		<div class="titleDiv">나 이</div>
                    		<div class="contentDiv">${petAge}세</div>
                    	</div>                    	
                    	
                    	<div class="content-box kind">
                    		<div class="titleDiv">품 종</div>
                    		<div class="contentDiv">${petKind}</div>
                    	</div>
                    	
                    	<div class="content-box userDiv">
                    		<div class="titleDiv">보호자</div>
                    		<div class="contentDiv">${userName}</div>
                    	</div>
                    	
                    	<div class="content-box betweenDate">
                    		<div class="titleDiv">사용기한</div>
                    		<div class="contentDiv">
                    			<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/>
                    			&nbsp; ~ &nbsp;
                    			<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/>
                    		</div>
                    	</div>
                    	
                    	<div class="content-box date">
                    		<div class="titleDiv">등록일</div>
                    		<div class="contentDiv"><fmt:formatDate value="${createDate}" pattern="yyyy-MM-dd"/></div>
                    	</div>
                    	
                    	<div class="content-box size">
                    		<div class="titleDiv">크 기</div>
                    		<div class="contentDiv">
                    			<c:if test="${petSize eq '1'}">소형</c:if>
                    			<c:if test="${petSize eq '2'}">중형</c:if>
                    			<c:if test="${petSize eq '3'}">대형</c:if>
                    		</div>
                    	</div>
                    	
                    	<div class="petCode-box">
                    		<div>${petCode}</div> 
                    	</div>
                    	
                    	<div class="logo_img">
                    		<img src="<c:url value='/images/petmilylogo.png'/>"/>	
                    	</div>
                    	
                    	<div class="company">
                    		<div class="content">(주)펫밀리가 떴다</div>
                    		<div class="content">서울특별시 마포구 양화로 12길 8-9, 3층 (서교동, 예현빌딩)</div>
                    		<div class="content">대표번호: 02-222-0333&nbsp;&nbsp; 팩스: 050-1122-3030</div>
                    	</div>
					</div>
				</div>
				
				<div class="btn_signup_box">
			    	<button class="btn_signup_done">홈으로</button>
			    </div>
		    </article>
		</section>
	</body>
</html>