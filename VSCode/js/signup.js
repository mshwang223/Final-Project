$(document).ready(function(){

  // 아이디 중복체크(백에서 ajax사용)
  let checkId = false;
  $('.btn_idcheck').click(function(){
    if($('.text_signup_id').val() == ""){
      alert("아이디를 입력하세요");
    }else if($('.text_signup_id').val() == "admin"){
      alert("이미 사용중인 아이디 입니다.");
      $('.text_signup_id').css('border', '1px solid #E65454');
      $('.text_signup_id').click(function(){
        $('.text_signup_id').css('border', '1px solid #ee82ee');
      });
    }else{
      alert("사용 가능한 아이디 입니다.");
      checkId = true;
    }
  });

  // 휴대폰인증번호 확인란 숨기기
  $('.signup_phone_check').hide();

  // 휴대폰 인증
  // 인증하기 버튼 클릭시 인증번호 발송
  let num = null;
  // 휴대폰 번호 유효성 정규식
  let phoneNumStyle = /^01([0|1|6|7|8|9])([0-9]{4})([0-9]{4})$/;
  $('.confirm_phone').click(function(){
    if(!(phoneNumStyle.test($('.text_signup_phone').val()))){
      alert("휴대폰 번호를 확인해주세요");
      $('.text_signup_phone').css('border', 'solid 1px #E65454');
      $('.text_signup_phone').click(function(){
        $('.text_signup_phone').css('border', 'solid 1px #ee82ee');
      });
    }else{
      num=Math.round(Math.random()*899999)+100000;
      alert("인증번호 : " + num);
      $('.signup_phone_check').show();
    }
  });

  let phoneNumCheck = false;

  // 인증확인
  // 확인버튼 클릭시 일치 / 불일치 결과 출력
  $('.check_phone').click(function(){
    if($('.check_signup_phone').val() == num){
      alert("인증되었습니다.");
      phoneNumCheck = true;
      // 인증이 되면 다시 인증번호 확인칸 숨기기
      $('.signup_phone_check').hide();
      // 휴대폰 번호 입력칸 / 인증번호 버튼 비활성화시키키
      $('.text_signup_phone').attr('disabled', true);
      $('.text_signup_phone').css('background-color', '#f2f2f2');
      $('.confirm_phone').attr('disabled', true);
      $('.confirm_phone').text("인증완료");
      $('.confirm_phone').css('background-color', '#dddddd');
      $('.confirm_phone').css('cursor', 'auto');
    }else{
      alert("인증번호를 다시 확인해 주세요.");
      $('.check_signup_phone').css('border', 'solid 1px #E65454');
      $('.check_signup_phone').click(function(){
        $('.check_signup_phone').val('');
        $('/check_signup_phone').css('border', 'solid 1px #ee82ee');
      })
    }
  });


});//ready 끝

