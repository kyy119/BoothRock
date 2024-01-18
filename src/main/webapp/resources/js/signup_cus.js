jQuery(document).ready(function() {
    var submitButtons = document.getElementsByClassName("signup");
    submitButtons[0].disabled = true;
    let emailIsValid = false;
    let passwordIsValid = false;
    let passwordSameIsValid = false;
	let agreeCheck = false;
	let nameCheck = false;
    // 이메일 중복 확인
    $('#emailConfirm').click(function() {
        let emailType = validateEmail($('#user_id').val());
        if (emailType == true && $('#user_id').val() != '') {
            $.ajax({
                url: "email_duplicate",
                data: {
                    user_id: $('#user_id').val()
                },
                success: function(result) {
                    if (result == 0) {
                        emailIsValid = true;
                        alert('회원가입 가능한 이메일입니다!');
                        $('#emailConfirm').hide();
                        let inputElement = document.getElementById("user_id");
                        inputElement.readOnly = true;
                    } else {
                        emailIsValid = false;
                        alert('이미 가입된 이메일입니다!');
                    }
                    console.log('이메일 : ' + emailIsValid);
                }
            });
        } else {
            alert('이메일 입력칸이 비어있거나 이메일 형식이 아닙니다!');
        }
    });

    // 입력 필드에 대한 input 이벤트 리스너 등록
    $('#user_password').on('blur', function() {
        // 입력 값이 변경되었을 때 실행되는 함수
        passwordIsValid = validatePassword($(this).val());

        if (passwordIsValid && $(this).val() != '') {
            passwordMessage.textContent = "조건을 만족합니다!";
            passwordMessage.style.color = "green";
            passwordMessage.style.display = "block";
        } else {
            passwordMessage.textContent = "비밀번호 조건을 만족해주세요!(8자이상,대소문자,숫자,특수문자(@$!%*?&))";
            passwordMessage.style.color = "red";
            passwordMessage.style.display = "block";
        }
    });

    $('#user_password2').on('blur', function() {
        if ($('#user_password').val() == $(this).val() && $(this).val() != '') {
            passwordSameIsValid = true;
            passwordMessage2.textContent = "조건을 만족합니다!";
            passwordMessage2.style.color = "green";
            passwordMessage2.style.display = "block";
        } else {
           	passwordMessage2.textContent = "비밀번호가 일치하지않습니다!";
            passwordMessage2.style.color = "red";
            passwordMessage2.style.display = "block";
            passwordSameIsValid = false;
        }
    });

    $('#user_name').on('blur', function() {
        if ($(this).val() != '') {
            nameCheck = true;
        }
    });
    
    $('#termsCheckbox').change(function() {
         if ($(this).is(':checked')) {
             // 체크됐을 때의 동작
            let emailConfirm = $('#emailConfirm');
            if (nameCheck == true && emailIsValid == true && passwordIsValid == true && passwordSameIsValid == true) {
                submitButtons[0].disabled = false;
                emailConfirm.hide();
            } else {
                submitButtons[0].disabled = true;
            }
         }
    });
});

function validatePassword(password) { // 비밀번호 유효성 검사 함수
	// 비밀번호는 최소 8자 이상이어야 합니다.
	if (password.length < 8) {
		return false;
	}
				 
	// 비밀번호는 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.
	const regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/;
	if (!regex.test(password)) {
		return false;
	}
	return true;
}

function validateEmail(email) { // 이메일 유효성 검사
    // 이메일 주소의 일반적인 형식을 확인하는 정규식
    let emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    // 주어진 이메일 주소가 형식에 부합하는지 검사
    if (emailRegex.test(email)) {
        return true;
    } else {
        return false;
    }
}

