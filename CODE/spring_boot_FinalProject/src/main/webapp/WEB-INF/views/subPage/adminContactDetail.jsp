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
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/adminContactDetail.css"/>">
		
		<script src="<c:url value="/js/adminContactDetail.js"/>"></script>
	</head>
	
	<body>
		<!-- header  -->
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
			
		<section class="wrap">
			<!-- 세부화면 레이아웃 시작 -->
			<article class="noticeBox">
				<div class="pageTitle">
					<div>
						<span>#문의내역</span>
					</div>
				</div>
				<div class="table-box">
					<table>
						<thead>
							<tr>
						      	<th colspan="2">${notice.title}<input type="hidden" id="title" value="${notice.title}" /></th>
						    </tr>
						</thead>
						<tbody>
						    <tr>
						      	<td class="titles" colspan="2">
						      		<input type="hidden" id="modifyDate" value="<fmt:formatDate value="${notice.modifyDate}" pattern="yyyy-MM-dd HH:mm:dd"/>" />
						      		${notice.userName}<input type="hidden" id="userName" value="${notice.userName}" />&nbsp;&nbsp; | &nbsp;&nbsp; 
						      		작성일 :<fmt:formatDate value="${notice.modifyDate}" pattern="yyyy-MM-dd HH:mm:dd"/>&nbsp;&nbsp; | &nbsp;&nbsp;
						      		Email 답변 여부 : ${notice.chkEmail}<input type="hidden" id="chkEmail" value="${notice.chkEmail}" />
						      		<input type="hidden" id="userEmail" value="${userEmail}" />
						      	</td>
						    </tr>
						    <tr>
						      	<td colspan="2">
						      		<div class="contents">
							      		${notice.contents}
						      		</div>
						      		<c:if test="${notice.chkYN eq '0'}">
						      			<button type="button" id="btnAnswerIBox" class="btnAnswerBox">답변 작성</button>
						      		</c:if>
						      		<c:if test="${notice.chkYN eq '1'}">
						      			<button type="button" id="btnAnswerUBox" class="btnAnswerBox">답변 수정</button>
						      		</c:if>
						      	</td>
						    </tr>
						    <tr class="trAnswerBox">
						    	<td class="answer-title" colspan="2">답변</td>
						    </tr>
						    <tr class="trAnswerBox">
						      	<td colspan="2" class="answer-box">
						      		<form id="answerFrm" name="answerFrm">
						      			<input type="hidden" id="chkInUp" name="chkInUp" value="" />
						      			<input type="hidden" name="boardId" value="${notice.boardId}" />
										<textarea id="answers" name="comment" maxlength="500">${answer.comment}</textarea>
										<button type="submit" id="btnAnswer" class="btnAnswer">저 장</button>
									</form>
						      	</td>
						    </tr>
						    <c:if test="${not empty notice.chkFile}">
						    <tr class="tr-file">
						    	<td class="paging-td file">첨부파일</td>
						      	<td>
								    <div class="file-box">
								    	<div id="fileName">${notice.chkFile}</div>
								    </div>
								    <button type="button" id="fileDownload" class="fileDownload">다운로드</button>
						      	</td>
						    </tr>
						    </c:if>
						    <tr>
						      	<td class="paging-td">▲ 다음글</td>
						      	<td>
						      		<c:if test="${empty notice.nextTitle}">
						      			마지막 글입니다.
						      		</c:if>
						      		<c:if test="${not empty notice.nextTitle}">
						      			${notice.nextTitle}
						      		</c:if>
						      	</td>
						    </tr>
						    <tr>  	
						      	<td class="paging-td">▼ 이전글</td>
						      	<td>
						      		<c:if test="${empty notice.prevTitle}">
						      			첫 번째 글입니다.
						      		</c:if>
						      		<c:if test="${not empty notice.prevTitle}">
						      			${notice.prevTitle}
						      		</c:if>						      	
						      	</td>
						    </tr>
						</tbody>
					</table>
				    <div class="btn_list_box">
				    	<button class="btn_list_done">목록</button>
				    </div>
				</div>
			</article>
			<!-- 세부화면 레이아웃 종료 -->
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>