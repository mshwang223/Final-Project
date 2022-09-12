/********************************
 * 파일명 : signupPetComplete.js
 * 용 도 : 펫등록증 구현
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	// 다운로드
	$("#petCard").click(function() {
		PrintDiv($("#petCard"));
		$("#uploadFile").val(myImage);
	});
	
	// 이미지(png)로 다운로드
	function PrintDiv(div) {
		div = div[0];
		
		html2canvas(div).then(function(canvas){
			var myImage = canvas.toDataURL("image/png");
			downloadURI(myImage, "등록증.png");
			
			// 파일화
			var blobBin = atob(myImage.split(',')[1]);	// base64 데이터 디코딩
			var array = [];
			
			for (var i = 0; i < blobBin.length; i++) {
		        array.push(blobBin.charCodeAt(i));
		    }
		    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
		    
		    var formdata = new FormData();	// formData 생성
		    formdata.append("file", file);	// file data 추가
			
			
			// 서버에 업로드
			$.ajax({
		 		type:"post",
		 		url:"/fileUpload",
		 		data: formdata,
				processData : false,	// data 파라미터 강제 string 변환 방지!!
        		contentType : false,	// application/x-www-form-urlencoded; 방지!!
				success:function(result){
					
				},
				error:function(){
					// 오류있을 경우 수행 되는 함수
					alert("전송 실패");
				}
		 	});			 
		});
	}
	
	function downloadURI(uri, name){
		var link = document.createElement("a")
		link.download = name;
		link.href = uri;
		document.body.appendChild(link);
		link.click();
		document.body.removeChild(link);
	}

   	// 홈 버튼 클릭
   	$(".btn_signup_done").click(function() {
   		location.href="/";
   	});
   	
   	
});//ready 끝

