$(document).ready(function(){
	// 지역 클릭시 display : block css 토글
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
		$('.input_destination').css('color', '#333');
		$('.input_destination').css('font-weight', '600');
    $('.search_option').toggleClass('dis_block');
    // 위의 과정이 끝나면 다시 클래스 제거
    $(this).removeClass('add_text');
  });
  
  $(".location_detail").click(function() {
  	$("input[name=areaCode]").val($(this).children('input').val());
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
    // 1명부터 -버튼 활성화
    if(personCount > 0){
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
		if(personCount == 0){
			$('#personMinusBtn').removeClass('btn_count_active');
			$('#personMinusBtn').removeAttr('href');
		}else if(personCount < 0){
			personCount = 0;
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

	
	$(".result_filter_option").click(function() {
		var submitPath;
		if($(this).val() == '0') {
			submitPath = "/petHotelList/0";
   			
   			$("#userFrm").attr('action', submitPath);
			$("#userFrm").submit();
		} else if($(this).val() == '1') {
			submitPath = "/petHotelList/1";
   			
   			$("#userFrm").attr('action', submitPath);
			$("#userFrm").submit();
		} else if($(this).val() == '2') {
			submitPath = "/petHotelList/2";
   			
   			$("#userFrm").attr('action', submitPath);
			$("#userFrm").submit();		
		} else {
			submitPath = "/petHotelList/3";
   			
   			$("#userFrm").attr('action', submitPath);
			$("#userFrm").submit();		
		}
	});
	
	// 로고 클릭시 index로
	$('.logo_box').click(function(){
		location.href = '/';
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
	$('.stay_date').val(picker.startDate.format('YYYY.MM.DD(dd)') + ' ~ ' + picker.endDate.format('YYYY.MM.DD(dd)'));
	$('.stay_date').css('font-weight', '600');
	$('.stay_date').css('color', '#333');

});
	// 검색버튼 클릭시 유효성 검사
	$('#listSearchBtn').click(function(){
		if($('#btnDestination').val() == '목적지를 검색하세요'){
			alert('목적지를 입력해주세요');
			return false;
		}else if($('#rangepicker').val() == '날짜를 입력해 주세요'){
			alert('유효한 날짜를 입력해주세요');
			return false;
		}else if($('#btnCount').val() == ''){
			alert('인원수를 입력해주세요');
			return false;
		}else{
			//widow.location.href = '/petHotelList';
			$("#userFrm").submit();
		}
	});
	
	
	// Detail페이지로 이동
	$('#resultHotelList div img').click(function(){
		var stay_no = $(this).parent('div').children('input[type=hidden]').val();
		//location.href = "/petHotelDetail/stayNo=" + stay_no + "&period=" + $("#rangepicker").val()+"&count=" + $("#btnCount").val();
		var actionAddress = "/petHotelDetail/stayNo=" + stay_no;

		$("#userFrm").attr('action', actionAddress);
		$("#userFrm").submit();
	});
	
	
	$('.like_btn').click(function(){
        if($(this).attr('src') == "/images/heart.png") {
            $(this).attr('src', '/images/red_heart.png');
        } else {
            $(this).attr('src', '/images/heart.png');
        }
    });
    
    // 행수에 따른 간격 조정
    var rowCnt = 4 - ($("#rowCnt").val() % 4);
    if(rowCnt > 0) {
    	for(var i = 0; i < rowCnt; i++) {
    		var tmpHtml = `<div id="resultHotelList" class="wrap_result_hotel_list">`;
    		tmpHtml += `<div class="result_hotel_img"></div>`;
    		tmpHtml += `<div class="wrap_whole"></div>`;
    		tmpHtml += `</div>`;
			$("div.list_box").append(tmpHtml);   	
    	}
    }
    
    // 검색필터 영역 슬라이드토글    
    
	$('#btnFilter').click(function(){
	var arrowDown = $('#arrowDown');
		if(arrowDown.hasClass('fa-angle-down')){
			  $(".result_filter_select").slideDown(500);
			  $('#arrowDown').addClass('fa-angle-up');
			  $('#arrowDown').removeClass('fa-angle-down');
			  return false;
		}else if(arrowDown.hasClass('fa-angle-up')){
			 $(".result_filter_select").slideUp(500);
			 $('#arrowDown').addClass('fa-angle-down');
			 $('#arrowDown').removeClass('fa-angle-up');
			 return false;
		}
	});

    // 검색필터 외부 클릭시 닫힘
   	$(document).mouseup(function (e){
	    var dropdown = $(".filter_popular");
	    if(!dropdown.is(e.target) && dropdown.has(e.target).length == 0){
	      $(".result_filter_select").slideUp(500);
	      $('#arrowDown').addClass('fa-angle-down');
	      $('#arrowDown').removeClass('fa-angle-up');
	 	}
	});
});



