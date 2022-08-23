/********************************
 * 파일명 : signup.js
 * 용 도 : 회원가입 페이지 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	// 시작할 때 TXT 파일 읽어오기
	readTxtFile1("subpage1", $("#subpage1"));
	readTxtFile1("subpage2", $("#subpage2"));
	readTxtFile1("subpage3", $("#subpage3"));
	readTxtFile1("subpage4", $("#subpage4"));

 	function readTxtFile1(fileName, id) {
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
 	
	// 상세보기 버튼 슬라이드 토글
	$('.btn-close.sub1').click(function(){
		$('.subDetail-box.sub1').slideToggle(function() {
			if($(this).is(':hidden')){	// 체크되었을 때
				$('.btn-close.sub1').text('▼');
			} else {
				$('.btn-close.sub1').text('▲');
			}
		});
	});
	  
	// 상세보기 버튼1 슬라이드 토글
	$('.btn-close.sub2').click(function(){
		$('.subDetail-box.sub2').slideToggle(function() {
			if($(this).is(':hidden')){	// 체크되었을 때
				$('.btn-close.sub2').text('▼');
			} else {
				$('.btn-close.sub2').text('▲');
			}
		});
	});
	
	// 상세보기 버튼2 슬라이드 토글
	$('.btn-close.sub3').click(function(){
		$('.subDetail-box.sub3').slideToggle(function() {
			if($(this).is(':hidden')){	// 체크되었을 때
				$('.btn-close.sub3').text('▼');
			} else {
				$('.btn-close.sub3').text('▲');
			}
		});
	});
	
	// 상세보기 버튼3 슬라이드 토글
	$('.btn-close.sub4').click(function(){
		$('.subDetail-box.sub4').slideToggle(function() {
			if($(this).is(':hidden')){	// 체크되었을 때
				$('.btn-close.sub4').text('▼');
			} else {
				$('.btn-close.sub4').text('▲');
			}
		});
	});
	
	// 전체동의 체크박스 체크시 전체 체크
	$('#agree_checkAll').click(function() {
		if($(this).is(':checked')){	// 체크되었을 때
			$('.agree_subcheck').prop('checked', true);
		} else {
			$('.agree_subcheck').prop('checked', false);
		}
	});

  	// 전체 체크상태일 경우 : 전체동의 박스 체크
  	// 하나라도 체크되지 않은 상태 경우 : 전체동의 박스체크 해제
  	/*
  	$('.agree_subcheck1, .agree_subcheck2, .agree_subcheck3, .agree_subcheck4').click(function(){
  	   	if($('.agree_subcheck1').is(':checked')
    	&& $('.agree_subcheck2').is(':checked')
    	&& $('.agree_subcheck3').is(':checked')
    	&& $('.agree_subcheck4').is(':checked')){
      		$('input[name=agree_all_check]').prop('checked', true);
    	} else{
      		$('input[name=agree_all_check]').prop('checked', false);
    	}
  	});
  	*/
	
});//ready 끝

