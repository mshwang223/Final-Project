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
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mypage.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script defer src="js/mypage.js"></script>
	<link href="https://fonts.gogleapis.coom/icon?family=Material+Icons"
      rel="stylesheet">
      </head>
      
      <body>
        <section class="wrap">
        <!-- header -->
        <c:import url="/WEB-INF/views/layout/top.jsp"/>
        
        <!-- section -->
            <section class="mypage">
                <div class="mypage_box">
                    <div class="mypage_title">
                        <p>마이페이지</p>	
                    </div>
            <!-- 프로필 사진 -->
                    <div class="profile_area">
                        <div class="profile_img">
                            <img src="../images/profile.png" id="profile_img__preview">
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
                        <button class="accordion">적립금<span class="accordion__arrow">></span></button>
                        <div class="panel">
                            <p>aaaaaaaaaaa</p>
                        </div>

                        <button class="accordion">쿠폰 <span class="accordion__arrow">></span></button>
                        <div class="panel">
                            <p>aaaaaaaaaa</p>
                        </div>

                        <button class="accordion">나의 등급<span class="accordion__arrow">></span></button>
                        <div class="panel">
                            <p>aaaaaaaa</p>
                        </div>

                        <button class="accordion">찜한 상품<span class="accordion__arrow">></span></button>
                        <div class="panel">
                            <p>aaaaaaaaaaa</p>
                        </div>

                        <button class="accordion">예약 내역<span class="accordion__arrow">></span></button>
                        <div class="panel">
                            <p>aaaaaaaaaa</p>
                        </div>
                    </div>
                    <br>
                    <div class="wented_title"> <p>이용한 패키지</p>
                       <br></div>
                    <div class="wented_hotel_wrap">
                    <div class="wented_hotel_container">
                        
                        <div class="wanted_hotel"><img src="../images/hotel1.jpg" alt=""></div>
                            <div class="wanted_hotel"><img src="../images/hotel2.jpg" alt=""></div>
                                <div class="wanted_hotel"><img src="../images/hotel3.jpg" alt=""></div>
                                    <div class="wanted_hotel"><img src="../images/hotel4.jpg" alt=""></div>
                            </div>
                            <img class="prev"  src="../images/left-arrow.png" alt="">
                            <img class="next"  src="../images/next.png" alt="">
                            </div>
                            <div class="wented_title"> <br><p>추천 패키지</p><br></div>

                        </div>
                    
                
              
            </section>
            
            <!--footer -->
            <c:import url="/WEB-INF/views/layout/footer.jsp"/>
          </section>
             
            </body>
            </html>