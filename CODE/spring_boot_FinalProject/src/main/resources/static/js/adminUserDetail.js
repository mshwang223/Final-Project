/********************************
 * 파일명 : adminUserDetail.js
 * 용 도 : 관리자메뉴 사용자관리 세부화면 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	// 목록 가기 버튼
	$(".btn_list_done").click(function() {
		location.href= "/adminUserSearch/0";
	});
	
	// Img 클릭
	$("#profile_img__preview").click(function() {
		$(".info_box").css('display', 'block');
		$(".pet_box").css('display', 'none');
	});
	
	$("#pet_img__preview").click(function() {
		$(".info_box").css('display', 'none');
		$(".pet_box").css('display', 'block');
	});
	
	// 권한 저장
	const chkAuthor = $("#userAuthor").val();
	$(".btn_save").click(function() {
		const userAuthor = $("#userAuthor").val();
		if(chkAuthor != userAuthor) {
			console.log(userAuthor);
			$.ajax({
			 	type:"post",
			 	url:"/adminUpdateUser",
			 	data: {"userId": $("#userId").val(), "userAuthor": userAuthor},
			 	success:function(result){
					// 성공 시 결과 받음
					alert("수정되었습니다.");
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
	
	
});

	