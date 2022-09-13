
$(document).ready(function(){

	// 취소
   	$('#approve_cancle').click(function() {
   		$('#cancleForm').submit();
   	});  
   	
   	// 이미지 슬라이드
   	var fileBox = $('.file_img_box').length;
    var fileIndex = 0;
    var slice = Math.ceil(fileBox / 2);

    $('.file_next').click(function(){
        $('.file_img_box:nth-child(1)').animate({marginLeft:  '-=370px' }, '500');
        $('.file_prev').css("display","block");
        fileIndex++;
        if(fileIndex == (fileBox - Math.ceil(fileBox / slice)))
            $('.file_next').css("display","none");
    });

    $('.file_prev').click(function(){
        $('.file_img_box:nth-child(1)').animate({marginLeft:  '+=370px' }, '500');
        $('.file_next').css("display","block");
        fileIndex--;
        if(fileIndex == 0)
            $('.file_prev').css("display","none");
    });
   	
});  