// 모달
const final_pay_btn = document.querySelector('.final_pay_btn');
const modal = document.getElementById("final_pay_modal");
const span = document.getElementsByClassName("close")[0];

// 체크박스
function selectAll(selectAll) {
    const checkboxes
        = document.getElementsByName("package");

    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
    })
    let length = $('.deleteCheckBox:checked').length;
    $("#count").text(length);
}

$(document).on('click', '.delete_btn', function () {

    let checkBox = $('.deleteCheckBox:checked');
    if (checkBox.length <= 0) {
        alert("삭제할 품목을 체크해주세요");
        return;
    }
    let list = Array.from(checkBox.map((i, element) => $(element).data("id")));

    deleteCartAjax(list);


})
$(document).on('change', '.deleteCheckBox', function () {
    let length = $('.deleteCheckBox:checked').length;
    $("#count").text(length);
});

function deleteCartAjax(id) {
    $.ajax({
        type: "DELETE",
        url: "/carts",
        data: {"id": id},
        success: function (data) {
            if (data == "success") {
                alert("삭제되었습니다.");
                location.reload();
            }
        },
        error: function () {
            alert("error");
        }
    });
}

$(document).on('click', '.item__delete', function () {
    let id = [$(this).data("id")];
    deleteCartAjax(id);
})


// 모달 열기
final_pay_btn.onclick = function () {
    console.log("click");
    modal.style.display = "block";
}

// x버튼 클릭시 모달 닫기
span.onclick = function () {
    modal.style.display = "none";
}

// 다른 부분 클릭 시 모달 닫기
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

// 체크박스
function selectAll2(selectAll) {
    const checkboxes
        = document.getElementsByName("agree1");

    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
    })
}
$(document).ready(function(){
	// 가격보상제도 클릭시
	$('#insurancePrice').click(function(){
		$('.info_insurance').slideToggle('500');
	});
});