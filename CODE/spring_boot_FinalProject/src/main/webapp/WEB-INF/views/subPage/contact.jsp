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
		
		<link rel="stylesheet" type="text/css" href="css/board.css">
		<link rel="stylesheet" type="text/css" href="css/contact.css">
		<script src="js/contact.js"></script>
	</head>
	
	<body>
		<section class="wrap">
			<!-- header  -->
			<c:import url="/WEB-INF/views/layout/top.jsp"/>
			
			<!-- 문의하기 레이아웃 시작 -->
			<article class="contactBox">
				<div class="pageTitle">
					<div>
						<span>#문의등록</span>
					</div>
				</div>
				<div class="contact-menu">
					<a href="<c:url value='/contact'/>">문의등록</a>
					<a href="<c:url value='/contactResult'/>">문의 조회</a>
					<div class="underline"></div>	
				</div>
				<div class="table-box">
					<div>
						<p>문의하시기 전에 FAQ 관련 내용을 확인해보세요.</p>
						<p>가능한 빠른 시간 내 답변하도록 노력하겠습니다.</p>
					</div>
					
					<!-- 상단 테이블 -->
					<table>
						<tbody>
						    <tr>
						      	<td>문의제목<em></em></td>
						      	<td class="contents-box">
						      		<input type="text" maxlength="50" placeholder="문의 제목을 입력해 주세요."/>
						      		<span class="span-title">문의 제목을 입력해 주세요.</span>
						      		<div class="text-count cntTitle"><span id="cntTitle">0</span> / 50</div>
						      	</td>
						    </tr>
						<tbody>
					</table>
					
					<!-- 중단 textarea 구간 -->	    
					<div class="layout-contents">
						<div>문의내용<em></em></div>
						<div class="contents-box">
							<textarea maxlength="500" placeholder="문의 내용을 입력해 주세요."></textarea>
						    <span class="span-contents">문의 내용을 입력해 주세요.</span>
						    <div class="text-count cntContents"><span id="cntContents">0</span> / 500</div>						      	
						</div>
					</div>
					
					<!-- 하단 테이블 -->
					<table>
						<tbody>	    
						    <tr>
						      	<td class="title-email">답변메일</td>
						      	<td class="contents-email">
						      		<div>
							      		<div>
							      			<input type="checkbox" id="chkEmail">&nbsp;&nbsp;받음
							      		</div>
							      		<span>등록된 이메일로 답변메일을 받으실 수 있습니다.</span>
						      		</div>
						      		<div class="confirm-email">
							      		admin@gmail.com
						      		</div>
								</td>
						    </tr>
						    <tr>
						      	<td class="title-img">첨부이미지</td>
						      	<td>
								    <div class="btn_img_box">
								    	<button class="btn_img_done">이미지 찾기</button>
								    </div>
						      	</td>
						    </tr>
						</tbody>
					</table>
					<div class="bottom_line">
					</div>
					<div class="btn_list_box">
				    	<button class="btn_reset">취소</button>
				    	<button class="btn_done">등록</button>
				    </div>
				</div>
			</article>
			<!-- 문의하기 레이아웃 종료 -->
		</section>
	</body>
</html>