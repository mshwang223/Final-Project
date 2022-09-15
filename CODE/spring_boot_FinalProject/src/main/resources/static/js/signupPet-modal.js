/********************************
 * 파일명 : signupPet-modal.js
 * 용 도 : 펫등록 모달팝업 
 * 작성자 : 황재윤
*********************************/
$(document).ready(function(){
	// 시작할 때 TXT 파일 읽어오기
	// 모달 팝업 기능 구현
	$("#subDetail > span").click(function() {
		$("#signupPetModal").css('display', 'block');
		$(".modal-content > div").empty();	// 초기화
		$(".modal-content > div").append('<div id="subpagePet" class="showDetail"></div>');
		readTxtFile("subpagePet", $("div#subpagePet"));
	});
	
 	function readTxtFile(fileName, id) {
 		$.ajax({
 			type:"post",
 			url:"subDoc",
 			data:{"fileName":fileName},
 			dataType:"text",
			success:function(result){
						
 				id.html(result);
 				
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			},
 		}); // ajax 끝 		
 	} 
});