/**
 *
 */
$(document).ready(function () {

    // 아이디 중복체크
    let checkId = false;
    $(".btn_idcheck").on('click', function () {
        // 기본 기능 중단
        event.preventDefault();

        if ($('#updateprofileId').val() == "") {
            alert("아이디를 입력하세요");
            $('#updateprofileId').focus();
            return false;
        }

        $.ajax({
            type: "post",
            url: "/chkId",
            data: {"userId": $('#updateprofileId').val()},
            dataType: "text",
            success: function (result) {
                // 성공 시 결과 받음
                if (result == "FIND") {
                    alert("이미 사용중인 아이디 입니다.");
                    $('#updateprofileId').css('border', '1px solid #E65454');
                    $('#updateprofileId').focus();
                } else {
                    alert("사용 가능한 아이디 입니다.");
                    $('#updateprofileId').css('border', '1px solid #EE82EE');
                    checkId = true;
                }
            },
            error: function () {
                // 오류있을 경우 수행 되는 함수
                alert("전송 실패");
            }
        });
    });

    // 이메일 중복체크
    let checkEmail = false;
    $(".btn_emailcheck").on('click', function () {
        // 기본 기능 중단
        event.preventDefault();

        if ($('#updateprofileEmail').val() == "") {
            alert("이메일을 입력하세요");
            $('#updateprofileEmail').focus();
            return false;
        }

        // 이메일 형식 유효성 검사
        let emailRule = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        let emailVal = $('#updateprofileEmail').val();

        if (!emailRule.test(emailVal)) {
            alert("이메일 형식을 확인해주세요");
            $('#updateprofileEmail').focus();
            return false;
        }

        $.ajax({
            type: "post",
            url: "/chkEmail",
            data: {"userEmail": emailVal},
            dataType: "text",
            success: function (result) {
                // 성공 시 결과 받음
                if (result == "FIND") {
                    alert("이미 사용 중인 이메일입니다.");
                    $('#updateprofileEmail').css('border', '1px solid #E65454');
                    $('#updateprofileEmail').focus();
                } else {
                    alert("사용할 수 있는 Email입니다.");
                    $('#updateprofileEmail').css('border', '1px solid #EE82EE');
                    checkEmail = true;
                }
            },
            error: function () {
                // 오류있을 경우 수행 되는 함수
                alert("전송 실패");
            }
        });
    });

    $("#updateprofile").on('submit', function () {
        // submit 이벤트 기본 기능 : 페이지 새로 고침
        // 기본 기능 중단
        event.preventDefault();


        $.ajax({
            type: "post",
            url: "/updateprofile",
            data: {
                "userId": $('#updateprofileId').val(),
                "userEmail": $('updateprofileEmail').val()
            },
            dataType: "text",
            success: function (result) {
                if (result == "SUCCESS") {
                    alert("프로필 수정을 완료했습니다!");
                    location.href = "/mypage";
                }
            },
            error: function () {
                // 오류있을 경우 수행 되는 함수
                alert("프로필 수정 실패");
            }
        });
    });
    $(".btn_cancel_done").click(function () {
        location.href = "/mypage";
    });


    function isIdEmpty(id) {
        return id == null || id === '';

    }

    function isEmailEmpty(email) {
        return email == null || email === '';
    }

    $(document).on('click', '.btn_updateprofile_done', function () {
        event.preventDefault();
        let id = $('#updateprofileId').val();
        let email = $('#updateprofileEmail').val();
        if (isIdEmpty(id) && isEmailEmpty(email)) {
            alert("이메일 혹은 이메일을 입력해주세요");
            return;
        }
        if (!isIdEmpty(id) && !checkId) {
            alert("아이디 중복체크해주세요");
            return;
        }
        if (!isEmailEmpty(email) && !checkEmail) {
            alert("이메일 중복체크해주세요");
            return;
        }

        $.ajax({
            type: "post",
            url: "/updateprofile",
            data: {
                "userId": id,
                "userEmail": email
            },
            dataType: "text",
            success: function (result) {
                if (result == "SUCCESS") {
                    alert("프로필 수정을 완료했습니다!");
                    location.href = "/mypage";
                } else {
                    alert("오류");
                }
            },
            error: function () {
                // 오류있을 경우 수행 되는 함수
                alert("프로필 수정 실패");
            }
        });
    });


});