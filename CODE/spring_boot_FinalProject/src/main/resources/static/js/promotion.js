/**
 * promotion.js
 */
 $(document).ready(function(){
  
  // 상세보기 버튼1 슬라이드 토글
  $('#btnView1').click(function(){
    $('#showDetail1').slideToggle('500');
  });
  // 상세보기 버튼2 슬라이드 토글
  $('#btnView2').click(function(){
    $('#showDetail2').slideToggle('500');
  });
    
  // 탑버튼
 $('.top_btn').click(function (event) {
   event.preventDefault();
   $('html, body').animate({ scrollTop: 0 }, 300);
 });
});