/********************************
 * 파일명 : index.js
 * 용 도 : 메인 페이지 slide show 이벤트 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	var interval = setInterval(mainSlide, 5000);
	
	// 각 컨트롤 버튼에 대해 처리
	$('.slide_bar').each(function(index) {
		// 클릭했을 때 인덱스값을 moveSlide() 함수에게 전달
		$(this).on('click', function() {
			clearInterval(interval);
			
			moveSlide(chkIdx, index);
			
			$(this).css('background-color', 'black');
			
			$('.slide_bar_box').find('span').not(this).css('background-color', '#ddd');
			
			interval = setInterval(mainSlide, 5000);

		});
	});

	// 전역 변수 초기값, 애니메이션 실행 시 해당 위치 표시
	var index = 0;
	var chkIdx = 0;
	var maxLength = $(".promotion_area").length;
	$(".slide_bar_box .slide_bar").eq(index).css('background-color', 'black');	
	function mainSlide(){
		$("#slideBox").animate({"margin-left" : "-1580px"}, 'slow', function(){
	    	$("#slideBox").css({"margin-left" : "-8px"});
	    	$(".promotion_area:first-child").insertAfter(".promotion_area:last-child");
	    	
	    	// 해당 하위 태그에 색상으로 표시하고 증가 
	    	$(".slide_bar_box .slide_bar").eq(index).css('background-color', '#ddd');
	    	index++;
	    	
		    if(index == maxLength) {
		    	index = 0;
		    	var slideEqIdx = $(".slide_bar_box .slide_bar").eq(index);
		    	
		    	slideEqIdx.css('background-color', 'black');
		    	$('.slide_bar_box').find('span').not(slideEqIdx).css('background-color', '#ddd');
		    } else {
		    	var slideEqIdx = $(".slide_bar_box .slide_bar").eq(index);
		    	
		    	slideEqIdx.css('background-color', 'black');
		    	$('.slide_bar_box').find('span').not(slideEqIdx).css('background-color', '#ddd');	
		    }
		    
		    // index값 전역변수로 적용 마우스 클릭 시 해당 값 비교
		    chkIdx = index;
	    });
	  	
	};

	// 슬라이드 패널을 움직이는 함수
	function moveSlide(chkIdx, index) {
		var maxLeft = maxLength * 1580;
		// 슬라이드 이동
		if(chkIdx > index) {
			index = chkIdx - index;
			var moveLeft = -(maxLeft - (index * 1580));	
			$('#slideBox').animate({'margin-left':moveLeft}, 'slow');
		} else if(chkIdx < index) {
			index = index - chkIdx;
			var moveLeft = -(index * 1580);
			$('#slideBox').animate({'margin-left':moveLeft}, 'slow');
		} else {
			var moveLeft = -(maxLeft - (1580 * maxLength));	
			$('#slideBox').animate({'margin-left':moveLeft}, 'slow');	
		}
	}
	
	// 클릭 시 회원가입 페이지 이동
	$(".login_box span:nth-child(2)").on('click', function() {
		location.href = "/signup";
	});


	// 자세히보기 버튼 이동
	$('#partyBtn').click(function(){
		$('html,body').animate({scrollTop : 1040},300);
	});

	$('#photoBtn').click(function(){
		$('html,body').animate({scrollTop : 2450},300);
	});

	$('#itemBtn').click(function(){
		$('html,body').animate({scrollTop : 3150},300);
	});

	$('#playBtn').click(function(){
		$('html,body').animate({scrollTop : 4100},300);
	});

	// 탑버튼
	$('.top_btn').click(function (event) {
		event.preventDefault();
		$('html, body').animate({ scrollTop: 0 }, 300);
	});

});	// document.ready

/*const login_btn = document.querySelector(".loginForm");
const dropdown_login_box = document.querySelector("#dropdown-login");

handleClickLoginBtn = () => {
  dropdown_login_box.classList.toggle("show");
}

window.onclick = function (event) {
  const cond1 = String(event.path[1].id) === 'dropdown-login';
  const cond2 = String(event.path[1].id) === 'login-form';
  const clickedInsideLoginForm = cond1 || cond2;
  if (clickedInsideLoginForm) {
    return;
  }
  if (!event.target.matches('.loginForm')) {
    if (dropdown_login_box.classList.contains('show')) {
      dropdown_login_box.classList.remove('show');
    }
  }
}

login_btn.addEventListener("click", handleClickLoginBtn); */


