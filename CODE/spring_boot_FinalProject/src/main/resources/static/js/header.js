/********************************
 * 파일명 : header.js
 * 용 도 : 메인 페이지 header 로그인 회원가입 
 * 작성자 : 황재윤, 이동욱
*********************************/

$(document).ready(function(){
	
	// 로그인 드롭다운 확인
	var chk = 0;
	
	$(".dropdown").on('click', function() {
		$("#dropdown-login").slideToggle("show", function() {
			
			if($(this).is(':hidden')){	// 닫힐 때
				chk = 1;
			} else {
				chk = 2;
			}
		});
	});
	
	// 외부 클릭 시 드롭다운 박스 히든
	window.onclick = function(event) {
		const cond1 = String(event.path[1].id) === 'dropdown-login';
		const cond2 = String(event.path[1].id) === 'login-form';
		
		const clickedInsideLoginForm = cond1 || cond2;
		  
		if (clickedInsideLoginForm) return;
	  	
	  	if (!event.target.matches('.loginForm')) {
	  		if (chk == 2) $("#dropdown-login").hide();
		}
	}
});

	