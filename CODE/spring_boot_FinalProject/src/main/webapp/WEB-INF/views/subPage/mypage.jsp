<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<link rel="icon" href="../images/logo_ico.png">
	 <!-- header -->
        <c:import url="/WEB-INF/views/layout/header.jsp"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/review-modal.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/top-modal.css'/>">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script defer src="js/mypage.js"></script>
	<script defer src="<c:url value='/js/review-modal.js'/>"></script>
	<link href="https://fonts.gogleapis.coom/icon?family=Material+Icons"
      rel="stylesheet">
      <link href="/assets/css/star.css" rel="stylesheet"/>
      </head>
       <!-- header -->
        <c:import url="/WEB-INF/views/layout/top.jsp"/>
      <body>
        <section class="wrap">   
        <!-- section -->
            <section class="mypage">
                <div class="mypage_box">
                    <div class="mypage_title">
                        <p>마이페이지</p>	
                    </div>
            <!-- 프로필 사진 -->
                    <div class="profile_area">
                        <div class="profile_img">
                            <img src="<c:url value='/images/profile.png'/>" id="profile_img__preview">
                            <form>
                                <div class="mypage_btn">
                                <label for="profile_input" id="input_profile_img">프로필 사진 편집</label>
                                <input type="file" id="profile_input" style="display: none;" onchange="readURL(this);">
                                <div class="user_info">
                                    <button>프로필 수정</button>
                                </div>
                                </div>
                            </form>
                        </div>
                        
                      
                    </div>
                    <div class="profile_menu">
                        <button class="accordion">문의 내역<span class="accordion__arrow">></span></button>
                        <div class="panel">
                            <p>aaaaaaaa</p>
                        </div>

                        <button class="accordion">나의 리뷰<span class="accordion__arrow">></span></button>
                        <div class="panel">
                            <p>aaaaaaaaaaa</p>
                        </div>

                        <button class="accordion">예약 내역<span class="accordion__arrow">></span></button>
                        <div class="panel">
                        <div class="panel_wrap">
                            <p>펫밀리가 떴다2 펜션</p>
                            <button id="review_btn">후기 남기러 가기</button>
                            </div>
                        </div>
                    </div>
                    <div id="reviewmodal" class="modal">
                    <!-- Modal Content -->
                    <div class="modal-content">
                    <img src="<c:url value='/images/petmilylogo.png'/>" alt="" height=70px;>
                    <span class="close">&times;</span>
                    <p>후기 남기기</p>
                    <hr>
                    <form id=reviewform">
                    <div class="star-rating">
                    <input type="radio" id="5-stars" name="rating" value="5" />
                    <label for="5-stars" class="star">&#9733;</label>
                    <input type="radio" id="4-stars" name="rating" value="4" />
                    <label for="4-stars" class="star">&#9733;</label>
                    <input type="radio" id="3-stars" name="rating" value="3" />
                    <label for="3-stars" class="star">&#9733;</label>
                    <input type="radio" id="2-stars" name="rating" value="2" />
                    <label for="2-stars" class="star">&#9733;</label>
                    <input type="radio" id="1-star" name="rating" value="1" />
                    <label for="1-star" class="star">&#9733;</label>
                  </div>
                    <textarea class="col-auto form-control" type="text" id="review" placeholder="후기를 남겨주세요" maxlength=100;></textarea>
                    </form>

                    
                    <input type="submit" id="submit-btn" value="후기남기기">
                    </div>
                    </div>
                    <br>
                    <div class="wented_title"> <p>이용한 패키지</p>
                       <br></div>
                    <div class="wented_hotel_wrap">
                    <div class="wented_hotel_container">
                        
                        <div class="wanted_hotel"><img src="<c:url value='/images/hotel1.jpg'/>" alt=""></div>
                            <div class="wanted_hotel"><img src="<c:url value='/images/hotel2.jpg'/>" alt=""></div>
                                <div class="wanted_hotel"><img src="<c:url value='/images/hotel3.jpg'/>" alt=""></div>
                                    <div class="wanted_hotel"><img src="<c:url value='/images/hotel4.jpg'/>" alt=""></div>
                            </div>
                            <img class="prev"  src="../images/left-arrow.png" alt="">
                            <img class="next"  src="../images/next.png" alt="">
                            </div>
                            <div class="wented_title"> <br><p>예약 현황</p><br></div>
                            <div class="profile_menu">
                            <button class="accordion">2022.03.13~2022.03.15  |  펫밀리가 떴다 펜션<span class="accordion__arrow">></span></button>
                            </div>

                        </div>
                  
                
              
            </section>
            
            <!--footer -->
            <c:import url="/WEB-INF/views/layout/footer.jsp"/>
          </section>
             
            </body>
            </html>