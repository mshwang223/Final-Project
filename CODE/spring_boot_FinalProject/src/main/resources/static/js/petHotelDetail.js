$(document).ready(function(){	
  // Daterangepicker
	var now = new Date();
	var today = (now.getMonth()+1) + "/" + now.getDate() + "/" + now.getFullYear();
	
	if($('#chk1').val() == '1') {
		$(function(){
			$(".stay_date").daterangepicker({
				locale: {
			  	daysOfweek: ['일','월','화','수','목','금','토'],
			  	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
				},
			    
				autoUpdateInput: false,
				autoApply: true,
				minDate: new Date($('#startDate').val()),
  				maxDate: new Date($('#endDate').val())
			});						
		});
	} else {
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
	}

	$('.stay_date').on('apply.daterangepicker', function(ev,picker){
		$('#rangepicker1').val(picker.startDate.format('MM.DD(dd)'));
		$('#rangepicker2').val(picker.endDate.format('MM.DD(dd)'));
		$('#rangepicker').val("2022." + picker.startDate.format('MM.DD(dd)') + ' ~ ' +"2022." + picker.endDate.format('MM.DD(dd)'));
		calculate();
	});

  // 인원검색 영역 클릭시
  $('.info_content_count').click(function(){
		$('.person_count_option').toggleClass('dis_block'); 
	}); 

	// 인원 버튼 클릭할 때
let personCount = parseInt($('#personCount').text());
let petCount = parseInt($('#petCount').text());
let maxManCnt = $('#maxManCnt');   // 최대 인원수
let maxPetCnt = $('#maxPetCnt'); 	// 최대 반려동물 수
  
  // 성인 + 버튼 클릭
  $('#personPlusBtn').click(function() {
    personCount++;
    // 1명부터 -버튼 활성화
    if(personCount > 0){
      $('#personMinusBtn').addClass('btn_count_active'); 
      
       if(maxManCnt.val() <= personCount){
		$('#personPlusBtn').removeClass('btn_count_active');
		personCount = maxManCnt.val();
 	  }
 	  	
    }
    $('#personCount').text(personCount);
    $('#infoCount').attr('value', '성인'+personCount+', 반려동물'+petCount);
  });

	// 성인 - 버튼 클릭
	$('#personMinusBtn').click(function(){
		personCount--;
		
		if(maxManCnt.val() >= personCount){
			$('#personPlusBtn').addClass('btn_count_active');
		}
		
		// 인원이 0이 되면 비활성
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
			
			if(maxPetCnt.val() <= petCount){
				$('#petPlusBtn').removeClass('btn_count_active');
				petCount = maxPetCnt.val();
		 	  }
		}
		$('#petCount').text(petCount);
		$('#infoCount').attr('value', '성인'+personCount+', 반려동물'+petCount);
	});
	
	// 반영
	$('#infoCount').on('change', function() {
		$("#count").val($(this).val());
	});

	// 반려동물 - 버튼 클릭
	$('#petMinusBtn').click(function(){
		petCount--;
		
		if(maxPetCnt.val() >= petCount){
			$('#petPlusBtn').addClass('btn_count_active');
		}
		
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
		//var stay_no = $('.sticky_area').children('input[type=hidden]').val();
		//window.location.href = "/petHotelRsv/stayNo=" + stay_no + "&period=" + $("#rangepicker").val();
		if($('.stay_date').val() == ""){
			alert("날짜를 입력해 주세요");
			return false;
		}else if($('.info_content_count').val() == ""){
			alert("인원수와 반려동물 수를 선택해주세요");
			return false;		
		}else{
			$("#rsvForm").submit();
		}
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

	// 전역값 설정
	var total = 0;			// 숙박비
	var totalPrice = 0;		// 총합계
	var chkDiscnt = "N";
	var discountPrice = 0;	// 할인가
		
	// 선택 버튼 클릭 시 계산
	$("#roomPrice").text($("div.room_box > div").eq(0).text().replace("₩", ""));
	$("#roomType").val($("div.room_box > span").eq(0).text().replace("#", ""));
	$("#rPrice").val($("#roomPrice").text().replace(/[,원]/g, ""));
	calculate();
	$(".room_btn").click(function() {
		var txtPrice = $(this).parent().children('div').text();
		var price = txtPrice.replace(/[₩]/g, "");	// 정규식
		$("#roomPrice").text(price);
		
		var roomName = $(this).parent().children('span').text();
		var roomType = roomName.replace("# ", "");
		$("#roomType").val(roomType);
		
		$("#rPrice").val($("#roomPrice").text().replace(/[,원]/g, ""));
		
		calculate();
	});
	
	// 일자 계산
	function getDiffDate(d1, d2) {
		const date1 = new Date(d1);
		const date2 = new Date(d2);
		
		const diffDate = date1.getTime() - date2.getTime();
		
		return Math.abs(diffDate / (1000 * 60 * 60 * 24));	/* 밀리세컨 * 초 * 분 * 시 = 일 */
	}
	
	function calculate() {
		var txtStartDate = $("#rangepicker1").val();
		var textEndDate = $("#rangepicker2").val();
		
		const year = new Date().getFullYear();
		
		// 시작일자
		var startYear = year;
		var startMonth = Number(txtStartDate.substr(0, 5).split(".")[0]);
		var startDate = startYear + "-" + txtStartDate.substr(0, 5).replace(".", "-");
				
		// 종료일자
		var endYear = year;
		var endMonth = Number(textEndDate.substr(0, 5).split(".")[0]);
		
		// 연도가 넘어갈 때
		if(startMonth > endMonth) endYear += 1;
		var endDate = endYear + "-" + textEndDate.substr(0, 5).replace(".", "-");
		
		var totalDay = getDiffDate(startDate, endDate);
		
		// 1번째
		var roomPrice = $("#roomPrice").text();
		$("div.charge_box1 > span:first-child").text(roomPrice + " x " + totalDay + "박");
		$("#diffDay").val(totalDay);
		
		total = Number(roomPrice.replace(/[₩,원]/g, "") * totalDay);
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
		
		// 할인가격 계산
		if(chkDiscnt === "Y") {
			discountPrice = Number(total * 30 / 100);
			$("div.disCount_total > span:last-child").text(discountPrice.toLocaleString() + "원");
			$("#discount").val(discountPrice);
		} else {
			discountPrice = 0;
		}
		
		
		// 총합계
		totalPrice = Number(total + cleanPrice + serviceTax + outTax - discountPrice);
		$("div.total_charge > span:last-child").text(totalPrice.toLocaleString() + "원");
		$("#total").val(totalPrice);
		
	}
	
	// 할인 토글
	$("#dicntClick").on('click', function() {
		$(".dicnt-dropBox").slideToggle();	
	});
	
	// 이미지 클릭 시 업로드
 	$(".add_img_file").click(function () {
	    $("#uploadFile").trigger('click');
	});
 
 	$("#uploadFile").on('change', function() {
 		setImageFromFile(this, '#profile_img_preview');
 		$(".btnUpload_box > button").css('visibility', 'visible');
 		$("#profile_img_preview").css('opacity', '0.5');
 	});
	
	// 이미지 미리보기
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(expression).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	        reader = null;
	    }
	}
	
	// 이미지 취소 버튼 기능
	$(".btnUpload_box > #cancel").click(function() {
		$("#profile_img_preview").prop('src', '/images/bgpetCard.png');
		$("#profile_img_preview").css('opacity', '1');
		$(".uploadImg-box > i").css('display', 'block');
		$(".uploadImg-box > i").css('bottom', '80px');
		$(".uploadImg-box > div").css('display', 'block');
		
		$(".btn_signup_done").css('display', 'none');
		
		$("#uploadFile").val("");	// 초기화
		
		// 할인가격 계산
		chkDiscnt = "N";
		discountPrice = 0;
		$("div.disCount_total > span:last-child").text(discountPrice.toLocaleString() + "원");
		$("div.disCount_total").css('display', 'none');
		$("#discount").val(discountPrice);
		calculate();
	});
	
	// 이미지 확인 버튼 기능
	$(".btnUpload_box > #confirm").click(function() {
 		// 유효성 체크
 		if($("#uploadFile").val() == "") {
 			alert("먼저 등록증을 업로드 해주세요.");
 			return false;
 		}	
	
		chkUpload = 1;
		$("#profile_img_preview").css('opacity', '1');
		$(".uploadImg-box > i").css('display', 'none');
		$(".uploadImg-box > div").css('display', 'none');
		
		$(".btn_signup_done").css('display', 'block');
	});
	
	// 펫 로그인(OCR)
   	let chkUpload = 0;
   	$("#petForm").on('submit', function(){
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		// 유효성 체크
 		if($("#uploadFile").val() == "") {
 			alert("먼저 등록증을 업로드 해주세요.");
 			return false;
 		}
 		
 		if(chkUpload == 0) {
 			alert("업로드 이미지 확인 버튼을 클릭해 주세요.");
 			return false;
 		}
 		
 		var formData = new FormData($("#petForm")[0]);
 		
 		$.ajax({
 			type:"post",
 			enctype: 'multipart/form-data',
 			url:"/petLoginOCR",
 			data: formData,
			contentType : false,
        	processData : false,
			success:function(result){
				// 성공 시 결과 받음
				
				if(result == "SUCCESS"){
					alert("적용되었습니다.");
					$("#petForm").css('display', 'none');
					$(".disCount_total").css('display', 'flex');
					
					// 할인가격 계산
					chkDiscnt = "Y";
					discountPrice = Number(total * 30 / 100);
					$("div.disCount_total > span:last-child").text(discountPrice.toLocaleString() + "원");
					$("#discount").val(discountPrice);
					calculate();
				} else {
					alert("적용되지 않는 할인 카드입니다.");
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		});  	
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










  