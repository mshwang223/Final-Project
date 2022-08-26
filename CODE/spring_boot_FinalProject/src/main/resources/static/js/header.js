/********************************
 * 파일명 : header.js
 * 용 도 : 메인 페이지 header 로그인 회원가입 
 * 작성자 : 황재윤, 이동욱
*********************************/

$(document).ready(function(){

	// 메뉴 따라오기
	$(window).scroll(function() {
		if($(this).scrollTop() > 50) {
			$("header").addClass('header-move');
			$("header > div").addClass('headerDiv-move');

			$(".logo_box").css('visibility', 'hidden');
		} else {
			$("header").removeClass('header-move');
			$("header > div").removeClass('headerDiv-move');

			$(".logo_box").css('visibility', 'visible');
		}
	});

	$(".loginForm").on('click', function() {
		$("#dropdown-login").slideToggle();
	});
	
 	// 탑 유저 이미지 드롭다운
 	$(".top_profile_img").on('click', function() {
		$("#dropdown-user").slideToggle();
	});
	
	// 외부 클릭 시 드롭다운 박스 히든
	$(document).mouseup(function (e){
		// 로그인 토글
		var loginContainer = $("#dropdown-login");
		if(loginContainer.has(e.target).length === 0 && e.target.className != "loginForm"){
			if(window.getSelection().anchorNode === $("#input-div")[0]) return false;
		
			loginContainer.hide();
		}
		
		// 사용자 토글
		var userContainer = $("#dropdown-user");
		if(loginContainer.has(e.target).length === 0 && e.target.className != "top_profile_img"){
			userContainer.hide();
		}
   	});
	
	
	// 로그인
	$('.dropdown_botton').click(function() {
 		
 		// 유효성
 		if(!validate($('#userId'), "아이디를 입력하세요.")) return false;
 		if(!validate($('#userPw'), "비밀번호를 입력하세요.")) return false;
 		
 		// submit 수행
	
	 		$.ajax({
	 			type:"post",
	 			url:"/login",
	 			data:{"userId":$('#userId').val(),
	 				  "userPw":$('#userPw').val()},
				dataType:"text",
				success:function(result){
					// 성공 시 결과 받음
					if(result == "SUCCESS"){
						alert("로그인 성공");
						location.href="/";
					}else{
						alert("아이디 또는 비밀번호가 일치하지 않습니다.");
					}
				},
				error:function(){
					// 오류있을 경우 수행 되는 함수
					alert("전송 실패");
				}
	 		});
	});
	
	// 유효성 함수
	function validate(data, text) {
 		if(data.val() == "") {
 			data.prop("placeholder", text);
 			data.focus();
 			
 			return false;
 		}
 		return true;
	}
	
   // 탑버튼 기능
   $('.top_btn').click(function (event) {
      event.preventDefault();
      $('html, body').animate({ scrollTop: 0 }, 300);
   });
	
	// 마이페이지
	$('#myPage').click(function() {
		location.href = "/mypage";
	});
		
	// 로그아웃
	$('#logout').click(function() {
		location.href = "/logout1";
	});
	
	// 장바구니
	$('#myCart').click(function() {
		location.href = "/cart";
	});
	
	// 관리자 페이지 이동
	$('#admin').click(function() {
		location.href = "/admin";
	});
	// 업체등록 페이지 이동
	$('#inputHotel').click(function(){
		location.href = "/insertHotel";
	})
});

	