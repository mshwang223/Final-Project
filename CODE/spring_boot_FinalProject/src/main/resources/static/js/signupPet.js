/********************************
 * 파일명 : signupPet.js
 * 용 도 : 펫등록 기능 구현
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	// 이미지 클릭 시 업로드
 	$("#profile_img_preview").click(function () {
	    $("#uploadFile").trigger('click');
	});
 
 	$("#uploadFile").on('change', function() {
 		setImageFromFile(this, '#profile_img_preview');
	});
	
	// 이미지 미리보기
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(expression).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}


	// 드롭다운 토글
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
					$("#petSize").text("소형");
					$("input[name=petSize]").val("1");
					dropdownContainer.hide();
				} else if(e.target.className == "midium") { 
					$("#petSize").text("중형");
					$("input[name=petSize]").val("2");
					dropdownContainer.hide();
				} else if(e.target.className == "large") {
					$("#petSize").text("대형");
					$("input[name=petSize]").val("3");
					dropdownContainer.hide();
				}			
			}	
		}
   	});
   	
   	// 펫 등록
   	$("input[name=petSize]").val("1");	// 기본값 선언
	$("#signupPet").on('submit', function(){
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		var formData = new FormData($('#signupPet')[0]);
		
		$.ajax({
 			type:"post",
 			enctype: 'multipart/form-data',
 			url:"/joinPet",
 			data: formData,
			contentType : false,
        	processData : false,
			success:function(result){
				// 성공 시 결과 받음
				if(result){
					alert("등록되었습니다.");
					location.href="/signupPetComplete/" + result;
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); 
	});  
   	
   	// 취소
   	$(".btn_cancel_done").click(function() {
   		//location.href="/myPage/" + $('#userId').val();
   		location.href="/mypage";
   	});
   	
   	
});//ready 끝

