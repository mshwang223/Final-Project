/********************************
 * 파일명 : contactDetail.js
 * 용 도 : 문의내역 세부화면 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	console.log($("#chkYN").val());
	if($("#chkYN").val() == '1') {
		$("input[name=title]").attr('readOnly', 'readOnly');
	}

	// 첨부 파일이 존재하면 보이기
	if($("#fileName").text()) $(".file-box").css('display', 'inline-block');

	// 이미지 클릭 시 업로드
 	$("#btn_img_done").click(function () {
 		$("#uploadFile").val("");	// 초기화
	    $("#uploadFile").trigger('click');
	});
	
	$("#uploadFile").on('change', function() {
 		var fileValue = $(this).val().split("\\");
 		var fileName = fileValue[fileValue.length - 1];	// 파일명
 		
 		$(".file-box").css('display', 'inline-block');
 		$("#fileName").text(fileName);

	});
	
	// 취소 버튼 클릭 시 초기화
 	$("#escFile").click(function () {
 		$(".file-box").css('display', 'none');
	    $("#uploadFile").val("");	// 초기화
	    $("#fileName").text("");
	});
	
	// 목록버튼 클릭 시 공시사항 목록 화면으로 이동
	$(".btn_list_done").click(function() {
		location.href = "/contactResult/0/" + $("#userId").val();
	});
	
	/* summernote api 내용 레이아웃 */
	$("#contactContents").summernote({
		height: 350,                 	// 에디터 높이
		minHeight: 350,             	// 최소 높이
		maxHeight: null,             	// 최대 높이
		focus: true,                  	// 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	});
	
	// 수정 기능
	var chkNum = 0;
	$("input[name=title]").change(function() {
		chkNum = 1;
	});
	
	const defaultVal = $("textarea[name=contents]").summernote('code');
	const defaultFile = $("#fileName").text();
	$("#userFrm").on('submit', function() {
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		// 값 변화 감지
 		const newVal = $("textarea[name=contents]").summernote('code');
 		const newFile = $("#fileName").text();
 		
 		if(defaultVal != newVal) {
 			chkNum = 1;
 		}
 		
 		if(defaultFile != newFile) {
 			chkNum = 1;
 		}
 		
 		if(chkNum == 0) {
 			alert("수정할 내역이 없습니다.");
 			return false;
 		}
 		
  		var formData = new FormData($('#userFrm')[0]);
		
		$.ajax({
 			type:"post",
 			enctype: 'multipart/form-data',
 			url:"/updateContact",
 			data: formData,
			contentType : false,
        	processData : false,
			success:function(result){
				// 성공 시 결과 받음
				if(result){
					alert("수정되었습니다.");
					location.href = "/contactResult/0/" + $("#userId").val();
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); 
	});
});

	