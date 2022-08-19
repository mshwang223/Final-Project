/**
 * promotion.js
 */
 $(document).ready(function(){
  // 탑버튼
 $('.top_btn').click(function (event) {
   event.preventDefault();
   $('html, body').animate({ scrollTop: 0 }, 300);
 });
});