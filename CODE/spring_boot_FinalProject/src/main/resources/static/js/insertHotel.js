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
   $('.stay_date').val(picker.startDate.format('YYYY.MM.DD(dd)') + ' ~ ' + picker.endDate.format('YYYY.MM.DD(dd)'));

   });
   
	$("#file").on('change',function(){
 	 var fileName = $("#file").val();
  	$(".upload-name").val(fileName.split("\\").pop());
});
   

   
   
   
   $("#fileUploadFormMulti").on('submit', function(){
   
      // submit 이벤트 기본 기능 : 페이지 새로 고침
       // 기본 기능 중단
       event.preventDefault();
       
       var formData = new FormData($('#fileUploadFormMulti')[0]);
      
      $.ajax({
          type:"post",
          enctype: 'multipart/form-data',
          url:"/registerHotel",
          data: formData,
          contentType : false,
          processData : false,
          success:function(result){
            // 성공 시 결과 받음
            if(result){
               alert("등록되었습니다.");
               location.href = "/";
            }
         },
         error:function(){
            // 오류있을 경우 수행 되는 함수
            alert("전송 실패");
         }
       }); 
   });  
   
}); //ready끝