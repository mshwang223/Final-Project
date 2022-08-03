/**
 * userManage.html에 사용
 * 사용자 관리 JS
 */
 
$(document).ready(function() {

	// 전체 체크 해제 기능
	$('input[name=selected_all]').on('change', function() {
		$('input[name=selected]').prop('checked', this.checked);
	});

});

function listing() {
	let tmpHtml = `	<tr>
						<td>1</td>
						<td><input type="checkbox" name="selected"></td>
						<td class="editable">abc1001</td>
						<td class="editable">홍길동</td>
					</tr>
					<tr>
						<td>2</td>
						<td><input type="checkbox" name="selected"></td>
						<td class="editable">abc1002</td>
						<td class="editable">이몽룡</td>
					</tr>
					<tr>
						<td>3</td>
						<td><input type="checkbox" name="selected"></td>
						<td class="editable">abc1003</td>
						<td class="editable">성춘향</td>
					</tr>
				`;
	$('#users').append(tmpHtml);
}

function deleting() {
	// checked 된 Data 확인
	const checkboxAll = $('input[name=selected_all]');
	const checkbox = $('input[name=selected]:checked');

	if (checkbox.length == 0) {
		alert("체크 항목이 없습니다.");
		return;
	}

	if (confirm('삭제 하시겠습니까?')) {
		alert('아직 기능을 구현하지 못했습니다.');
		checkboxAll.prop('checked', false);
		checkbox.prop('checked', false);
	}
}

// 테이블 선택할 때마다 발생되는 이벤트
$(document).on("click", ".editable", function() {
	const checkRows = $(this).parent().children();
	const tdArr = new Array();

	chec
	chkUser(tdArr[2], tdArr[3]);
});

// 임시 데이터
function chkUser(index, name) {
	if (index === "abc1001" && name === "홍길동")
		inputTmpData("abc1001", "홍길동", "2021", "7", "24", "1",
			"011", "3574", "3478", "sdlhf035", "gmail", "1", "1");
	else if (index === "abc1002" && name === "이몽룡")
		inputTmpData("abc1002", "이몽룡", "2022", "1", "10", "2",
			"010", "4453", "0075", "dafj1105", "naver", "2", "2");
	else
		inputTmpData("abc1003", "성춘향", "2022", "5", "3", "2",
			"019", "6925", "8542", "dfg6839", "hanmail", "1", "2");
}

function inputTmpData(id, name, birthYear, birthMonth, birthDay, solar,
	tel1, tel2, tel3, job, email1, email2, emailRcv, author) {
	$('#id').val(id);
	$('#name').val(name);

	$('#birthYear').val(birthYear);
	$('#birthMonth').val(birthMonth);
	$('#birthDay').val(birthDay);

	$(":radio[name='solar'][value='" + solar + "']").attr('checked', true);

	$('#Tel1').val(tel1);
	$('#Tel2').val(tel2);
	$('#Tel3').val(tel3);

	$('#job').val(job);

	$('#email1').val(email1);
	$('#email2').val(email2);

	$(":radio[name='emailRcv'][value='" + emailRcv + "']").attr('checked', true);

	$('#author').val(author);
}