$(document).ready(function(){
	
   	var flag = $("#flag").val();
   	$("div.active").eq(flag).addClass("aSelected");
   	
   	// 페이지 번호 버튼 클릭했을 때
   	$(".active").click(function(e) {
   		var pageNum = parseInt($(this).attr('value') - 1);
   		var submitPath = "/adminInsertHotel/" + pageNum;
   		
   		$("#userFrm").attr('action', submitPath);
   		$("#userFrm").submit();
	});
	
	// 첫 페이지 버튼 클릭했을 때
   	$(".firstPager > div").click(function() {
   		var pageNum = parseInt(0);
   		var submitPath = "/adminInsertHotel/" + pageNum;
   		
   		$("#userFrm").attr('action', submitPath);
   		$("#userFrm").submit();   	
   	});

   	// 이전 버튼 클릭했을 때
   	$(".prevPager > div").click(function() {
   		var pageNum = parseInt(flag - 1);
   		var submitPath = "/adminInsertHotel/" + pageNum;
   		
   		if(pageNum < 0) {
   			alert("첫 페이지 입니다.");
   			return false;
   		}
   		
   		$("#userFrm").attr('action', submitPath);
   		$("#userFrm").submit();   	
   	});
   	
   	// 다음 버튼 클릭했을 때
   	$(".nextPager > div").click(function() {
   		var pageNum = parseInt(flag + 1);
   		var submitPath = "/adminInsertHotel/" + pageNum;
   		
   		if(pageNum >= $("#maxPage").val()) {
			alert("마지막 페이지입니다.");
			return false;
		}
   		
   		$("#userFrm").attr('action', submitPath);
   		$("#userFrm").submit();   	
   	});
   	
	// 첫 페이지 버튼 클릭했을 때
   	$(".lastPager > div").click(function() {
   		var pageNum = $("#maxPage").val() - 1;
   		var submitPath = "/adminInsertHotel/" + pageNum;
   		
   		$("#userFrm").attr('action', submitPath);
   		$("#userFrm").submit();   	
   	});
   	
     // 전체동의 체크박스 체크시 전체 체크
  	// 전체체크 선택 시 변수 값 저장
  	var arrRegId = new Array();	// 배열선언
	$('#allCheck').click(function() {
		if($(this).is(':checked')){	// 체크되었을 때
			$('.agree_subcheck').prop('checked', true);
			
			// 변수값 저장
			arrRegId = [];	// 초기화 필요
			$(".agree_subcheck:checked").each(function() {
				arrRegId.push($(this).val());
				
			});
			// console.log(arrRegId);
		} else {
			$('.agree_subcheck').prop('checked', false);
			
			// 변수값 제거
			$(".agree_subcheck").each(function() {
				arrRegId.shift($(this).val());
			});
		}
	});
	
	// 체크박스 선택 시 변수값 저장
	$(".agree_subcheck").on('click', function() {
		if($(".agree_subcheck:checked").length == 10) $('#allCheck').prop('checked', true);
		
		if($(this).is(':checked')) {
			arrRegId.push($(this).val());
		} else {
			arrRegId = arrRegId.filter((e) => e !== $(this).val());
			$('#allCheck').prop('checked', false);
		}
	});
	
	// 삭제 기능
	$("#adminRegDel").on('click', function() {

		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		// 유효성 추가
 		if(arrRegId.length == 0) {
 			alert("삭제 내역이 없습니다.");
 			return false;
 		} else {
 			if(confirm("삭제하겠습니까")) {
		 		$.ajax({
		 			type:"post",
		 			url:"/adminRegDelete",
		 			data:{ "regIds": JSON.stringify(arrRegId) },
		 			dataType:"text",
					success:function(result){
						// 성공 시 결과 받음
						if(result == "SUCCESS") {
							alert("삭제되었습니다.");
							location.href = "/adminInsertHotel/0";
						}
					},
					error:function(){
						// 오류있을 경우 수행 되는 함수
						alert("전송 실패");
					}
		 		}); 			
 			} else {
 				$('#allCheck').prop('checked', false);
	 			$(".agree_subcheck").prop('checked', false);
	 			arrRegId = [];	// 초기화 필요
	 		}
 		}
	});	

});

	