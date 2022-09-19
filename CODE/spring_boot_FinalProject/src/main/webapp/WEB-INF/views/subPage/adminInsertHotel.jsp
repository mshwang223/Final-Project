<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>펫밀리가 떴다</title>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/board.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminInsertHotel.css'/>">
		
		<script src="<c:url value='/js/adminInsertHotel.js'/>"></script>
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
							<span># 등록관리</span>
						</div>
					</div>	
					<form method="post" id="userFrm" class="userFrm" name="userFrm" action="<c:url value="/adminInsertHotel/0"/>">
						<div>
							<table class="search-table">
								<tr>
									<td></td>
									<td>
										<ul class="dropdown-contents">
											<li id="dp-all">전체</li>
											<li id="dp-title">제목</li>
											<li id="dp-contents">내용</li>
										</ul>
										<div class="search-box">
											<div>
												<input type="text" class="text_search" name="text_search" placeholder="업체명을 입력하세요.">
												<button class="search-button"><img src="/images/search.png"></button>
											</div>
										</div>
										<button type="button" id="adminRegDel" class="btnAdmin del">삭제</button>
									</td>
								</tr>
							</table>
						</div>	
					</form>
					<div class="table-box">
						<table>
							<thead>
								<tr>
							      	<th class="num">번호</th>
							      	<th class="checkBox">
							      		전체 <input type="checkBox" id="allCheck" />
							      	</th>
							      	<th>등록업체</th>
							     	<th class="author">사용자ID</th>
							      	<th class="date">등록일</th>
							      	<th class="approve">승인여부</th>
							    </tr>
							</thead>
							<tbody>
								<c:forEach var="regList" items="${lists }"  begin="0" end="9">
								    <tr>
								      	<td>${regList.regId}</td>
								      	<td><input type="checkBox" class="agree_subcheck" value="<c:url value="${regList.regId}"/>" /></td>
								      	<td class="title"><a href="<c:url value='/adminInsertDetail/${regList.regId }'/>">${regList.name}</a></td>
								      	<td>${regList.userId}</td>
								      	<td><fmt:formatDate value="${regList.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								      	
								      	<td>${regList.approve }</td>
								    </tr>
							    </c:forEach>
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