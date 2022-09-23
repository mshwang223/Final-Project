// 지역 검색 토글
let searchBox = document.getElementById('searchBox');
let searchPop = document.getElementById('searchPop');
let areaCode = document.getElementById('areaCode');
let count = 1;
let searchList = document.querySelectorAll('#searchList li');

searchBox.addEventListener('click', () => {
  count ++;
  if(count % 2 == 0){
    searchPop.style.display = "block";
  }else{
    0
    searchPop.style.display = "none";
  }

});

//검색 value
function searchValueClick(){
  for(let i = 0; i < searchList.length; i++){
    searchList[i].addEventListener('click', () => {
      areaCode.value = searchList[i].value;
      searchBox.value = searchList[i].innerText;
      searchPop.style.display = "none";
    });
  }
}

searchValueClick();




// option 넓이
/*let option = document.querySelectorAll(".option_pop span");
let optionLength = 0;

function takeOptionLength(){
  
  for(let i = 0; i < option.length; i++){
    optionLength = option[i].innerText.length;
    
    option[i].style.width = (optionLength*30) + "px";
  }

}

takeOptionLength();*/


// 제이쿼리 영역
$(document).ready(function(){

// 찜하기 눌렀을 때
	let likeBtn = document.getElementsByClassName("like_btn");
	let arrHeart = [likeBtn.length];
	
	for(let i = 0; i < likeBtn.length; i++){
		arrHeart[i] = 1;
	  likeBtn[i].addEventListener('click', (e)=>{
	  
		arrHeart[i]++;
		let id = likeBtn[i].dataset.id;
		let flag = likeBtn[i].dataset.flag;
		let img = likeBtn[i].dataset.img;

	
	    if(arrHeart[i] % 2 == 0){
	      likeBtn[i].src = "/images/red_heart.png";
	    }else{
	      likeBtn[i].src = "/images/heart.png";
	    }
	    
	    e.stopPropagation();
	    
	    likeAjax(id, flag, img);
	    
	  });
	  
	}

  function likeAjax(id, flag, img){
  		
	      $.ajax({
	          type:"post",
	          url:"/likeHotel",
	          data: {'id': id,
	          		 'flag': flag,
	          		 'img': img
	          		 },
	          success:function(result){
	          	if(result == "00") {
					$.ajax({
						type:"post",
		   				url:"/delete_regId",
		   				data:{"regId": id},
		   				success:function(result) {

		   				}
					});
				} else if(result == "01") {
					$.ajax({
						type:"post",
		   				url:"/delete_stayNo",
		   				data:{"stayNo": id},
		   				success:function(result) {

		   				}
					});
				} else if(result == "10") {
					$.ajax({
						type:"post",
		   				url:"/delete_regId",
		   				data:{"regId": id},
		   				success:function(result) {

		   				}
					});
				} else if(result == "11") {
					$.ajax({
						type:"post",
		   				url:"/delete_stayNo",
		   				data:{"stayNo": id},
		   				success:function(result) {

		   				}
					});
				} else {

				}
	         },
	         error:function(){
	            // 오류있을 경우 수행 되는 함수
	            alert("전송 실패");
	         }
	       }); 
   }
   
// 찜 유지
let likeReg = $('#likeReg').val();

console.log(likeReg);

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
$('.stay_date').val(picker.startDate.format('YYYY.MM.DD(dd)') + ' ~ ' + picker.endDate.format('YYYY.MM.DD(dd)') +', ' +Math.floor((picker.endDate - picker.startDate)/86400000)+'박');

});

  // 인원검색 영역 클릭시
  $('.count_box').click(function(){
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
	
	// 인원수|반려동물 검색 팝업 외부영역 클릭 시 팝업 딛기
  $(document).mouseup(function (e){
    var LayerPopup = $(".person_count_option");
    if(LayerPopup.has(e.target).length === 0){
      LayerPopup.removeClass("dis_block");
    }
  });
  
  	// 지역검색 팝업 닫기
  $(document).mouseup(function (e){
    var LayerPopup = $(".search_pop");
    if(LayerPopup.has(e.target).length === 0){
      LayerPopup.css("display","none");
    }
  });
  
  	// 옵션 팝업닫기
  /*$(document).mouseup(function (e){
    var LayerPopup = $(".option_pop");
    if(LayerPopup.has(e.target).length === 0){
      LayerPopup.removeClass("dis_block");
    }
  });*/
	
  // 검색하기로 페이지 이동(유효성 검사)
  $('#reservationBtn').click(function(){
  	if($('#searchBox').val() == '목적지를 검색하세요'){
  		alert('목적지를 입력해 주세요');
  		return false;
  	}else if($('#rangepicker').val() == '날짜를 입력해주세요'){
  		alert('유효한 날짜를 입력해주세요');
  		return false;
  	}else if($('#btnCount').val() == ''){
  		alert('인원수를 입력해주세요');
  	}else{
  		$("#userFrm").submit();
  	} 
  });
  
	
	//option 추가
  /*var option_cnt = 0;
   $('.option_span').not('.option_close').click(function(){
      if($('.option_box').find('#'+$(this).attr('id')).length == 0){
         option_cnt++;
         var clone = $(this).clone().append('<img src="/images/close.png" class="option_close choice" id="option_close'+option_cnt+'">');
         $(clone).attr('class', 'added_option choice');
         //$(clone).attr('id', 'added_option'+option_cnt+'');
         $('.option_box').append(clone);
         $('.option_pop').removeClass("dis_block");
      }
   });
   

   $('.option_box').click(function(e){
      if(!$(e.target).hasClass('choice')){
         $('.option_pop').toggleClass('dis_block');
      }
   });*/
	

	// 슬라이드 10개	
	// 특가숙소 슬라이드
	var specialBox = $('.special_img_box').length;
    var specialIndex = 0;

    $('.special_next').click(function(){
        $('.special_img_box:nth-child(1)').animate({marginLeft:  '-=320px' }, '500');
        $('.special_prev').css("display","block");
        specialIndex++;
        if(specialIndex == (specialBox - 5))
            $('.special_next').css("display","none");
    });

    $('.special_prev').click(function(){
        $('.special_img_box:nth-child(1)').animate({marginLeft:  '+=320px' }, '500');
        $('.special_next').css("display","block");
        specialIndex--;
        if(specialIndex == 0)
            $('.special_prev').css("display","none");
    });
	
	// 인기숙소 슬라이드
	var popularBox = $('.popular_img_box').length;
    var popularIndex = 0;

    $('.popular_next').click(function(){
        $('#popularContainer form:nth-child(1)').animate({marginLeft:  '-=320px' }, '500');
        $('.popular_prev').css("display","block");
        popularIndex++;
        if(popularIndex == (popularBox - 5))
            $('.popular_next').css("display","none");
    });
    
            if(specialBox > 5)
        	$('.special_next').css("display","block");

    $('.popular_prev').click(function(){
        $('#popularContainer  form:nth-child(1)').animate({marginLeft:  '+=320px' }, '500');
        $('.popular_next').css("display","block");
        popularIndex--;
        if(popularIndex == 0)
            $('.popular_prev').css("display","none");
    });
	
	 // 서울숙소 슬라이드
	var seoulBox = $('.seoul_img_box').length;
    var seoulIndex = 0;

    $('.seoul_next').click(function(){
        $('#seoulContainer form:nth-child(1)').animate({marginLeft:  '-=320px' }, '700');
        $('.seoul_prev').css("display","block");
        seoulIndex++;
        if(seoulIndex == (seoulBox - 5))
            $('.seoul_next').css("display","none");
    });

    $('.seoul_prev').click(function(){
        $('#seoulContainer form:nth-child(1)').animate({marginLeft:  '+=320px' }, '700');
        $('.seoul_next').css("display","block");
        seoulIndex--;
        if(seoulIndex == 0)
            $('.seoul_prev').css("display","none");
    }); 
    
    // 부산숙소 슬라이드
	var busanBox = $('.busan_img_box').length;
    var busanIndex = 0;

    $('.busan_next').click(function(){
        $('#busanContainer form:nth-child(1)').animate({marginLeft:  '-=320px' }, '700');
        $('.busan_prev').css("display","block");
        busanIndex++;
        if(busanIndex == (busanBox - 5))
            $('.busan_next').css("display","none");
    });

    $('.busan_prev').click(function(){
        $('#busanContainer form:nth-child(1)').animate({marginLeft:  '+=320px' }, '700');
        $('.busan_next').css("display","block");
        busanIndex--;
        if(busanIndex == 0)
            $('.busan_prev').css("display","none");
    });

}); //document.ready 끝







