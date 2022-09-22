/**
 *
 */
$(document).ready(function () {
	$('#btnDelete').click(function(){
	
		// 기본 기능 중단
		event.preventDefault();
		
	
		if($("#deletePw1").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$('#deletePw1').focus();
			return false;
		}
		
		if($("#deletePw2").val() == ""){
			alert('비밀번호 확인을 입력해주세요.');
			$('#deletePw2').focus();
			return false;
		}
		
		if(!($("#deletePw1").val() == $("#deletePw2").val())){
			alert('비밀번호가 일치하지 않습니다.');
			$('#deletePw1').focus();
			
			return false;
		}
		
		$.ajax({
			url : "/pwCheck",
			type : "post",
			dataType : "json",
			data : $("#deleteForm").serializeArray(),
			success: function(data){
				
				if(data==0){
					alert("비밀번호를 확인해주세요.");
					return;
				}else{
					if(confirm("탈퇴하시겠습니까?")){
						$("#deleteForm").submit();
					}
					
				}
			}
		});

	});
	$('#btnCancel').click(function(){
		location.href = "/mypage";
	});

});