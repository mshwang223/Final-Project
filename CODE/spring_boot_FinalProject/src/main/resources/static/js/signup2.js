// signup.js

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

  

  $('.logo_box').click(function(){
    location.href = "index.html";
  });
  
  let address1 = "";
  // 주소입력
  $('.btn_zipcode').on('click', function(){
  	console.log("111");
    new daum.Postcode({
      oncomplete:function(data){
        address1 = "";
        
        // 도로명 주소인 경우
        if(data.userSelectedType == 'R'){
          address1 = data.roadAddress + "(" + data.bname + data.buildingName + ")";
        }else{
          // 지번인 경우
          address1 = data.jibunAddress;
        }
        
        // 입력란에 우편번호, 주소1 출력
        document.getElementById('zipCode').value = data.zonecode;
        document.getElementById('address1').value = address1;
        
        // 삭제 주소 입력하도록 이미 입력되어 있는 값 삭제하고 포커스
        let address2 = document.getElementById('address2');
        address2.value = "";
        address2.focus();
      }
    }).open();
  }); // click 끝


  // 전체동의 체크박스 체크시 전체 체크
  let checkedBox = false;
  $('#allCheck').click(function(){
    if($('#allCheck').is(':checked')){
      $('input[name = agree_subcheck1]').prop('checked', true);
      $('input[name = agree_subcheck2]').prop('checked', true);
      $('input[name = agree_subcheck3]').prop('checked', true);
      $('input[name = agree_subcheck4]').prop('checked', true);
    }else{
      $('input[name = agree_subcheck1]').prop('checked', false);
      $('input[name = agree_subcheck2]').prop('checked', false);
      $('input[name = agree_subcheck3]').prop('checked', false);
      $('input[name = agree_subcheck4]').prop('checked', false);
    }
  });

  // 전체 체크상태일 경우 : 전체동의 박스 체크
  // 하나라도 체크되지 않은 상태 경우 : 전체동의 박스체크 해제
  $('.agree_subcheck1, .agree_subcheck2, .agree_subcheck3, .agree_subcheck4').click(function(){
    if($('.agree_subcheck1').is(':checked')
    && $('.agree_subcheck2').is(':checked')
    && $('.agree_subcheck3').is(':checked')
    && $('.agree_subcheck4').is(':checked')){
      $('input[name=agree_all_check]').prop('checked', true);
    }else{
      $('input[name=agree_all_check]').prop('checked', false);
    }
  });
  // 회원가입 버튼 클릭
  let checkToPwd = false;
  let checkKoreaName = false; 
  let checkEmail = false; 
  let signupDone = false;

  $('.btn_signup_done').click(function(){
    // 비밀번호 유효성 검사
    let checkPwd =   /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;;
    let password1 = $('#signupPwd1').val();
    let password2 = $('#signupPwd2').val();

    if(checkPwd.test(password1) === false){
    }else{
      if(!(password1 == password2)){
        alert("비밀번호가 일치하지 않습니다");
        checkToPwd = false;
      }else{
        checkToPwd = true;
      }
    }
    // 한글 이름 유효성 검사
    let nameRule=/^[가-힣]+$/;
    let name=$('#signupName').val();

    if(!(nameRule.test(name))){
      checkKoreaName=false;
    } else{
      checkKoreaName=true;// 회원가입 버튼 실행 시 확인 4
    }

    // 이메일 형식 유효성 검사
    let emailRule=/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    let emailVal=$('#signupEmail').val();
    
    if(emailRule.test(emailVal)){
      checkEmail=true;
    } else{
      checkEmail=false;
    }
    
    // 이용약관 동의 여부 검사
    if($('#allCheck').is(':checked')){
      checkedBox = true;
    }else if($('.agree_subcheck1').is(':checked') && $('.agree_subcheck2').is(':checked')){
      checkedBox = true;
    }else if(!($('.agree_subcheck1').is(':checked') && $('.agree_subcheck2').is(':checked'))){
      checkBox = false;
    }else if(!($('.agree_subcheck2').is(':checked') && $('.agree_subcheck1').is(':checked'))){
      checkBox = false;
    }else if(($('.agree_subcheck3, .agree_subcheck4').is(':checked'))){
      checkedBox = false;
    }else{
      checkedBox = false;
    }
    
    // 회원정보 검사
    if(checkId&&checkToPwd&&checkKoreaName&&checkEmail&&phoneNumCheck&&checkedBox&&address1){
      alert("펫밀리가 떴다에 오신걸 환영합니다!");
      signupDone = true;
      location.href = "index.html"
    }else{
      if(!checkId){
        alert("아이디 중복을 확인해주세요.");
      }else if(!checkToPwd){
        alert("비밀번호는 특수문자를 포함한 8~12자리로 입력해주세요.");
      }else if(!checkKoreaName){
        alert("이름을 확인해주세요");
      }else if(!phoneNumCheck){
        alert("휴대폰 번호를 확인해주세요");
      }else if(!address1){
        alert("주소를 입력해주세요");
      }else if(!checkEmail){
        alert("이메일 형식을 확인해주세요");
      }else if(!checkedBox){
        alert("약관에 동의해주세요");
      }
    }
  });
});//ready 끝

