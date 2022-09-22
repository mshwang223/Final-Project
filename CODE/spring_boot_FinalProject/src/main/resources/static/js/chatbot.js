/**
 * 
 */
 /**
 * 
 */
 
 $(document).ready(function(){
 	
 	$('#chatBot').click(function(){
 		chatbotMsg();
 	});
	
	 
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
			dataType: "json",
			success: function(result){
			
				var bubbles = result.bubbles;
				
				for(var b in bubbles){
					if(bubbles[b].type == 'text'){ // 기본답변
						$('#chattingBox').append
						('<div id="resultBox"><span id="in"><span><img src="/images/chatbot2.png"></span><br><span class="result">'
							+bubbles[b].data.description +'</span></span></div><br>');
					
					}else if(bubbles[b].type == 'template'){ // 이미지 또는 멀티링크 답변
						if(bubbles[b].data.cover.type == 'image'){ // 이미지 답변
							$('#chattingBox').append('<div id="resultBox"><span id="in"><span><img src="/images/chatbot2.png"></span><br><span class=""><img class="map" src = "' + bubbles[b].data.cover.data.imageUrl + '" alt="이미지 없음" width="300" height="200"></span></span></div><br>');
							if(bubbles[b].data.contentTable == null){
								$('#chattingBox').append
								("<a href='"+bubbles[b].data.cover.data.action.data.url+"' target='_blank'>" + 
								 bubbles[b].data.cover.data.action.data.url+ "</a><br><br>");
							}else{
								$('#chattingBox').append('<div id="resultBox"><span id="in"><span><img src="/images/chatbot2.png"></span><br><span class="result">'+ bubbles[b].data.cover.data.description +'</span></span></div><br>');
							}
						}else if(bubbles[b].data.cover.type == "text"){  // 멀티링크 답변
							$('#chattingBox').append('<div id="resultBox"><span id="in"><span><img src="/images/chatbot2.png"></span><br><span class="result">'+ bubbles[b].data.cover.data.description +'</span></span></div><br>');
						}
						
						for(var ct in bubbles[b].data.contentTable){
				           var ct_data = bubbles[ct].data.contentTable[ct];
				           for(var ct_d in ct_data){
				             $("#chattingBox").append
				             ("<a href='"+ct_data[ct_d].data.data.action.data.url+"' target='_blank' style='font-size: 14px; color: blue; margin-left: 5px;'>" + 
				               ct_data[ct_d].data.data.action.data.url+ "</a><br><br>");
				             }
				           }// contentTable for문 끝
					}
				}
				
				
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





 