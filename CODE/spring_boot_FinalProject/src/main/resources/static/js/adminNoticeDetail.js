/********************************
 * 파일명 : notice.js
 * 용 도 : 관리자메뉴 공지사항 세부화면 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	
	// 목록버튼 클릭 시 공시사항 목록 화면으로 이동
	$(".btn_list_done").click(function() {
		location.href = "/notice";
	});
	
	/* summernote api 레이아웃 */
	$("#adminNoticeContents").summernote({
		outline: 0,
		height: 350,                 	// 에디터 높이
		minHeight: 350,             	// 최소 높이
		maxHeight: null,             	// 최대 높이
		focus: true,                  	// 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	});
});

	