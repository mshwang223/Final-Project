$(document).ready(function(){
	// 지역 검색하기 클릭시 display : block css 토글
	$('#btnDestination').click(function(){
		$('.search_option').toggleClass('dis_block');
		// $('#btnDestination').val('');
	});

	// 지역 클릭 시
  $('.list_location').click(function(){
    // 클릭한 list_location 클래스 부여
    $(this).addClass('add_text');
    // 부여한 클래스의 장소를 txt에 담아서 value 값 수정
    let txt = $('.add_text .location_detail').text();
		$('.input_destination').attr('value', txt);
    $('.search_option').toggleClass('dis_block');
    // 위의 과정이 끝나면 다시 클래스 제거
    $(this).removeClass('add_text');
  });

	// 인원수 | 반려동물 수 클릭시 display:block css 토글
	$('#btnCount').click(function(){
		$('.person_count_option').toggleClass('dis_block'); 
	}); 

	// 인원 버튼 클릭할 때
  let personCount = parseInt($('#personCount').text());
  let petCount = parseInt($('#petCount').text());

  // 성인 + 버튼 클릭
  $('#personPlusBtn').click(function() {
    personCount++;
    // 2명부터 -버튼 활성화
    if(personCount > 1){
      $('#personMinusBtn').addClass('btn_count_active');
      $('#personMinusBtn').attr('href', '#');
    }
    $('#personCount').text(personCount);
    $('#btnCount').attr('value', '성인'+personCount+', 반려동물'+petCount);
  });

	// 성인 - 버튼 클릭
	$('#personMinusBtn').click(function(){
		personCount--;
		// 인원이 1 이 되면 - 버튼 비활성
		if(personCount == 1){
			$('#personMinusBtn').removeClass('btn_count_active');
			$('#personMinusBtn').removeAttr('href');
		}else if(personCount == 0){
			alert('최소 인원은 1명 이상이어야 합니다.');
			personCount = 1;
		}
		$('#personCount').text(personCount);
		$('#btnCount').attr('value', '성인'+personCount+', 반려동물'+petCount);
	});

	// 반려동물 + 버튼 클릭
	$('#petPlusBtn').click(function(){
		petCount++;
		// 2마리 부터 - 버튼 활성화
		if(petCount>1){
			$('#petMinusBtn').addClass('btn_count_active');
			$('#petMinusBtn').attr('href', '#');
		}
		$('#petCount').text(petCount);
		$('#btnCount').attr('value', '성인'+personCount+', 반려동물'+petCount);
	});

	// 반려동물 - 버튼 클릭
	$('#petMinusBtn').click(function(){
		petCount--;
		// 반려동물이 1 되면 - 버튼 비활성화
		if(petCount == 1){
			$('#petMinusBtn').removeClass('btn_count_active');
			$('#petMinusBtn').removeAttr('href');
		}else if(petCount == 0){
			alert('반려동물은 최소 1마리 이상이어야 합니다.');
			petCount = 1;
		}
		$('#petCount').text(petCount);
		$('#btnCount').attr('value', '성인'+personCount+', 반려동물'+petCount);
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
	// 로고 클릭시 index로
	$('.logo_box').click(function(){
		location.href = 'index.html';
	});
	// 탑버튼
	$('.top_btn').click(function (event) {
		event.preventDefault();
		$('html, body').animate({ scrollTop: 0 }, 300);
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
$('.stay_daterange').val(picker.startDate.format('MM.DD(dd)') + ' ~ ' + picker.endDate.format('MM.DD(dd)'));

});