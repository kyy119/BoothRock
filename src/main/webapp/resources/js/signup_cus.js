jQuery(document).ready(function() {
	//회원가입 규칙 위배 여부 확인
	$(document).ready(function() {
		var submitButtons = document.getElementsByClassName("signup");
		submitButtons[0].disabled = true;
		let emailIsValid = false;
		let passwordIsValid = false;
		let passwordSameIsValid = false;
		// 이메일 중복 확인
		$('#emailConfirm').click(function(){
		 let emailType = validateEmail($('#user_id').val());
			if(emailType == true && $('#user_id').val() != ''){
				$.ajax({
					url : "email_duplicate",
					data : {
						user_id : $('#user_id').val()
					},
					success : function(result){
						if(result == 0){ 
							emailIsValid = true;
							alert('회원가입 가능한 이메일입니다!');
			      			$('#emailConfirm').hide();
			      			let inputElement = document.getElementById("user_id");
			    			inputElement.readOnly = true;
			      		}else{
			      			emailIsValid = false;
			      			alert('이미 가입된 이메일입니다!');
			      		}
			      		console.log('이메일 : ' + emailIsValid);// 삭제예정 
					} // success
				}); // ajax(이메일 중복)
			}else{
				alert('이메일 입력칸이 비어있거나 이메일 형식이 아닙니다!');
			}
	 	});// #emailConfirm click function
     // 입력 필드에 대한 input 이벤트 리스너 등록
    $('#user_password').on('blur', function() {
        // 입력 값이 변경되었을 때 실행되는 함수
	 	passwordIsValid = validatePassword($(this).val());
			 
		if (passwordIsValid && $(this).val() != '') {
			passwordIsValid = true;
			removeImage1();
			addImage1();
			passwordMessage.textContent = "";
           	passwordMessage.style.display = "none";
		} else {
			removeImage1();
			//alert('8자리 이상,대소문자,숫자,특수문자(@$!%*?&)가 입력되었는지 확인해주세요!'); // 삭제예정
			passwordMessage.textContent = "조건:8자이상,대소문자,숫자,특수문자(@$!%*?&)";
           	passwordMessage.style.display = "block";
		}
		console.log('패스워드1 : ' + passwordIsValid); // 삭제예정 
     }); // 입력 값이 변경되었을 때 실행되는 함수
         
    $('#user_password2').on('blur', function() {
		if($('#user_password').val() == $(this).val() && $(this).val() != ''){
			passwordSameIsValid = true;
			removeImage2();
			addImage2();
		}else{
			removeImage2();
			passwordSameIsValid = false;
		}
		console.log('패스워드2 : ' + passwordSameIsValid);// 삭제예정 
	});// 비밀번호와 비밀번호 확인 로직
	$('#user_name').on('blur', function() {
		
		if($(this).val() != ''){
			let emailConfirm = $('#emailConfirm');
			if(emailIsValid == true && passwordIsValid == true && passwordSameIsValid == true){
	 			submitButtons[0].disabled = false;
	 			emailConfirm.disabled = true;
			}else{
				submitButtons[0].disabled = true;
			}
			// 이름까지 규칙만족할시 회원가입 가능으로!
		}
	});
});
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

function addImage1(){ // 체크 이미지 동적으로 추가(패스워드 규칙 위배여부 확인용)
	let image = document.createElement("img");
	image.src = "resources/img/signup_check_mark.png";
	image.id = "dynamicImage1";
	document.getElementById("password_box").appendChild(image);
}

function addImage2(){ // 체크 이미지 동적으로 추가(패스워드 규칙 위배여부 확인용)
	let image = document.createElement("img");
	image.src = "resources/img/signup_check_mark.png";
	image.id = "dynamicImage2";
	document.getElementById("password_box2").appendChild(image);
}

function removeImage1() { // 체크 이미지 동적으로 제거(패스워드와 패스워드 확인 일치여부 확인용)
     let image = document.getElementById("dynamicImage1");
     if (image) {
         image.parentNode.removeChild(image);
     }
}

function removeImage2() { // 체크 이미지 동적으로 제거(패스워드와 패스워드 확인 일치여부 확인용)
     let image = document.getElementById("dynamicImage2");
     if (image) {
         image.parentNode.removeChild(image);
     }
}

