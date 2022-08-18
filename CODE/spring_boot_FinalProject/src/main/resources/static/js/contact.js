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
  	$(".contents-box textarea").on('keyup', function(e) {
	    //$(this).css('height', 'auto');
	    $(this).height(this.scrollHeight);
	    
	    //글자 수 체크
	    var cntTxt = $(this).val().length;
	    $("#cntContents").text(cntTxt);
	    
	    if(cntTxt == 500) $(".cntContents, #cntContents").css('color', 'red');
	});
	
	// 문의제목 글자수
  	$(".contents-box input").on('keyup', function(e) {
	    //글자 수 체크
	    var cntTxt = $(this).val().length;
	    $("#cntTitle").text(cntTxt);
	    
	    if(cntTxt == 50) $(".cntTitle, #cntTitle").css('color', 'red');
	});
	
	// 유효성 체크
	// 문의제목
	$(".contents-box input[type=text]").on('focusout change keyup', function(e) {
		//if(e.keyCode == 9) return;
		
		if($(this).val() == "")  {
			$(this).css('border-bottom-color', 'red');
			$(".span-title").css('visibility', 'visible');
			$(".cntTitle, #cntTitle").css('color', 'red');
		} else {
			$(this).css('border-bottom-color', '#ee82ee');
			$(".span-title").css('visibility', 'hidden');
			$(".cntTitle, #cntTitle").css('color', 'black');
		}
	});

	
	// 문의내용
	$(".contents-box textarea").on('focusout change keyup', function(e) {
		// Tab키 입력 이벤트 방지
		if(e.keyCode == 9) return;
		
		if($(this).val() == "")  {
			$(this).css('border-bottom-color', 'red');
			$(".span-contents").css('visibility', 'visible');
			$(".cntContents, #cntContents").css('color', 'red');
		} else {
			$(this).css('border-bottom-color', '#ee82ee');
			$(".span-contents").css('visibility', 'hidden');
			$(".cntContents, #cntContents").css('color', 'black');
		}
	});
});

	