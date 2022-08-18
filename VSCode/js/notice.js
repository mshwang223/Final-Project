/********************************
 * 파일명 : notice.js
 * 용 도 : 공지사항 드롭다운 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	
	// 로그인 드롭다운 확인
	var chk = 0;
	
	$(".dropdown-box").on('click', function() {
		$(".dropdown-contents").slideToggle(100, function() {
			if($(this).is(':hidden')){	// 닫힐 때
				chk = 1;
			} else {
				chk = 2;
			}
		});
	});
	
	// 외부 클릭 시 드롭다운 박스 히든
	$(window).click(function(event) {
		const pathId = event.target;
		var liArray = new Array("dp-all", "dp-title", "dp-contents");
	    
	    for(i in liArray) {
			if(pathId.id === liArray[i] ) {
				$("#dpBox-name").text(pathId.innerText);
				$(".dropdown-contents").hide();
			}
		}
				
		if (!event.target.matches('div.dpBox-div')) {
			if (chk == 2) $(".dropdown-contents").hide();
		}
	});
	
	
});

	