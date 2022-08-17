function selectAll(selectAll)  {
    const checkboxes 
         = document.getElementsByName("package");
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = selectAll.checked;
    })
  }