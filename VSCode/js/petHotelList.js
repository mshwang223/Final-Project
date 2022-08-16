$(document).ready(function(){
	// 지역 검색하기 클릭시 display : block css 토글
	$('#btnDestination').click(function(){
		$('.search_option').toggleClass('dis_block');
		$('#btnDestination').val('');
	});

	// 지역 클릭 시
  $('.list_location').click(function(){
    // 클릭한 list_location 클래스 부여
    $(this).addClass('add_text');
    // 부여한 클래스의 장소를 txt에 담아서 value 값 수정
    let txt1 = $('.add_text .location_detail1').text();
		let txt2 = $('.add_text .location_detail2').text();
		let txt3 = $('.add_text .location_detail3').text();
		let txt4 = $('.add_text .location_detail4').text();
		let txt5 = $('.add_text .location_detail5').text();
		let txt6 = $('.add_text .location_detail6').text();
    $('.input_destination').prop('value', txt1);
		$('.input_destination').prop('value', txt2);
		$('.input_destination').prop('value', txt3);
		$('.input_destination').prop('value', txt4);
		$('.input_destination').prop('value', txt5);
		$('.input_destination').prop('value', txt6);
    $('.search_option').toggleClass('dis_block');
    // 위의 과정이 끝나면 다시 클래스 제거
    $(this).removeClass('add_text');
  });

	// 인원수 | 반려동물 수 클릭시 display:block css 토글
	$('#btnCount').click(function(){
		$('.person_count_option').toggleClass('dis_block'); 
	}); 

	// 지역 검색 팝업 외부영역 클릭 시 팝업 딛기
  $(document).mouseup(function (e){
    var LayerPopup = $(".search_option");
    if(LayerPopup.has(e.target).length === 0){
      LayerPopup.removeClass("dis_block");
    }
  });

	// 인원수|반려동물 검색 팝업 외부영역 클릭 시 팝업 딛기
  $(document).mouseup(function (e){
    var LayerPopup = $(".person_count_option");
    if(LayerPopup.has(e.target).length === 0){
      LayerPopup.removeClass("dis_block");
    }
  });

	// 검색필터 영역 슬라이드토글
	$('#btnFilter').click(function(){
		$('.result_filter_select').slideToggle('500', function(){
			$('#arrowDown').toggleClass('fa-angle-down');
			$('#arrowDown').toggleClass('fa-angle-up');
		});
	});

});


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

