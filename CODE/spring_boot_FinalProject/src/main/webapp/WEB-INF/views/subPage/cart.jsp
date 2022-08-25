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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/cart.css'/>">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script defer src="js/index.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <!-- header -->
        <c:import url="/WEB-INF/views/layout/top.jsp"/>
        
        <section class="wrap">
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
                        <button class="final_pay_btn" id="payment" onclick="payment()">결제하기</button>
                    </div>
                </div>
            </section>
              <div id="final_pay_modal" class="modal">
            <div class="modal-content">
             <img src="<c:url value='/images/petmilylogo.png'/>" alt="로고" class="btn"/>
                <div class="logo_box">
              
                </div>
                <span class="close">&times;</span>
                <hr>
                <div class="terms_of_agreement">
                    <span>이용약관</span>
                    <div style="float: right;">
                        <input type="checkbox" name="agree_all" id="agree_all" onclick="selectAll2(this)";/>
                        <label for="agree_all">전체동의</label>
                    </div>
                    <hr>
                    <div class="terms_of_agreement__details">
                        <div class="terms_of_agreement__detail">
                            <span>전자금융거래 이용약관</span>
                            <input type="checkbox" name="agree1" id="agree1">
                            <label for="agree1">동의</label>
                        </div>
                        <br>
                        <div class="terms_of_agreement__detail">
                            <span>개인정보의 수집 및 이용안내</span>
                            <input type="checkbox" name="agree1" id="agree2">
                            <label for="agree2">동의</label>
                        </div>
                        <div class="terms_of_agreement__detail">
                            <span>개인정보 제공 및 위탁안내</span>
                            <input type="checkbox" name="agree1" id="agree3">
                            <label for="agree3">동의</label>
                        </div>
                    </div>
                    <div class="terms_of_agreement__see_more">
                        <button>약관보기 
                            <i class="fa-solid fa-caret-down"></i>
                        </button>
                    </div>
                </div>
                <div class="payments">
                    <div class="payments__pays">
                        <button class="kakaopay">
                        <img src="<c:url value='/images/kakaopay_btn.png'/>" alt="">
                            <span>온 국민이 다 쓰는 카카오페이</span>
                        </button>
                        <button class="naverpay">
                            <img src="<c:url value='/images/naverpay_btn.png'/>" alt="">
                            <span>네이버페이로 결제하세요</span>
                        </button>
                    </div>
                    <div class="payments__cards">
                        <button class="card__hyundae">현대카드</button>
                        <button class="card__samsung">삼성카드</button>
                        <button>KB국민</button>
                        <button>비씨(페이북)</button>
                        <button>신한카드</button>
                        <button>NH농협</button>
                        <button>
                            하나카드
                        </button>
                        <button>씨티카드</button>
                        <button>롯데카드</button>
                        <button>UnionPay</button>
                        <button>그외카드</button>
                    </div>
                    <div class="payments__else">
                        <button>PAYCO</button>
                        <button>L.pay</button>
                        <button>그외결제</button>
                    </div>

                </div>
            </div>
        </div>
            
              <!--footer -->
            <c:import url="/WEB-INF/views/layout/footer.jsp"/>
            </section>
 <script src="js/cart.js"></script>
</body>
</html>