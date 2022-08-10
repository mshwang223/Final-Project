

$(document).ready(function(){
	var interval = setInterval(mainSlide,8000);
	
	var movedIndex = 0;
	
	// 각 컨트롤 버튼에 대해 처리
	$('.slide_bar').each(function(index) {
		$(this).hover(
			function() {
				$(this).css('background-color', 'black');
			},
			function() {
				$(this).css('background-color', '#ddd');
			}
		);
		
		// 클릭했을 때 인덱스값을 moveSlide() 함수에게 전달
		$(this).on('click', function() {
			$("#slideBox").finish();
			clearInterval(interval);
			moveSlide(index);	
		});

	});
	


	function mainSlide(){
	  $("#slideBox").animate({"margin-left" : "-1580px"}, 1000, function(){
	    $("#slideBox").css({"margin-left" : "-8px"});
	    $(".promotion_area:first-child").insertAfter(".promotion_area:last-child");
	    
	    //밑에 동그라미도 같이 적용, 동그라미 클릭 이동
	  });
	};

	// 슬라이드 패널을 움직이는 함수
	function moveSlide(index) {
		// 전달 받은 index 값을 movedIndex에 저장
		movedIndex = index;
		
		// 슬라이드 이동
		var moveLeft = -(index * 1580);		// 왼쪽으로 이동 거리
		$('#slideBox').animate({'left':moveLeft}, 'slow');
	}
});	// document.ready
