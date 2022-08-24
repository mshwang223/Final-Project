// petHotelRsv.js

$(document).ready(function(){
	// + 새 투숙객 추가하기 클릭시
	$('#newCustomer').click(function(){
		$('.box_cus_info2').slideToggle('500', function(){
			$('#plusBtn').toggleClass('fa-plus');
			$('#plusBtn').toggleClass('fa-minus');
		});
	});
	// 가격보상제도 클릭시
	$('#insurancePrice').click(function(){
		$('.info_insurance').slideToggle('500');
	});
	
	// 예약하기 버튼 클릭시
	$('#finalPayBtn').click(function(){
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
		
			return false;
		// 연락처 칸 비었을때
		}
		if($('#phNum').val() == ""){
			alert('휴대폰 번호를 확인해주세요');
			$('#phNum').focus();
			$('#phNum').focus(function(){
				$(this).css('border-color', '#ff4d4d');
				if($('#phNum').val()!=''){
					$(this).css('border-color', '#0a0a0a');
				}
			});
			return false;
		}
		if($('#mailId').val() == ""){
			alert('이메일을 확인해주세요');
			$('#mailId').focus();
			$('#mailId').focus(function(){
				$(this).css('border-color', '#ff4d4d');
				if($('#mailId').val()!=''){
					$(this).css('border-color', '#0a0a0a');
				}
			});
			return false;
		}
		if(!($('input[name=finalCheck]').is(':checked'))){
			alert('약관에 동의하여 주시기 바랍니다');
		}
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


