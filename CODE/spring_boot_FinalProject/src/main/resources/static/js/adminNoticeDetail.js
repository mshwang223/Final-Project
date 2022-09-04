/********************************
 * 파일명 : adminNoticeDetail.js
 * 용 도 : 관리자메뉴 공지사항 세부화면 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	
	// 목록버튼 클릭 시 공시사항 목록 화면으로 이동
	$(".btn_list_done").click(function() {
		location.href = "/adminNoticeSearch/0";
	});
	
	/* summernote api 레이아웃 */
	$("#adminNoticeContents").summernote({
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
 			url:"/adminUpdateNotice",
 			data: formData,
			contentType : false,
        	processData : false,
			success:function(result){
				// 성공 시 결과 받음
				if(result){
					alert("수정되었습니다.");
					location.href = "/adminNoticeSearch/0/";
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); 
	});
	
	// 입력 기능
	$("#userFrmNew").on('submit', function() {
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
  		var formData = new FormData($('#userFrmNew')[0]);
		
		$.ajax({
 			type:"post",
 			enctype: 'multipart/form-data',
 			url:"/adminInsertNotice",
 			data: formData,
			contentType : false,
        	processData : false,
			success:function(result){
				// 성공 시 결과 받음
				if(result){
					alert("작성되었습니다.");
					location.href = "/adminNoticeSearch/0/";
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); 
	});
});

	