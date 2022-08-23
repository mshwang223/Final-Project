$(document).ready(function(){
	// + 새 투숙객 추가하기 클릭시
	$('#newCustomer').click(function(){
		$('.box_cus_info2').slideToggle('500', function(){
			$('#plusBtn').toggleClass('fa-plus');
			$('#plusBtn').toggleClass('fa-minus');
		});
	});
	// 가격보상제도 클릭시
	$('#insurancePrice').click(function(){
		$('.info_insurance').slideToggle('500');
	});

});


