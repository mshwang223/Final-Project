/********************************
 * 파일명 : header.js
 * 용 도 : 메인 페이지 slide show 이벤트 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){ 
	// 클릭 시 회원가입 페이지 이동
	$(".login_box span:nth-child(2)").on('click', function() {
		location.href = "/signup";
	});
});	