/********************************
 * 파일명 : adminUser.js
 * 용 도 : 관리자메뉴 사용자관리 메인화면 
 * 작성자 : 황재윤
*********************************/

$(document).ready(function(){
	
	// 사용자관리 드롭다운 확인
	$("#dropdown-box").on('click', function() {
		$(".dropdown-contents").slideToggle();
	});
	
	// 외부 클릭 시 드롭다운 박스 히든
	$(document).mouseup(function (e){
		var dropdownContainer = $(".dropdown-contents");
		var className = e.target.className;
		
		if(dropdownContainer.has(e.target).length === 0) {
			if(e.target.className != "dpBox-div") {
				dropdownContainer.hide();			
			}
		} else {
			if(e.target.className != "dpBox-div") {
				if(e.target.className == "dp-all") { 
					$("#dpBox-name").text("전체");
					$("#chk_search").val("0");
					dropdownContainer.hide();
				} else if(e.target.className == "dp-id") {
					$("#dpBox-name").text("ID");
					$("#chk_search").val("1");
					dropdownContainer.hide();
				} else if(e.target.className == "dp-name") {
					$("#dpBox-name").text("이름");
					$("#chk_search").val("2");
					dropdownContainer.hide();
				} else if(e.target.className == "dp-activeDate") {
					$("#dpBox-name").text("접속일");
					$("#chk_search").val("3");
					dropdownContainer.hide();
				}			
			}	
		}
   	});
   	
   	// 초기화
   	var flag = $("#flag").val();
   	$("div.active").eq(flag).addClass("aSelected");
   	
   	if($("#chk_search").val() == "" || $("#chk_search").val() == "0")
   		$("#dpBox-name").text("전체");
   	else if($("#chk_search").val() == "1")
   		$("#dpBox-name").text("ID");
   	else if($("#chk_search").val() == "2")
   		$("#dpBox-name").text("이름");
   	else $("#dpBox-name").text("접속일");
   	
   	// 페이지 번호 버튼 클릭했을 때
   	$(".active").click(function(e) {
   		var pageNum = parseInt($(this).attr('value') - 1);
   		var submitPath = "/adminUserSearch/" + pageNum;
   		
   		$("#userFrm").attr('action', submitPath);
   		$("#userFrm").submit();
	});
	
	// 첫 페이지 버튼 클릭했을 때
   	$(".firstPager > div").click(function() {
   		var pageNum = parseInt(0);
   		var submitPath = "/adminUserSearch/" + pageNum;
   		
   		$("#userFrm").attr('action', submitPath);
   		$("#userFrm").submit();   	
   	});

   	// 이전 버튼 클릭했을 때
   	$(".prevPager > div").click(function() {
   		var pageNum = parseInt(flag - 1);
   		var submitPath = "/adminUserSearch/" + pageNum;
   		
   		if(pageNum < 0) {
   			alert("첫 페이지 입니다.");
   			return false;
   		}
   		
   		$("#userFrm").attr('action', submitPath);
   		$("#userFrm").submit();   	
   	});
   	
   	// 다음 버튼 클릭했을 때
   	$(".nextPager > div").click(function() {
   		var pageNum = parseInt(flag + 1);
   		var submitPath = "/adminUserSearch/" + pageNum;
   		
   		if(pageNum >= $("#maxPage").val()) {
			alert("마지막 페이지입니다.");
			return false;
		}
   		
   		$("#userFrm").attr('action', submitPath);
   		$("#userFrm").submit();   	
   	});
   	
	// 첫 페이지 버튼 클릭했을 때
   	$(".lastPager > div").click(function() {
   		var pageNum = $("#maxPage").val() - 1;
   		var submitPath = "/adminUserSearch/" + pageNum;
   		
   		$("#userFrm").attr('action', submitPath);
   		$("#userFrm").submit();   	
   	});
});

	