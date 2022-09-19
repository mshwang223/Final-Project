<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminSidebar.css'/>">
	</head>

	<body>
		<nav class="sideMenu">
			<div>
				<div class="sideTitle">사용자</div>

				<a class="aUserLists adminNotice" href="<c:url value='/adminNoticeSearch/0'/>">공지사항</a>
				<a class="aUserLists adminUser" href="<c:url value='/adminUserSearch/0'/>">사용자관리</a>
				<a class="aUserLists adminContact" href="<c:url value='/adminContactSearch/0'/>">문의내역</a>
				<a class="aUserLists adminPay" href="<c:url value='/adminPaySearch/0'/>">결제내역</a>
				<a class="aUserLists adminOut" href="<c:url value='/adminOutSearch/0'/>">탈퇴회원</a>
						
				<div class="sideTitle">운영</div>

				<a class="aOperLists adminInsertHotel" href="<c:url value="/adminInsertHotel/0"/>">숙박업체 등록</a>
				<a class="aOperLists adminService" href="<c:url value='/adminServiceSearch/0'/>">서비스 / 시설</a>
				<a class="aOperLists adminPet" href="<c:url value='/adminPetSearch/0'/>">펫등록증</a>
				<div class="sideTitleLine"></div>
			</div>
		</nav>
	</body>
</html>
