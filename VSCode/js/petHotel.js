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


// 지역 검색 토글
let searchBox = document.getElementById('searchBox');
let searchPop = document.getElementById('searchPop');
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

function searchValueClick(){
  for(let i = 0; i < searchList.length; i++){
    searchList[i].addEventListener('click', () => {
      
      searchBox.value = searchList[i].innerText;
      searchPop.style.display = "none";
    });
  }
}

searchValueClick();

// 옵션 선택 토글
let optionBox = document.getElementById('optionBox');
let optionPop = document.getElementById('optionPop');

optionBox.addEventListener('click', () => {
  count ++;
  if(count % 2 == 0){
    optionPop.style.display = "block";
  }else{
    optionPop.style.display = "none";
  }

});

// option 선택
let option = document.querySelectorAll(".option_pop span");
let optionLength = 0;
const createDiv = document.createElement("div");
let options = [{id:0, value: "픽업"}, {id:0, value: "촬영"}, {id:0, value: "패키지"}, {id:0, value: "풀장"}];

function takeOptionLength(){
  
  for(let i = 0; i < option.length; i++){
    optionLength = option[i].innerText.length;
    
    option[i].style.width = (optionLength*25) + "px";
  }

}

takeOptionLength();

function choiceOption(){
  for(let i = 0; i < option.length; i++){
    option[i].addEventListener('click',function(){

      createDiv.innerHTML = `<span class="option_span">${options[i].value}</span>`;
    
    });
  }
  document.querySelector(".option_box").append(createDiv);
}

choiceOption();


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
// 제이쿼리 영역
$(document).ready(function(){
  // 인원검색 영역 클릭시
  $('.count_box').click(function(){
    $('.person_count_option').toggleClass('dis_block');
  });
  // 인원수|반려동물 검색 팝업 외부영역 클릭 시 팝업 딛기
  $(document).mouseup(function (e){
    var LayerPopup = $(".person_count_option");
    if(LayerPopup.has(e.target).length === 0){
      LayerPopup.removeClass("dis_block");
    }
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
  // 검색하기로 페이지 이동
  $('.reservation_btn').click(function(){
    location.href = '/petHotelList';
  });
});