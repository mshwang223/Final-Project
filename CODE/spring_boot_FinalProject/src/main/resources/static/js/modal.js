document.addEventListener("DOMContentLoaded", function(){
	const modals = document.querySelectorAll(".modal");
	const findIdModal = document.querySelector("#findIdModal");
	const findPwModal = document.querySelector("#findPwModal");
	const findIdBtn = document.querySelector("#findIdBtn");
	const findPwBtn = document.querySelector("#findPwBtn");
	const closeBtns = document.querySelectorAll(".close");
	
	if(findIdBtn != null) {
		findIdBtn.onclick = function() {
			findIdModal.style.display = "block";
		}
	}
	
	if(findPwBtn != null) {
		findPwBtn.onclick = function () {
			findPwModal.style.display = "block";
		}
	}
	
	closeBtns.forEach(closeBtn => {
		closeBtn.addEventListener("click", (event) => {
			event.path[2].style.display = "none";
		})
	});
	
	window.onclick = function (event) {
		// console.log(event.target);
		if (event.target == findIdModal) {
			findIdModal.style.display = "none";
		}
	}
	
	modals.forEach(modal => {
		modal.addEventListener("click", (event) => {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		});
	});

});