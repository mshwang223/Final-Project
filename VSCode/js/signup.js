$(document).ready(function(){

  // 아이디 중복체크(백에서 ajax사용)
  let checkId = false;
  $('.btn_idcheck').click(function(){
    if($('.text_signup_id').val() == ""){
      alert("아이디를 입력하세요");
    }else if($('.text_signup_id').val() == "admin"){
      alert("이미 사용중인 아이디 입니다.");
      $('.text_signup_id').css('border', '1px solid #E65454');
    }else{
      alert("사용 가능한 아이디 입니다.");
      $('.text_signup_id').css('border', '1px solid #ee82ee');
      checkId = true;
    }
  });

  $('.signup_phone_check').hide();


});//ready 끝

