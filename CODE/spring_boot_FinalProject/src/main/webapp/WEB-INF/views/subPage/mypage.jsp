<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>

    <!-- header -->
    <c:import url="/WEB-INF/views/layout/header.jsp"/>

    <link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/review-modal.css'/>">


    <script defer="defer" src="<c:url value='/js/mypage.js'/>"></script>

</head>

<body>
<!-- header -->
<c:import url="/WEB-INF/views/layout/top.jsp"/>

<section class="wrap">
    <!-- article -->
        <div class="pageTitle">
            <div>
                <span>#마이페이지</span>
            </div>
        </div>

        <div class="mypage_box">
            <!-- 프로필 사진 -->
            <div class="profile_area">
                <div class="profile_img">
                    <c:if test="${user.userImg != '' && user.userImg ne null && !empty user.userImg }">
                        <img src="/myProfileImg" id="profile_img__preview">
                    </c:if>
                    <c:if test="${user.userImg == '' && user.userImg eq null || empty user.userImg }">
                        <img src="<c:url value='/images/profile.png'/>" id="profile_img__preview" accept="image/*">
                    </c:if>
                    <div class="mypage_btn">
                        <div class="mypage_input">
                            <form id="imageForm" method="post" action="/updateUserImg" enctype="multipart/form-data">
                                <label for="profile_input" id="input_profile_img">프로필 사진 편집</label>
                                <input type="file" name="userImg" id="profile_input" style="display: none;">
                            </form>
                            <div id="unRegister" class="unregister">회원탈퇴</div>
                        </div>
                    </div>
                </div>

                <div class="user_info">
                	<div>
	                        	<button id="modifyUser" onclick="uploadprofile()">프로필 수정</button>
	                        	<c:if test="${empty petUserId}">
									<button id="signupPet" onclick="signupPet()">펫 등록</button>
								</c:if>
	                        	<c:if test="${not empty petUserId}">
									<button id="managePet" onclick="managePet()">펫 관리</button>
								</c:if>                        	
                        	</div>

                    <div>
                        <div>이 름 : <%=session.getAttribute("userName") %>
                        </div>
                        <div id="userName"></div>
                    </div>

                    <div>
                        <div>이메일 : <%=session.getAttribute("userEmail") %>
                        </div>
                        <div id="userEmail"></div>
                    </div>
                </div>
            </div>

            <div class="profile_menu">

                <button class="accordion">나의 리뷰<span class="accordion__arrow">></span></button>
                <div class="panel">
                
                </div>

                <button class="accordion">이용 내역<span class="accordion__arrow">></span></button>
                <div class="panel">
                    <c:forEach items="${reservationList}" var="list" varStatus="status">
                        <div class="panel_wrap">
                            <p>${list.stayName}</p>
                            <c:if test="${list.reviewId == null or list.reviewId ==''}">
                                <button class="review_btn" data-ordno="${list.ordNo}" data-stayno="${list.stayNo}">후기 남기러 가기</button>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <br>
            <div class="wented_title"><p>찜한 숙소</p>
                <br></div>
            <div class="wented_hotel_wrap">
                <div class="wented_hotel_container">

                   	<c:forEach items="${likeList}" var="likeList" varStatus="status">
                   		<c:choose>
	                   		<c:when test="${likeList.stayNo ne null }">
	                   			<div class="wanted_hotel"><img src="<c:url value='/petHotelImg/${likeList.serviceImg }/1.png'/>" alt="">
	                   				<i class="fa-regular fa-circle-xmark like_close" data-likeId = "${likeList.likeId }"></i>
	                   				<input type="hidden" name="likeId" value="${likeList.likeId}" id="likeId">
	                   			</div>
							</c:when>
							<c:otherwise>
	                   			<div class="wanted_hotel"><img src="<c:url value='/comImg/${likeList.serviceImg }/1.png'/>" alt="">
	                   				<i class="fa-regular fa-circle-xmark like_close" data-likeId = "${likeList.likeId }"></i>
	                   				<input type="hidden" name="likeId" value="${likeList.likeId}" id="likeId">
	                   			</div>
							</c:otherwise>
						</c:choose>
					 </c:forEach>
					 <script>
					 $(document).ready(function () {
							// 마이페이지 찜 삭제
						    $('.like_close').click(function(){
						    	let likeId = $(this).parent().children("input[type=hidden]").val();
								console.log("likeId = " + likeId);

						    	$.ajax({
						        type: "post",
						        url: "/deleteMyLike",
						        data: {
						        		  "likeId": likeId
						        		},
						        success: function (result) {
						            if (result == "result") {
						                alert("삭제되었습니다.");
						                location.reload();
						            }
						        },
						        error: function () {
						            alert("error");
						        }
						    });

				      	});
					 });
					 </script>
					  
					
                </div>
                <img class="prev" src="../images/left-arrow.png" alt="">
                <img class="next" src="../images/next.png" alt="">
            </div>
           <div class="wented_title"><br>
                <p>예약 현황</p><br></div>
            <div class="profile_menu">
                <c:forEach items="${orderList}" var="list" varStatus="status">
                    <button class="accordion">${list.period} | ${list.name}<span class="accordion__arrow">></span>
                    </button>
                </c:forEach>
            </div>

        </div>
</section>

<div id="reviewmodal" class="modal">
    <!-- Modal Content -->
    <div class="modal-content">
        <img src="<c:url value='/images/petmilylogo.png'/>" alt="" height=70px;>
        <span class="close">&times;</span>
        <p>후기 남기기</p>
        <hr>
        <form class="form-group" id=reviewForm" action="/review" method="post">
            <input id="stayNo" type="hidden" name="stayNo">
            <input id="regId" type="hidden" name="regId">
            <input id="ordNo" type="hidden" name="ordNo">
            <div class="star-rating">
                <input type="radio"   id="5-stars" checked="checked" name="point" value="5"/>
                <label for="5-stars" class="star">&#9733;</label>

                <input type="radio" id="4-stars" name="point" value="4"/>
                <label for="4-stars" class="star">&#9733;</label>

                <input type="radio" id="3-stars" name="point" value="3"/>
                <label for="3-stars" class="star">&#9733;</label>

                <input type="radio" id="2-stars" name="point" value="2"/>
                <label for="2-stars" class="star">&#9733;</label>

                <input type="radio" id="1-star" name="point" value="1"/>
                <label for="1-star" class="star">&#9733;</label>
            </div>
            <textarea class="col-auto form-control" type="text" required="required" id="review" placeholder="후기를 남겨주세요"
                      name="contents" axlength=100;></textarea>
        <input type="submit" id="submit-btn" value="후기남기기">
        </form>

    </div>
</div>

<script defer="defer" src="<c:url value='/js/review-modal.js'/>"></script>
<!--footer -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>