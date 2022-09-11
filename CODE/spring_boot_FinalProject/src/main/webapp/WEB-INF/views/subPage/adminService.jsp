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
		
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/board.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/adminService.css"/>">
		
		<script src="<c:url value="/js/adminService.js"/>"></script>
	</head>
	
	<body>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
			
		<section class="wrap">
			<!-- 관리자 레이아웃 시작 -->
			<article>
				<!-- sidebar -->
				<c:import url="/WEB-INF/views/layout/adminSide.jsp"/>
				
				<div class="main-layout">
					<div class="pageTitle">
						<div>
							<span>#서비스</span>
						</div>
					</div>
					<div class="contact-menu">
						<a href="<c:url value="/adminServiceSearch/0"/>">서비스</a>
						<a href="<c:url value="/adminFacilitySearch/0"/>">시설</a>
						<div class="underline"></div>	
					</div>
					<form method="post" id="userFrm" class="userFrm" name="userFrm" action="<c:url value="/adminServiceSearch/0"/>">
						<table class="search-table">
							<tr>
								<td>
									<c:if test="${maxPageNum ne 0}">
										<div class="blue">총 ${maxCnt}</div>
									</c:if>	
								</td>
								<td>
									<div id="dropdown-box" class="dropdown-box">
										<div id="dpBox-name" class="dpBox-name">전체</div>
										
										<c:if test="${empty chk_search}">
											<input type="hidden" id="chk_search" name="chk_search" value="0" />
										</c:if>
										
										<c:if test="${not empty chk_search}">
											<input type="hidden" id="chk_search" name="chk_search" value="${chk_search}" />
										</c:if>
										
										<div class="dpBox-div">▼</div>
									</div>
									<ul class="dropdown-contents">
										<li class="dp-all">전체</li>
										<li class="dp-sort">구분</li>
										<li class="dp-name">이름</li>
									</ul>
									<div class="search-box">
										<div>
											<input type="text" id="text_search" name="text_search" class="text_search" value="${text_search}" placeholder="검색어를 입력하세요.">
											<button class="search-button"><img src="<c:url value="/images/search.png"/>"></button>
										</div>
									</div>
									<div>
										<button type="button" id="adminServiceDel" class="btnAdmin del">삭제</button>
										<button type="button" id="adminServiceNew" class="btnAdmin new">NEW</button>
									</div>
								</td>
							</tr>
						</table>
					</form>	
					<div class="table-box">
						<table>
							<thead>
								<tr>
							      	<th class="num">번호</th>
							      	<th class="checkBox">
							      		전체 <input type="checkBox" id="allCheck" />
							      	</th>
							      	<th class="author">구분</th>
							     	<th>이름</th>
							    </tr>
							</thead>
							<tbody>
								<c:if test="${maxPageNum eq 0}">
									<tr>
										<td colspan="4">내용이 없습니다.</td>
									</tr>							
								</c:if>
								<c:if test="${maxPageNum ne 0}">
									<c:forEach var="list" items="${lists}" varStatus="loop">
									    <tr>
									      	<td>${loop.count}</td>
									      	<td><input type="checkBox" class="agree_subcheck" value="<c:url value="${list.serviceId}"/>" /></td>
									      	<td>${list.serviceSort}</td>
									      	<td class="title"><a class="atxtUnderline" href="<c:url value="/adminServiceDetail/${list.serviceId}"/>">${list.serviceName}</a></td>
									    </tr>
								    </c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<div class="paging-box">
						<input type="hidden" id="flag" value="${sessionScope.flag}" />
						<input type="hidden" id="maxPage" value="${maxPageNum}" />
						<ul>
							<c:if test="${maxPageNum ne 0}">
								<c:if test="${maxPageNum ne 1}">
									<li class="firstPager">
										<div title="첫 페이지로 이동하기">
											<<
										</div>
									</li>
									<li class="prevPager">
										<div title="이전 페이지로 이동하기">
											<
										</div>
									</li>
								</c:if>
	
								<c:forEach var="i" begin="1" end="${maxPageNum}">
								<li>
									<div class="active" value="${i}">${i}</div>
								</li>
								</c:forEach>
							
								<c:if test="${maxPageNum ne 1}">
									<li class="nextPager">
										<div title="다음 페이지로 이동하기">
											>
										</div>
									</li>
									<li class="lastPager">
										<div title="마지막 페이지로 이동하기">
											>>
										</div>
									</li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
			</article>
			<!-- 관리자 레이아웃 종료 -->
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>