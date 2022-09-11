/********************************
 * 파일명 : adminServiceNew.js
 * 용 도 : 관리자메뉴 서비스 신규 세부화면 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	// 목록 가기 버튼
	$("#serviceSort").focus();
	
	$(".btn_list_done").click(function() {
		location.href= "/adminServiceSearch/0";
	});
	
	// 저장 기능
	$("#userFrm").on('submit', function() {
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
  		var formData = new FormData($('#userFrm')[0]);
		
		$.ajax({
 			type:"post",
 			enctype: 'multipart/form-data',
 			url:"/adminInsertService",
 			data: formData,
			contentType : false,
        	processData : false,
			success:function(result){
				// 성공 시 결과 받음
				if(result){
					alert("저장되었습니다.");
					location.href = "/adminServiceSearch/0/";
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); 
	});
});

	