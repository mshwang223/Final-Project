/********************************
 * 파일명 : signupPet.js
 * 용 도 : 펫등록 기능 구현
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	$(".dpBox-div").on('click', function() {
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
				if(e.target.className == "small") { 
					$("#pet_size").text("소형");
					dropdownContainer.hide();
				} else if(e.target.className == "midium") { 
					$("#pet_size").text("중형");
					dropdownContainer.hide();
				} else if(e.target.className == "large") {
					$("#pet_size").text("대형");
					dropdownContainer.hide();
				}			
			}	
		}
   	});
});//ready 끝

