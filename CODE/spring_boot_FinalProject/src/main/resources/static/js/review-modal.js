const modals = document.querySelectorAll(".modal");
const reviewmodal = document.querySelector("#reviewmodal");
const reviewBtn = document.querySelector("#review_btn");
const closeBtns = document.querySelectorAll(".close");
const findIdModal = document.querySelector("#findIdModal");
const findPwModal = document.querySelector("#findPwModal");
const findIdBtn = document.querySelector("#findIdBtn");
const findPwBtn = document.querySelector("#findPwBtn");

findIdBtn.onclick = function() {
	findIdModal.style.display = "block";
}

findPwBtn.onclick = function () {
	findPwModal.style.display = "block";
}

review_btn.onclick = function() {
	reviewmodal.style.display = "block";
}

closeBtns.forEach(closeBtn => {
	closeBtn.addEventListener("click", (event) => {
		event.path[2].style.display = "none";
	})
});

window.onclick = function (event) {
	console.log(event.target);
	if (event.target == reviewmodal) {
		reviewmodal.style.display = "none";
	}
}

modals.forEach(modal => {
	modal.addEventListener("click", (event) => {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	});
})

