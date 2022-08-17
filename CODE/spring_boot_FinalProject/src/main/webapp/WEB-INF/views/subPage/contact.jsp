<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<link rel="icon" href="image/logo_ico.png">
		<link rel="stylesheet" type="text/css" href="css/board.css">
		<link rel="stylesheet" type="text/css" href="css/contact.css">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/contact.js"></script>
	</head>
	
	<body>
		<section class="wrap">
			<!-- header  -->
			<c:import url="/WEB-INF/views/layout/header.jsp"/>
			
			<!-- 문의하기 레이아웃 시작 -->
			<section class="contactBox">
				<p class="pageTitle">문의하기</p>
				<div class="contact-menu">
					<div>문의등록</div>
					<div>문의 조회</div>
					<div class="underline"></div>	
				</div>
				<div class="table-box">
					<div>
						<p>문의하시기 전에 FAQ 관련 내용을 확인해보세요.</p>
						<p>가능한 빠른 시간 내 답변하도록 노력하겠습니다.</p>
					</div>
					<table>
						<tbody>
						    <tr>
						      	<td>문의제목<em></em></td>
						      	<td class="contents-box">
						      		<input type="text" placeholder="문의 제목을 입력해 주세요."/>
						      		<span>문의 제목을 입력해 주세요.</span>
						      	</td>
						    </tr>
						    <tr>
						      	<td>문의내용<em></em></td>
						      	<td class="contents-box">
						      		<textarea type="text" placeholder="문의 내용을 입력해 주세요."></textarea>
						      		<span>문의 내용을 입력해 주세요.</span>						      	
						      	</td>
						    </tr>
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
					<div class="btn_list_box">
				    	<button class="btn_reset">취소</button>
				    	<button class="btn_done">등록</button>
				    </div>
				</div>
			</section>
			<!-- 문의하기 레이아웃 종료 -->
		</section>
	</body>
</html>