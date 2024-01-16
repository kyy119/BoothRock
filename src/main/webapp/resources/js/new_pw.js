jQuery(document).ready(function() {
	let editButtons = $('.pw-edit');
	editButtons[0].disabled = true;
	let passwordIsValid = false;
	let passwordSameIsValid = false;
	console.log(editButtons[0].disabled);	 
	$('#user_password').on('blur', function() {
	  // 입력 값이 변경되었을 때 실행되는 함수
		passwordIsValid = validatePassword($(this).val());
				 
		if (passwordIsValid && $(this).val() != '') {
			passwordIsValid = true;
			passwordMessage.textContent = "사용할수있는 비밀번호입니다!"
			passwordMessage.style.color = "green";
			passwordMessage.style.display = "block"; 
		} else {
			editButtons[0].disabled = true;
			passwordMessage.textContent = "비밀번호 조건을 만족해주세요!(8자이상,대소문자,숫자,특수문자(@$!%*?&))";
            passwordMessage.style.color = "red";
            passwordMessage.style.display = "block";
		}
		console.log('패스워드1 : ' + passwordIsValid); // 삭제예정 
     }); // 입력 값이 변경되었을 때 실행되는 함수
		 
	$('#user_password_check').on('blur', function() {
		if(passwordIsValid == true && $('#user_password').val() == $(this).val() && $(this).val() != ''){
			passwordSameIsValid = true;
			passwordMessage2.style.color = "green";
			passwordMessage2.textContent = "비밀번호가 일치합니다!" 
            passwordMessage2.style.display = "block";
			editButtons[0].disabled = false;
		}else{
			editButtons[0].disabled = true;
			passwordSameIsValid = false;
			passwordMessage2.style.color = "red";
			passwordMessage2.textContent = "비밀번호가 일치하지않습니다!"
            passwordMessage2.style.display = "block";
		}
		console.log('패스워드2 : ' + passwordSameIsValid);// 삭제예정 
	});// 비밀번호와 비밀번호 확인 로직
		
}); // 제이쿼리 전체

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

