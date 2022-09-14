
const modals = document.querySelectorAll(".modal");
const reviewmodal = document.querySelector("#reviewmodal");
const reviewBtn = document.querySelector(".review_btn");
const form = document.querySelector(".form-group");
const closeBtns = document.querySelectorAll(".close");

$(document).on('click','.review_btn',function () {
	$('#reviewmodal').css('display', 'block');
	let orderNo = $(this).data('ordno');
	let stayNo = $(this).data('stayno');
	$('#ordNo').val(orderNo);
	$('#stayNo').val(stayNo);
})

closeBtns.forEach(closeBtn => {
	closeBtn.addEventListener("click", (event) => {

		form.reset();
		event.path[2].style.display = "none";
	})
});

window.onclick = function (event) {
	console.log(event.target);
	if (event.target == reviewmodal) {
		form.reset();
		reviewmodal.style.display = "none";

	}
}


modals.forEach(modal => {
	modal.addEventListener("click", (event) => {
		if (event.target == modal) {
			form.reset();
			modal.style.display = "none";
		}
	});
})
