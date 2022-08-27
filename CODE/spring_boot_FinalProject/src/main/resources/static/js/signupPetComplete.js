/********************************
 * 파일명 : signupPet.js
 * 용 도 : 펫등록 기능 구현
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	// 다운로드
	$("#petCard").click(function() {
		PrintDiv($("#petCard"));
	});
	
	// 이미지(png)로 다운로드
	function PrintDiv(div) {
		div = div[0];
		html2canvas(div).then(function(canvas){
			var myImage = canvas.toDataURL();
			downloadURI(myImage, "등록증.png"); 
		});
	}
	
	function downloadURI(uri, name){
		var link = document.createElement("a")
		link.download = name;
		link.href = uri;
		document.body.appendChild(link);
		link.click();
	}
		

   	// 홈 버튼 클릭
   	$(".btn_signup_done").click(function() {
   		location.href="/";
   	});
   	
   	
});//ready 끝

