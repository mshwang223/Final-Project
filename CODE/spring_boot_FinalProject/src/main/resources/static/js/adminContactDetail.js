/********************************
 * 파일명 : adminContactDetail.js
 * 용 도 : 관리자-문의내역 세부화면 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){

	// 드롭다운 버튼
	$("#btnAnswerIBox").on('click', function() {
		$("#chkInUp").val("Insert");
		$(".trAnswerBox").toggle();
	});
	
	$("#btnAnswerUBox").on('click', function() {
		$("#chkInUp").val("Update");
		$(".trAnswerBox").toggle();
	});
		
	// 목록버튼 클릭 시 공시사항 목록 화면으로 이동
	$(".btn_list_done").click(function() {
		location.href = "/adminContactSearch/0";
	});
	
	/* summernote api 레이아웃 */
	$("#answers").summernote({
		height: 200,                 	// 에디터 높이
		minHeight: 200,             	// 최소 높이
		maxHeight: 200,             	// 최대 높이
		focus: true,                  	// 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		toolbar: ''
	});
	
	// 답변 저장
  	$("#answerFrm").on('submit', function(){
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		var formData = new FormData($('#answerFrm')[0]);

		$.ajax({
 			type:"post",
 			enctype: 'multipart/form-data',
 			url:"/adminSaveContact",
 			data: formData,
			contentType : false,
        	processData : false,
			success:function(result){
				// 성공 시 결과 받음
				if(result == "INSERT") alert("작성이 완료되었습니다.");
				else alert("수정되었습니다.");
				
				if($("#chkEmail").val() == "Y") {
					emailJS();
				} else {
					location.href = "/adminContactSearch/0";
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); 				
	});
	
	function emailJS() {
		emailjs.init("DYOAnc2AZ2xubnmFo");
		var tmpParams = {
			name : $("#userName").val(),
			email : $("#userEmail").val(),
			date : $("#modifyDate").val(),
			title : $("#title").val(),
			contents : $("textarea").val()
		};
		
		console.log(tmpParams);
		emailjs.send('petmilys', 'template_contact', tmpParams).then(function(response) {
			console.log('SUCCESS!', response.status, response.text);
			location.href = "/adminContactSearch/0";
		}, function(error) {
			console.log('FAILED...', error);
		});
	}
	
	// 다운로드
	$("#fileDownload").click(function() {
		location.href = "/fileDownload/" + $("#fileName").text();	
	});	
});

	