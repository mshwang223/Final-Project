$(document).ready(function(){	
  // Daterangepicker
	var now = new Date();
	var today = (now.getMonth()+1) + "/" + now.getDate() + "/" + now.getFullYear();
	
	$(function(){
		$(".stay_date").daterangepicker({
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
	$('#rangepicker1').val(picker.startDate.format('MM.DD(dd)'));
});

    $('input[name="daterange"]').on('apply.daterangepicker', function(ev,picker){
    $('#rangepicker2').val(picker.endDate.format('MM.DD(dd)'));
	
	calculate();
});



  // 인원검색 영역 클릭시
  $('.info_content_count').click(function(){
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
    $('#infoCount').attr('value', '성인'+personCount+', 반려동물'+petCount);
  });

	// 성인 - 버튼 클릭
	$('#personMinusBtn').click(function(){
		personCount--;
		// 인원이 1 이 되면 - 버튼 비활성
		if(personCount == 0){
			$('#personMinusBtn').removeClass('btn_count_active');
		}else if(personCount < 0){
			personCount = 0;
		}
		$('#personCount').text(personCount);
		$('#infoCount').attr('value', '성인'+personCount+', 반려동물'+petCount);
	});

	// 반려동물 + 버튼 클릭
	$('#petPlusBtn').click(function(){
		petCount++;
		// 2마리 부터 - 버튼 활성화
		if(petCount>1){
			$('#petMinusBtn').addClass('btn_count_active');
		}
		$('#petCount').text(petCount);
		$('#infoCount').attr('value', '성인'+personCount+', 반려동물'+petCount);
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
		$('#infoCount').attr('value', '성인'+personCount+', 반려동물'+petCount);
	});
	
	// 인원수|반려동물 검색 팝업 외부영역 클릭 시 팝업 딛기
  $(document).mouseup(function (e){
    var LayerPopup = $(".person_count_option");
    if(LayerPopup.has(e.target).length === 0){
      LayerPopup.removeClass("dis_block");
    }
  });


  //상세 숙소 편의 시설 토글
  $('.additional_click').click(function(){
    $('.additional_cs').slideToggle(500, function(){
      $("#additionalClick").toggleClass('fa-chevron-down');
      $("#additionalClick").toggleClass('fa-chevron-up');
    });
    
  });
  
    //후기 이동
	$('.review_move').click(function(){
	      $('html,section').animate({scrollTop : 2800},300);
	   });
	   
	//주소 복사하기
	const location = document.getElementById('address');
	$('#locationCopy').click(function(){
		window.navigator.clipboard.writeText(location.textContent).then(() => {
			// 복사가 완료되면 호출
			$('#copy_box').css('display', 'flex');
			$('#copy_box').fadeOut(3000, 'swing');
		});
		
	});
	
    //연락처 복사하기
	const call = document.getElementById('hotelCallNumber');
	$('#phoneCopy').click(function(){
		window.navigator.clipboard.writeText(call.textContent).then(() => {
			// 복사가 완료되면 호출
			$('#copy_box').css('display', 'flex');
			$('#copy_box').fadeOut(2500, 'swing');
		});
		
	});
	
	
	// reservation페이지로 이동
	$('.book_btn').click(function(){
		var stay_no = $('.sticky_area').children('input[type=hidden]').val();
		window.location.href = "/petHotelRsv/stayNo=" + stay_no + "&period=" + $("#rangepicker").val();
	});
	
	// 현재 스크롤 위치
	var scrollValue;
	$(window).scroll(function () { 
		scrollValue = $(document).scrollTop(); 
	    //console.log(scrollValue); 
	});
	
   // 후기 더 보기 클릭했을 때 모달창 켜기
   $('.review_more_btn').click(function(){
      $('.black_bg').css({"top" : scrollValue + "px"});
      $('.black_bg').css('display', 'block');
      $('.review_container').css('display', 'flex');
      $('.review_container').draggable();
      $('html, body').css({'overflow': 'hidden', 'height': '100%'});
      $('.black_bg').on('scroll touchmovel', function(event) {
        event.preventDefault();
        event.stopPropagation();
        return false;
      });
   });      

	// 엑스 눌렀을 때 모달창 끄기
	$('.review_close').click(function(){
		$('.black_bg').css('display', 'none');
		$('.review_container').css('display', 'none');
		$('.black_bg').off('scroll touchmove');
		$('html, body').css({'overflow': 'visible', 'height': '100%'});
	});
	
	// 외부 눌렀을 때 모달 창 끄기
	  $(document).mouseup(function (e){
		    var reviewContainer = $(".review_container");
		    if(reviewContainer.has(e.target).length === 0){
		      	$('.black_bg').css('display', 'none');
				$('.review_container').css('display', 'none');
				$('.black_bg').off('scroll touchmove');
				$('html, body').css({'overflow': 'visible', 'height': '100%'});
		    }
   	});

	// naver geocode
	var coordinate = $("#coordinate").val().split(",");
	var x = coordinate[0];
	var y = coordinate[1];
	// naver maps 지도
	var map = new naver.maps.Map('map',{
	  center: new naver.maps.LatLng(y, x),
	  zoom: 18
	});
	
	var marker = new naver.maps.Marker({
	  position: new naver.maps.LatLng(y, x),
	  map: map
	});	
	
	// 선택 버튼 클릭 시 계산
	$("#roomPrice").text($("div.room_box > div").eq(0).text().replace("₩", ""));
	calculate();
	$(".room_btn").click(function() {
		var txtPrice = $(this).parent().children('div').text();
		var price = txtPrice.replace(/[₩,원]/g, "");	// 정규식
		
		$("#roomPrice").text(txtPrice.replace("₩", ""));
		
		calculate();
	});
	
	
	function calculate() {
		var txtStartDate = $("#rangepicker1").val();
		var textEndDate = $("#rangepicker2").val();
		
		const year = new Date().getFullYear();
		
		// 시작일자
		var startYear = year;
		var startMonth = Number(txtStartDate.substr(0, 5).split(".")[0]);
		var startDate = startYear + txtStartDate.substr(0, 5).replace(".", "");
		
		// 종료일자
		var endYear = year;
		var endMonth = Number(textEndDate.substr(0, 5).split(".")[0]);
		
		if(startMonth > endMonth) endYear += 1;
		var endDate = endYear + textEndDate.substr(0, 5).replace(".", "");
		
		var totalDay;
		
		if(startMonth > endMonth) totalDay = parseFloat(startDate)- parseFloat(endDate); 
		else totalDay = parseFloat(endDate)- parseFloat(startDate); 
		
		// 1번째
		var roomPrice = $("#roomPrice").text();
		$("div.charge_box1 > span:first-child").text(roomPrice + " x " + totalDay + "박");
		
		var total = Number(roomPrice.replace(/[₩,원]/g, "") * totalDay);
		$("div.charge_box1 > span:last-child").text(total.toLocaleString() + "원");
		
		// 청소비
		var cleanPriceText = "15,000원";
		var cleanPrice = 15000;
		$("div.charge_box2 > span:last-child").text(cleanPriceText);
		
		// 서비스 수수료
		var serviceTaxText = "30,000원";
		var serviceTax = 30000;
		$("div.charge_box3 > span:last-child").text(serviceTaxText);
		
		// 숙박세와 수수료
		var outTaxText = "3,000원";
		var outTax = 3000;
		$("div.charge_box4 > span:last-child").text(outTaxText);
		
		// 총합계
		var totalPrice = Number(total + cleanPrice + serviceTax + outTax);
		$("div.total_charge > span:last-child").text(totalPrice.toLocaleString() + "원");
		
	}

}); //document.ready 끝


// 찜하기 눌렀을 때
let likeBtn = document.getElementsByClassName("like_btn");
let heartCount = 1;


for(let i = 0; i < likeBtn.length; i++){

  likeBtn[i].addEventListener('click', ()=>{

    heartCount++;

    if(heartCount % 2 == 0){
      likeBtn[i].src = "../images/red_heart.png";
    }else{
      likeBtn[i].src = "../images/heart.png";
    }
  });
}










  