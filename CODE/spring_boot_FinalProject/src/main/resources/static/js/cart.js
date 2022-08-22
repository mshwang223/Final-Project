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
}


// 모달 열기
final_pay_btn.onclick = function () {
  console.log("click");
  modal.style.display = "block";
}

// x버튼 클릭시 모달 닫기
span.onclick = function() {
  modal.style.display = "none";
}

// 다른 부분 클릭 시 모달 닫기
window.onclick = function(event) {
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