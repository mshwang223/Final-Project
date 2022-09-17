// petHotelRsv.js

$(document).ready(function(){
	// + 새 투숙객 추가하기 클릭시
	$('#newCustomer').click(function(){
		$('.box_cus_info2').slideToggle('500', function(){
			if($('#newCustomer').html() == '<i id="plusBtn" class="fa-solid fa-plus add_customer"></i>투숙객 추가(선택)'){
				$('#newCustomer').html('<i id="plusBtn" class="fa-solid fa-minus add_customer"></i>접기');
			}else{
				$('#newCustomer').html('<i id="plusBtn" class="fa-solid fa-plus add_customer"></i>투숙객 추가(선택)');
			}
		});
	});
	// 가격보상제도 클릭시
	$('#insurancePrice').click(function(){
		$('.info_insurance').slideToggle('500');
	});
	
	// 예약하기 버튼 클릭시 유효성 체크
	function validate() {
		var result = true;
		
		// 이름칸 비었을 때
		if($('#cusName').val() == ""){
			alert('투숙객명을 입력해주세요.');
			$('#cusName').focus();
      		$('#cusName').focus(function(){
        		$(this).css('border-color','#ff4d4d');
        		if($('#cusName').val() != ''){
        			$(this).css('border-color', '#0a0a0a');
        		}
			});
		
			result = false;
		// 연락처 칸 비었을때
		}else if($('#phNum').val() == ""){
			alert('휴대폰 번호를 확인해주세요');
			$('#phNum').focus();
			$('#phNum').focus(function(){
				$(this).css('border-color', '#ff4d4d');
				if($('#phNum').val()!=''){
					$(this).css('border-color', '#0a0a0a');
				}
			});
			result = false;
		}else if($('#mailId').val() == ""){
			alert('이메일을 확인해주세요');
			$('#mailId').focus();
			$('#mailId').focus(function(){
				$(this).css('border-color', '#ff4d4d');
				if($('#mailId').val()!=''){
					$(this).css('border-color', '#0a0a0a');
				}
			});
			result = false;
		}else if(!($('input[name=finalCheck]').is(':checked'))){
			alert('약관에 동의하여 주시기 바랍니다');
		}else{
			alert('성공적으로 예약이 완료되었습니다. 장바구니에서 확인해주세요');
		}
		
		return result;
	};
	
	//예약정보 저장
   	$("#userFrm").on('submit', function(){
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		
 		// 유효성 체크
 		if(!validate()) return false;
 		
 		
 		var formData = new FormData($('#userFrm')[0]);
		
		$.ajax({
 			type:"post",
 			enctype: 'multipart/form-data',
 			url:"/insertRsv",
 			data: formData,
			contentType : false,
        	processData : false,
			success:function(result){
				// 성공 시 결과 받음
				if(result == "SUCCESS"){
					//location.href="/cart";
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); 
	});	
	
	
	// select박스 이메일주소 값 text박스로 가져오기
    // 이메일 주소를 선택했을 때 직접 입력 칸 초기화, 비활성화
 	$('#cusSel').change(function () {
    	$('#cusSel option:selected').each(function(){
        	if($(this).val() == "") { //직접입력일 경우
           		$("#mailAddress").val("");
            	$("#mailAddress").attr("disabled", false);
       		}else{ //직접입력이 아닐경우
            	$("#mailAddress").val($(this).text());
            	$("#mailAddress").attr("disabled", true);
        }
    });
  });
  $('#cusSel2').change(function () {
    	$('#cusSel2 option:selected').each(function(){
        	if($(this).val() == "") { //직접입력일 경우
           		$("#emailAddress").val("");
            	$("#emailAddress").attr("disabled", false);
       		}else{ //직접입력이 아닐경우
            	$("#emailAddress").val($(this).text());
            	$("#emailAddress").attr("disabled", true);
        }
    });
  });
	

});// ready 끝


