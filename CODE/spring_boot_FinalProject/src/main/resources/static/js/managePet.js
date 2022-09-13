/********************************
 * 파일명 : managePet.js
 * 용 도 : 펫수정 기능 구현
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
					chkNum = 1;
					dropdownContainer.hide();
				} else if(e.target.className == "midium") { 
					$("#petSize").text("중형");
					$("input[name=petSize]").val("2");
					chkNum = 1;
					dropdownContainer.hide();
				} else if(e.target.className == "large") {
					$("#petSize").text("대형");
					$("input[name=petSize]").val("3");
					chkNum = 1;
					dropdownContainer.hide();
				}			
			}	
		}
   	});
   	
   	// 초기화
   	var petSize = $("input[name=petSize]").val();
   	if(petSize == "1")
   		$("#petSize").text("소형");
   	else if(petSize == "2")
   		$("#petSize").text("중형");
   	else
   		$("#petSize").text("대형");
   		
   	// 수정내역 확인
   	var chkNum = 0;
   	$("input, textarea").on('keyup change', function() {
   		chkNum = 1;
   	});
   	
   	// 펫 수정
   	$("#updatePet").on('submit', function(){
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		// 수정내역 확인
 		if(chkNum == 0) {
 			alert("수정 내역이 없습니다.");
 			return false;
 		}
 		
 		var formData = new FormData($('#updatePet')[0]);
		
		if(confirm("수정하시겠습니까")) {
			$.ajax({
	 			type:"post",
	 			enctype: 'multipart/form-data',
	 			url:"/updatePet",
	 			data: formData,
				contentType : false,
	        	processData : false,
				success:function(result){
					// 성공 시 결과 받음
					if(result){
						alert("수정되었습니다.");
						location.href="/signupPetComplete/" + $("#petCode").val();
					}
				},
				error:function(){
					// 오류있을 경우 수행 되는 함수
					alert("전송 실패");
				}
	 		});
 		} else {
 			return false;
 		}
	});
	
	// 삭제
	
	// 펫 등록증 다운로드  
	$("#card_img_preview").click(function() {
		location.href = "/fileDownload/" + $("#imgName").val();	
	});
	
	// 삭제 기능
	$("#btn_delete_done").on('click', function() {
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
		if(confirm("삭제하겠습니까")) {
	 		$.ajax({
	 			type:"post",
	 			url:"/deletePet",
	 			data:{ "petId": $("#petId").val() },
	 			dataType:"text",
				success:function(result){
					// 성공 시 결과 받음
					if(result == "SUCCESS") {
						alert("삭제되었습니다.");
						location.href = "/mypage";
					}
				},
				error:function(){
					// 오류있을 경우 수행 되는 함수
					alert("전송 실패");
				}
	 		}); 			
		} else {
			return false;
 		}
	});	
	   	
   	// 취소
   	$("#btn_cancel_done").click(function() {
   		//location.href="/myPage/" + $('#userId').val();
   		location.href="/mypage";
   	});
   	
   	
});//ready 끝

