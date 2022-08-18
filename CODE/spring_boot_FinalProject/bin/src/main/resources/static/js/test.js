// 왕복 편도 다구간 선택
let flightShuttleBtn = document.getElementsByClassName('flight_shuttle_select');

function shuttleClick(event){
  if(event.target.classList[1] == "selectBtn"){
    event.target.classList.remove("selectBtn");
  }else{
    for(let i = 0; i < flightShuttleBtn.length; i++){
      flightShuttleBtn[i].classList.remove("selectBtn");
    }
    event.target.classList.add("selectBtn");
  }
}

function shuttleInit(){
  for(let i = 0; i < flightShuttleBtn.length; i++){
    flightShuttleBtn[i].addEventListener('click',shuttleClick);
  }
}
shuttleInit();

// 데이터 피커 수정 jQuery

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

          
          }).on('apply.daterangepicker',function(ev, picker) {
            picker.element.val(flightShuttle());
          });
          

		
		
	});


$('input[name="daterange"]').on('apply.daterangepicker', function(ev,picker){
$(this).val(picker.startDate.format('MM.DD(dd)') + ' ~ ' + picker.endDate.format('MM.DD(dd)'));
});


function flightShuttle(){
  if($('roundTrip').hasClass('selectBtn')){
    singleDatePicker: false
  }else if($('oneWay').hasClass('selectBtn')){
    singleDatePicker: true
  }
}






