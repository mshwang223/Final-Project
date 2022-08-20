// 체크박스 전체 선택,해제
function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName("package");
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}

// 결제 페이지 이동
function payment()  {
window.location.href = "/payment";
}