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
      document.querySelector(".option_box").append(createDiv);
    
    });
  }
}

choiceOption();

