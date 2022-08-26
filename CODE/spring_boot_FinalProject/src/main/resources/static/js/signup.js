// signup.js

$(document).ready(function(){

  // 아이디 중복체크(백에서 ajax사용)
  let checkId = true;
  /*
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
  */
  
  // 전체동의 체크박스 체크시 전체 체크
	$('#allCheck').click(function() {
		if($(this).is(':checked')){	// 체크되었을 때
			$('.agree_subcheck').prop('checked', true);
		} else {
			$('.agree_subcheck').prop('checked', false);
		}
	});

  // 전체 체크상태일 경우 : 전체동의 박스 체크
  // 하나라도 체크되지 않은 상태 경우 : 전체동의 박스체크 해제
  $('.agree_subcheck').click(function(){
    if($('.agree_subcheck:checked').length == 4)
      $('input[name=agree_all_check]').prop('checked', true);
    else
      $('input[name=agree_all_check]').prop('checked', false);
  });
  
  // 회원가입 버튼 클릭
  let checkToPwd = false;
  let checkKoreaName = false; 
  let checkEmail = false; 
  let signupDone = false;
  
  function chkSubmit(){
    // 약관 확인
    let checkedBox = $(".essential:checked").length;
  
    // 비밀번호 유효성 검사
    let checkPwd =   /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;;
    let password1 = $('#signupPwd1').val();
    let password2 = $('#signupPwd2').val();
	let result = true;

    if(checkPwd.test(password1) === false){
    }else{
      if(!(password1 == password2)){
        alert("비밀번호가 일치하지 않습니다");
        result = false;
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
    
    // 회원정보 검사
    if(checkId&&checkToPwd&&checkKoreaName&&checkEmail&&checkedBox){
    	alert("펫밀리가 떴다에 오신걸 환영합니다!");
    	signupDone = true;
    } else {
    	if(!checkId) {
        	alert("아이디 중복을 확인해주세요.");
        	result = false;
	    } else if(!checkToPwd){
	    	alert("비밀번호는 특수문자를 포함한 8~12자리로 입력해주세요.");
	    	result = false;
	    } else if(!checkKoreaName) {
	    	alert("이름을 확인해주세요");
	    	result = false;
	    } else if(!checkEmail) {
	        alert("이메일 형식을 확인해주세요");
	        result = false;
	    } else if(checkedBox < 3) {
	        alert("약관에 동의해주세요");
	        console.log(checkedBox);
	        result = false;
	    }
    }
    
    return result;
  }
  
  	// 회원 가입
	$("#signup").on('submit', function(){
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		// 유효성 체크
 		if(!chkSubmit())
 			return false;
 		
 		$.ajax({
 			type:"post",
 			url:"/join",
 			data:{
 				"userId": $('#signupId').val(),
 				"userPw": $('#signupPwd1').val(),
 				"userName": $('#signupName').val(),
 				"userEmail": $('#signupEmail').val()
 			},
			dataType:"text",
			success:function(result){
				if(result == "SUCCESS"){
					alert("가입되었습니다.");
					location.href="/";
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("회원가입 실패");
			}
 		});
	});  
});//ready 끝

