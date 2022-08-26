/**
 * promotion.js
 */
 $(document).ready(function(){
  // 상세보기 버튼 슬라이드 토글
  $('#btnView').click(function(){
  	$('#showDetail').slideToggle('500',function(){
		if($('#btnView').text() == '상세 보기'){
			$('#btnView').html('상세 닫기');
		}else{
			$('#btnView').html('상세 보기');
		}  
  	});
  });
  
  // 상세보기 버튼1 슬라이드 토글
  $('#btnView1').click(function(){
    $('#showDetail1').slideToggle('500',function(){
    	if($('#btnView1').text() == '상세 보기'){
    		$('#btnView1').html('상세 닫기');
    	}else{
    		$('#btnView1').html('상세 보기');
    	}
    });
  });
  // 상세보기 버튼2 슬라이드 토글
  $('#btnView2').click(function(){
    $('#showDetail2').slideToggle('500', function(){
    	if($('#btnView2').text() == '상세 보기'){
    		$('#btnView2').html('상세 닫기');
    	}else{
    		$('#btnView2').html('상세 보기');
    	}
    });
  });
    // 상세보기 버튼3 슬라이드 토글
  $('#btnView3').click(function(){
    $('#showDetail3').slideToggle('500', function(){
    	if($('#btnView3').text() == '상세 보기'){
    		$('#btnView3').html('상세 닫기');
    	}else{
    		$('#btnView3').html('상세 보기');
    	}
    });
  });
  // 객실요금 조회 버튼 이동
  $('.search_pro_room').click(function(){
  	location.href = '/petHotelList';
  });

});