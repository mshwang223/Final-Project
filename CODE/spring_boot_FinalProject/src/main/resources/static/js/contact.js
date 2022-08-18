/********************************
 * 파일명 : contact.js
 * 용 도 : 문의하기 세부화면 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	
	// 답변메일 확인 체크박스 클릭 시 메일 박스 보여짐
	$("#chkEmail").on('change', function() {
		const chkEmail = $("#chkEmail").is(':checked');

		if(chkEmail) {
			$(".confirm-email").css('display', 'block');
		} else {
			$(".confirm-email").css('display', 'none');
		}
	});
	
	// textarea 엔터키 입력 시 자동 높이 조절
  	$('textarea').on( 'keyup', function (e){
	    $(this).css('height', 'auto');
	    $(this).height(this.scrollHeight);
	});
	
  	$('textarea').keyup();	
});

	