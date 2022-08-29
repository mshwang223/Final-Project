// 프로필 사진 변경

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
