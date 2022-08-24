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
	      $('html,section').animate({scrollTop : 3000},300);
	   });

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

// navermap 지도
/*var mapOptions = {
  center: new naver.maps.LatLng(37.3405761, 127.3164609),
  zoom: 17
};*/

var map = new naver.maps.Map('map',{
  center: new naver.maps.LatLng(37.3405761, 127.3164609),
  zoom: 17
});

var marker = new naver.maps.Marker({
  position: new naver.maps.LatLng(37.3405761, 127.3164609),
  map: map
});

//37.3595704, 127.105399
//37.3405761, 127.3164609
  
  