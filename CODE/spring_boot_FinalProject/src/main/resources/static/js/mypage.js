// 프로필 사진 변경
$(document).ready(function () {
    $(document).on('change','#profile_input',function () {
        $("#imageForm").submit();
    });
    
    $('#unRegister').click(function(){
    	location.href='/unregisterForm';
    })
    
    // 찜 슬라이드
	var Box = $('.wanted_hotel').length;
    var Index = 0;
	var slice = Math.ceil(Box / 2);
	
	if(Box > 4){
		$('.next').css("display","block");
	}

    $('.next').click(function(){
        $('.wented_hotel_container div:nth-child(1)').animate({marginLeft:  '-=130px' }, '500');
        $('.prev').css("display","block");
        Index++;
        if(Index == (Box - Math.ceil(Box / slice)))
            $('.next').css("display","none");
    });

    $('.prev').click(function(){
        $('.wented_hotel_container div:nth-child(1)').animate({marginLeft:  '+=130px' }, '500');
        $('.next').css("display","block");
        Index--;
        if(Index == 0)
            $('.prev').css("display","none");
    });
    
   
     
});

function readURL(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
        document.getElementById('profile_img__preview').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('profile_img__preview').src = "";
    }
}



// let acc = document.getElementsByClassName("accordion");
let acc_arr = document.getElementsByClassName("accordion__arrow");
let i;

for (i = 0; i < acc_arr.length; i++) {
    acc_arr[i].addEventListener("click", function() {
        let acc = this.parentNode;
        acc.classList.toggle("active");
        let panel = acc.nextElementSibling;
        if (panel.style.display === "block") {
        panel.style.display = "none";
        } else {
        panel.style.display = "block";
        }
    });
}

function uploadprofile(){
	window.location.href='/updateprofile';
}

function signupPet(){
	window.location.href='/signupPet';
}

function managePet(){
	window.location.href='/managePet';
}
