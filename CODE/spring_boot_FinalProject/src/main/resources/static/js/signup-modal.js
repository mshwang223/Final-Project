/********************************
 * 파일명 : signup-modal.js
 * 용 도 : 회원가입 모달팝업 
 * 작성자 : 황재윤
*********************************/
$(document).ready(function(){
	// 시작할 때 TXT 파일 읽어오기
	// 모달 팝업 기능 구현
	$("#subDetail1").click(function() {
		$("#signupModal").css('display', 'block');
		$("#signupModal > div").append('<div id="subpage1" class="showDetail"></div>');
		readTxtFile("subpage1", $("#subpage1"));
	});
	
	$("#subDetail2").click(function() {
		$("#signupModal").css('display', 'block');
		$("#signupModal > div").append('<div id="subpage2" class="showDetail"></div>');
		readTxtFile("subpage2", $("#subpage1"));
	});
	
	$("#subDetail3").click(function() {
		$("#signupModal").css('display', 'block');
		$("#signupModal > div").append('<div id="subpage3" class="showDetail"></div>');
		readTxtFile("subpage3", $("#subpage1"));
	});
	
	$("#subDetail4").click(function() {
		$("#signupModal").css('display', 'block');
		$("#signupModal > div").append('<div id="subpage4" class="showDetail"></div>');
		readTxtFile("subpage4", $("#subpage1"));
	});

 	function readTxtFile(fileName, id) {
 		$.ajax({
 			type:"post",
 			url:"subPage",
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