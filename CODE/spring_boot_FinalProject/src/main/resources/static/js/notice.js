/********************************
 * 파일명 : notice.js
 * 용 도 : 공지사항 드롭다운 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	
	// 로그인 드롭다운 확인
	$("#dropdown-box").on('click', function() {
		$(".dropdown-contents").slideToggle();
	});
	
	// 외부 클릭 시 드롭다운 박스 히든
	$(document).mouseup(function (e){
		var dropdownContainer = $(".dropdown-contents");
		var className = e.target.className;
		
		if(dropdownContainer.has(e.target).length === 0) {
			if(e.target.className != "dpBox-div") {
				dropdownContainer.hide();			
			}
		} else {
			if(e.target.className != "dpBox-div") {
				if(e.target.className == "dp-all") { 
					$("#dpBox-name").text("전체");
					$("#chk_search").val("0");
					dropdownContainer.hide();
				} else if(e.target.className == "dp-title") { 
					$("#dpBox-name").text("제목");
					$("#chk_search").val("1");
					dropdownContainer.hide();
				} else if(e.target.className == "dp-contents") {
					$("#dpBox-name").text("내용");
					$("#chk_search").val("2");
					dropdownContainer.hide();
				}			
			}	
		}
   	});
});

	