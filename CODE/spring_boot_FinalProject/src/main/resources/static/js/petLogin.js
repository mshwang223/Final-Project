/********************************
 * 파일명 : petLogin.js
 * 용 도 : 펫로그인 기능 구현
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	// 이미지 클릭 시 업로드
 	$(".add_img_file").click(function () {
	    $("#uploadFile").trigger('click');
	});
 
 	$("#uploadFile").on('change', function() {
 		setImageFromFile(this, '#profile_img_preview');
 		$(".btnUpload_box > button").css('visibility', 'visible');
 		$("#profile_img_preview").css('opacity', '0.5');
 	});
	
	// 이미지 미리보기
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(expression).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	        reader = null;
	    }
	}
	
	// 이미지 취소 버튼 기능
	$(".btnUpload_box > #cancel").click(function() {
		$("#profile_img_preview").prop('src', '/images/bgpetCard.png');
		$("#profile_img_preview").css('opacity', '1');
		$(".img_box > div").css('display', 'block');
		$("#uploadFile").val("");	// 초기화
	});
	
	// 이미지 확인 버튼 기능
	$(".btnUpload_box > #confirm").click(function() {
 		// 유효성 체크
 		if($("#uploadFile").val() == "") {
 			alert("먼저 등록증을 업로드 해주세요.");
 			return false;
 		}	
	
		chkUpload = 1;
		$("#profile_img_preview").css('opacity', '1');
		$(".img_box > div").css('display', 'none');
	});		

   	
   	// 펫 로그인(OCR)
   	let chkUpload = 0;
   	$("#petLoginOCR").on('submit', function(){
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		// 유효성 체크
 		if($("#uploadFile").val() == "") {
 			alert("먼저 등록증을 업로드 해주세요.");
 			return false;
 		}
 		
 		if(chkUpload == 0) {
 			alert("업로드 이미지 확인 버튼을 클릭해 주세요.");
 			return false;
 		}
 		
 		var formData = new FormData($('#petLoginOCR')[0]);
		
		$.ajax({
 			type:"post",
 			enctype: 'multipart/form-data',
 			url:"/petLoginOCR",
 			data: formData,
			contentType : false,
        	processData : false,
			success:function(result){
				// 성공 시 결과 받음
			
				if(result == "SUCCESS"){
					alert("로그인 성공");
					location.href="/";
				} else {
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");
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
   		location.href="/";
   	});
   	
   	
});//ready 끝

