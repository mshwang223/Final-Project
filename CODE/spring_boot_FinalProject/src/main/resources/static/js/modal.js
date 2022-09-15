document.addEventListener("DOMContentLoaded", function(){
	const modals = document.querySelectorAll(".modal");
	const findIdModal = document.querySelector("#findIdModal");
	const findPwModal = document.querySelector("#findPwModal");
	const dropdownLogin = document.querySelector("#dropdown-login");
	const findIdBtn = document.querySelector("#findIdBtn");
	const findPwBtn = document.querySelector("#findPwBtn");
	const closeBtns = document.querySelectorAll(".close");
	
	if(findIdBtn != null) {
		findIdBtn.onclick = function() {
			dropdownLogin.style.display = "none";
			findPwModal.style.display = "none";
			findIdModal.style.display = "block";
		}
	}
	
	if(findPwBtn != null) {
		findPwBtn.onclick = function () {
			dropdownLogin.style.display = "none";
			findIdModal.style.display = "none";
			findPwModal.style.display = "block";
		}
	}
	
	closeBtns.forEach(closeBtn => {
		closeBtn.addEventListener("click", (event) => {
			$(".modal-content > div").empty();	// 초기화
			event.path[2].style.display = "none";
		});
	});
	
	window.onclick = function (event) {
		// console.log(event.target);
		if (event.target == findIdModal) {
			$(".modal-content > div").empty();	// 초기화
			findIdModal.style.display = "none";
		}
	}
	
	modals.forEach(modal => {
		modal.addEventListener("click", (event) => {
			if (event.target == modal) {
				$(".modal-content > div").empty();	// 초기화
				modal.style.display = "none";
			}
		});
	});

});