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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminNotice.css'/>">
		
		<script src="<c:url value='js/adminInsertHotel.js'/>"></script>
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
					<div>
						<table class="search-table">
							<tr>
								<td></td>
								<td>
									<div class="dropdown-box">
										<div id="dpBox-name" class="dpBox-div">전체</div>
										<div class="dpBox-div">▼</div>
									</div>
									<ul class="dropdown-contents">
										<li id="dp-all">전체</li>
										<li id="dp-title">제목</li>
										<li id="dp-contents">내용</li>
									</ul>
									<div class="search-box">
										<div>
											<input type="text" class="text_search" placeholder="검색어를 입력하세요.">
											<button class="search-button"><img src="images/search.png"></button>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="table-box">
						<table>
							<thead>
								<tr>
							      	<th class="num">번호</th>
							      	<th>등록업체</th>
							     	<th class="author">사용자ID</th>
							      	<th class="date">등록일</th>
							      	<th class="approve">승인여부</th>
							    </tr>
							</thead>
							<tbody>
								<c:forEach var="regList" items="${regList }"  begin="0" end="9">
								    <tr>
								      	<td>${regList.regId}</td>
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
						<ul>
							<li class="firstPager">
								<a href="" title="첫 페이지로 이동하기">
									<<
								</a>
							</li>
							<li class="prevPager">
								<a href="" title="이전 페이지로 이동하기">
									<
								</a>
							</li>
							
							<li><a href="" class="active">1</a></li>
							<li><a href="" class="active">2</a></li>
							<li><a href="" class="active">3</a></li>
							<li><a href="" class="active">4</a></li>
							<li><a href="" class="active">5</a></li>
							<li><a href="" class="active">6</a></li>
							<li><a href="" class="active">7</a></li>
							<li><a href="" class="active">8</a></li>
							<li><a href="" class="active">9</a></li>
							<li><a href="" class="active">10</a></li>
							
							<li class="nextPager">
								<a href="" title="다음 페이지로 이동하기">
									>
								</a>
							</li>
							<li class="lastPager">
								<a href="" title="마지막 페이지로 이동하기">
									>>
								</a>
							</li>
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