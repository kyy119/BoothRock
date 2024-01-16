jQuery(document).ready(function() {
	$(document).ready(function() {
		var submitButtons = document.getElementsByClassName("pw-edit");
		submitButtons[0].disabled = true;
		 let passwordIsValid = false;
		 let passwordSameIsValid = false;
		 
		 $('#user_password').on('blur', function() {
			var messageElement = document.getElementById('password_box');
			var passwordInput = document.getElementById('user_password');
	        // 입력 값이 변경되었을 때 실행되는 함수
		 	passwordIsValid = validatePassword($(this).val());
				 
			if (passwordIsValid && $(this).val() != '') {
				passwordIsValid = true;
				messageElement.textContent = "사용할수있는 비밀번호입니다!" 
			} else {
				messageElement.textContent = "사용할수없는 비밀번호입니다!"
			}
			messageElement.style.color = passwordIsValid ? 'green' : 'red';
       		passwordInput.style.borderColor = passwordIsValid ? 'green' : 'red'
			console.log('패스워드1 : ' + passwordIsValid); // 삭제예정 
     	 }); // 입력 값이 변경되었을 때 실행되는 함수
		 
		 $('#user_password_check').on('blur', function() {
		 	var messageElement = document.getElementById('password_box2');
		 	var passwordInput = document.getElementById('user_password_check');
			if($('#user_password').val() == $(this).val() && $(this).val() != ''){
				passwordSameIsValid = true;
				messageElement.textContent = "비밀번호가 일치합니다!" 
				if(passwordIsValid == true){
					submitButtons[0].disabled = false;
				}
			}else{
				passwordSameIsValid = false;
				messageElement.textContent = "비밀번호가 일치하지않습니다!"
			}
			 messageElement.style.color = passwordSameIsValid ? 'green' : 'red';
       		 passwordInput.style.borderColor = passwordSameIsValid ? 'green' : 'red'
			console.log('패스워드2 : ' + passwordSameIsValid);// 삭제예정 
		});// 비밀번호와 비밀번호 확인 로직
	}); // document.ready
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

