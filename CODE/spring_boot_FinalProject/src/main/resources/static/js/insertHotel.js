// insertHotel.js

$(document).ready(function(){
	
  let address1 = "";
  // 주소입력
  $('.btn_zipcode').on('click', function(){
    new daum.Postcode({
      oncomplete:function(data){
        address1 = "";
        
        // 도로명 주소인 경우
        if(data.userSelectedType == 'R'){
          address1 = data.roadAddress + "(" + data.bname + data.buildingName + ")";
        }else{
          // 지번인 경우
          address1 = data.jibunAddress;
        }
        
        // 입력란에 우편번호, 주소1 출력
        document.getElementById('zipCode').value = data.zonecode;
        document.getElementById('address1').value = address1;
        
        // 삭제 주소 입력하도록 이미 입력되어 있는 값 삭제하고 포커스
        let address2 = document.getElementById('address2');
        address2.value = "";
        address2.focus();
      }
    }).open();
  }); // click 끝
  
	// Daterangepicker
	var now = new Date();
	var today = (now.getMonth()+1) + "/" + now.getDate() + "/" + now.getFullYear();
	
	$(function(){
		$("#rangepicker").daterangepicker({
			locale: {
		  	daysOfweek: ['일','월','화','수','목','금','토'],
		  	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			},
		
			autoUpdateInput: false,
			autoApply: true,
			minDate: today
		});
	});
	
	$('input[name="daterange"]').on('apply.daterangepicker', function(ev,picker){
	$('.stay_date').val(picker.startDate.format('MM.DD(dd)') + ' ~ ' + picker.endDate.format('MM.DD(dd)'));

	});
	
}); //ready끝