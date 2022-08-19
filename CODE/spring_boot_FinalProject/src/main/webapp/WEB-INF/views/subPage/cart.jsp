<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장바구니</title>
	<link rel="icon" href="../images/logo_ico.png">
	   <!-- header -->
        <c:import url="/WEB-INF/views/layout/header.jsp"/>
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/cart.css">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script defer src="js/index.js"></script>
    <script src="js/cart.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <section class="wrap">
           <!-- header -->
        <c:import url="/WEB-INF/views/layout/top.jsp"/>
       
            <div class="cart_title">
                <p>장바구니</p>
            </div>
            <section class="cart">
                <div class="cart_box_sort">
                    <div class="cart_box">
                        <div id="cart_box__controller">
                            <div>
                                <input type="checkbox" name="package" value="selectall" onclick="selectAll(this)"/>
                                <span>전체선택(2/2)</span>
                            </div>
                            <button class="delete_btn">선택삭제</button>
                        </div>
                        <hr>
                        <div>
                            <div class="item">
                                <input type="checkbox" name="package" value="package1"/>
                                <button class="item__delete">
                                    <i class="fa-solid fa-xmark"></i>
                                </button>
                               <img src="<c:url value='/images/hotel4.jpg'/>"alt="상품" width="120" height="90">
                                <div class="item-info">
                                    <p class="item-info__brand">도그 하우스</p>
                                    <p class="item-info__name">ooooooooooooooooo</p>
                                    <p>oooooo</p>
                                    <button>주문변경</button>
                                </div>
                                <div class="item__price">
                                    <h3>500원</h3>
                                </div>
                            </div>
                            <hr>
                            <div class="item">
                                <input type="checkbox" name="package" value="package2"/>
                                <button class="item__delete">
                                    <i class="fa-solid fa-xmark"></i>
                                </button>
                                <img src="<c:url value='/images/hotel5.jpg'/>"alt="상품" width="120" height="90">
                                <div class="item-info">
                                    <p class="item-info__brand">도그 하우스2</p>
                                    <p class="item-info__name">oooooooooooooo</p>
                                    <p>ooooooooo</p>
                                    <button>주문변경</button>
                                </div>
                                <div class="item__price">
                                    <h3>500원</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cart_box_recommended">
                        <p class="cart_box__title">함께 보면 좋은 상품</p>
                        <hr>
                        <div class="recommended-item-ct">
                            <div class="recommended-item">
                                <img src="<c:url value='/images/hotel1.jpg'/>"alt="상품" width="120" height="90">
                                <p class="recommended-item-info__brand">oo</p>
                                <p class="recommended-item-info__name">oooooooooooooo</p>
                                <button>장바구니 담기</button>
                            </div>
                            <div class="recommended-item">
                                <img src="<c:url value='/images/hotel2.jpg'/>"alt="상품" width="120" height="90">
                                <p class="recommended-item-info__brand">oo</p>
                                <p class="recommended-item-info__name">oooooooooooooo</p>
                                <button>장바구니 담기</button>
                            </div>
                            <div class="recommended-item">
                                <img src="<c:url value='/images/hotel3.jpg'/>"alt="상품" width="120" height="90">
                                <p class="recommended-item-info__brand">oo</p>
                                <p class="recommended-item-info__name">oooooooooooooo</p>
                                <button>장바구니 담기</button>
                            </div>
                            <div class="recommended-item">
                                <img src="<c:url value='/images/hotel4.jpg'/>"alt="상품" width="120" height="90">
                                <p class="recommended-item-info__brand">oo</p>
                                <p class="recommended-item-info__name">oooooooooooooo</p>
                                <button>장바구니 담기</button>
                            </div>
                            <div class="recommended-item">
                                <img src="<c:url value='/images/hotel5.jpg'/>"alt="상품" width="120" height="90">
                                <p class="recommended-item-info__brand">oo</p>
                                <p class="recommended-item-info__name">oooooooooooooo</p>
                                <button>장바구니 담기</button>
                            </div>
                            
        
                        </div>
                    </div>
                </div>
                <div class="cart_box_final_pay">
                    <div class="final_pay">
                        <div class="final_pay_txt">최종 결제 금액</div>
                        <button class="final_pay_btn">결제하기</button>
                    </div>
                </div>
            </section>
            
              <!--footer -->
            <c:import url="/WEB-INF/views/layout/footer.jsp"/>
            </section>
 
</body>
</html>




 