setInterval(mainSlide,4000);

function mainSlide(){
  $("#slideBox").animate({"margin-left" : "-1580px"}, 1500, function(){
    $("#slideBox").css({"margin-left" : "-8px"});
    $(".promotion_area:first-child").insertAfter(".promotion_area:last-child");
    //button에 mouseover되면 멈추게
    $(".slide_btn").mouseover(function(){
      $(this).stop();
    });
    //밑에 동그라미도 같이 적용, 동그라미 클릭 이동
  });
};
