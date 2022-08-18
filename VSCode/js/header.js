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
	
	// 외부 클릭 시 드롭다운 박스 히든
	window.onclick = function(event) {
		const pathId = event.path[1].id;
		var divArray = new Array("dropdown-login", "login-form", "input-div", "forgotInfo");
		/*
		const cond1 = event.path[1].id == String("dropdown-login");
		const cond2 = event.path[1].id == String("login-form");
		const clickedInsideLoginForm = cond1 || cond2;
		*/
		for(i in divArray) {
			if(pathId === divArray[i] ) return false;
		}
		
		if (!event.target.matches('.loginForm')) {
			if (chk == 2) $("#dropdown-login").hide();
		}
	}

	// 호텔 / 펜션 페이지로 이동
	$('.ho_pen').click(function(){
		location.href = '/petHotel';
	});
	// 프로모션으로 이동
	$('.promotion_pack').click(function(){
		location.href = '';
	});
	// 공지사항 페이지로 이동
	$('.public_alert').click(function(){
		location.href = '/notice';
	});
});

	