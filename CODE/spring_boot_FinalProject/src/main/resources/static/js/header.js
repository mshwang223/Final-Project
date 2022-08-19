/********************************
 * 파일명 : header.js
 * 용 도 : 메인 페이지 header 로그인 회원가입 
 * 작성자 : 황재윤, 이동욱
*********************************/

$(document).ready(function(){
	
	// 로그인 드롭다운 확인
	var chk = 0;
	
	$(".loginForm").on('click', function() {
		$("#dropdown-login").slideToggle(function() {
			if($(this).is(':hidden')){	// 닫힐 때
				chk = 1;
			} else {
				chk = 2;
			}
		});
	});
	
 	// 탑 유저 이미지 드롭다운
 	$(".top_profile_img").on('click', function() {
		$("#dropdown-user").slideToggle(function() {
			if($(this).is(':hidden')){	// 닫힐 때
				chk = 1;
			} else {
				chk = 2;
			}
		});
	});
	
	// 외부 클릭 시 드롭다운 박스 히든
	window.onclick = function(event) {
		const pathId = event.path[1].id;

		var divArray = new Array("dropdown-login", "login-form", "input-div", "forgotInfo", "userPage");
		
		for(i in divArray) {
			if(pathId === divArray[i] ) return false;
		}
		
		if (!event.target.matches('.loginForm')) {
			if (chk == 2) $("#dropdown-login").hide();
		}

		if (!event.target.matches('.top_profile_img')) {
			if (chk == 2) $("#dropdown-user").hide();
		}
	}
	
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
	
	// 장바구니
	$('#admin').click(function() {
		location.href = "/admin";
	});
});

	