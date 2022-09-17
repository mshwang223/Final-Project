/**
 * 
 */
 
 $(document).ready(function(){
 
	
	 
	$('#chatForm').on('submit',function(){
		 event.preventDefault();

		
		 if($('#message').val() == ""){
          alert("질문을 입력해주세요");
          $('#message').val("");
          $('#message').focus();
          return false;
       }
       
       // chatBox에 보낸 메세지 추가
       $('#chattingBox').append('<div class="msgBox send"><span id="in"><span>'+$('#message').val()+'</span></span></div><br>');
       
       		chatbotMsg();
       		$('#message').val('');
	}); // submit 끝


	function chatbotMsg(){
		
		var msg = $('#message').val();

		$.ajax({
			type: "post",
			url: "petmilyChatbot",
			data: {"message": msg},
			dataType: "text",
			success: function(result){
				
				$('#chattingBox').append('<div id="resultBox"><span id="in"><span><img src="/images/챗봇강아지.png"></span><br><span class="result">'+result+'</span></span></div><br>');
	            $('#chattingBox').scrollTop($('#chattingBox')[0].scrollHeight);
	             
	         
	           $('#message').val("");
	           $('#message').focus();
				
			},
			error: function(){
				alert("전송 실패");
			}
		}); //ajax 끝
	}
}); 





 