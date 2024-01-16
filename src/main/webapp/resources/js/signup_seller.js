$(function() {
	let businessIsValid = false;
	let emailIsValid = false;
	let passwordIsValid = false;
	let passwordSameIsValid = false;
	let businessIsValid2 = false;
	let submitButtons = $('.signup')
	submitButtons[0].disabled = true;
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
                    //console.log('이메일 : ' + emailIsValid);
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
	
	$('#auth').click(function(){
	
	var data = {
					"b_no" : [$('#selling_number').val()]
				};
				$.ajax({
					url : "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=27WjNSd41ndjAbIoDRszbjdYwi%2FQXn1wZZhAcrglMHw1vWWIV36eqYIcgL3K2pTHYK499GDNc7wlbmNT7%2Behxg%3D%3D",
					type : "POST",
					async : false,
					data : JSON.stringify(data), // json 을 string으로 변환하여 전송
					dataType : "JSON",
					contentType : "application/json",
					accept : "application/json",
					success : function(result) {
						console.log(result); // 로직 완성되면 삭제
						$('#result').text(JSON.stringify(result))
						status_box = result.data
						if(result.match_cnt == '1' && status_box[0].b_stt == '계속사업자'){
							alert("사업자여부 인증완료");
    						businessIsValid = true;
    						$('#auth').hide();
    						let inputElement = document.getElementById("selling_number");
	    					inputElement.readOnly = true;
	    					businessIsValid2 = businessIsValid;
						}else{
							businessIsValid = false;
							alert("사업자여부 인증실패!");
						}
					},
					error : function(result) {
						console.log(result.responseText); //responseText의 에러메세지 확인
					}
				});// ajax
	})
	
	$('#termsCheckbox').change(function() {
         if ($(this).is(':checked')) {
             // 체크됐을 때의 동작
            let emailConfirm = $('#emailConfirm');
			let authConfirm = $('#auth');
			if(businessIsValid2 == true && emailIsValid == true && passwordIsValid == true && passwordSameIsValid == true){
				submitButtons[0].disabled = false;
				emailConfirm.disabled = true;
				authConfirm.disabled = true;
			}
         }
    });
	
	$('.signup').click(function(){
    	if(submitButtons[0].disabled){
    		alert("회원가입 조건을 만족하지않습니다!");
    		return false;
    	}
    })
    
    
	
}); // 제이쿼리 전체

// 아래는 사업자 인증을 하는 로직
function authenticateBusiness(businessIsValid) {
    // 여기에 사업자 인증 로직을 추가
    // 예를 들어, 서버와 통신하여 인증을 수행하고 성공하면 action을 변경
	
	//$(document).ready(function() {
				var data = {
					"b_no" : [$('#selling_number').val()]
				};
				$.ajax({
					url : "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=27WjNSd41ndjAbIoDRszbjdYwi%2FQXn1wZZhAcrglMHw1vWWIV36eqYIcgL3K2pTHYK499GDNc7wlbmNT7%2Behxg%3D%3D",
					type : "POST",
					async : false,
					data : JSON.stringify(data), // json 을 string으로 변환하여 전송
					dataType : "JSON",
					contentType : "application/json",
					accept : "application/json",
					success : function(result) {
						console.log(result); // 로직 완성되면 삭제
						$('#result').text(JSON.stringify(result))
						status_box = result.data
						if(result.match_cnt == '1' && status_box[0].b_stt == '계속사업자'){
							alert("사업자여부 인증완료");
    						businessIsValid = true;
    						$('#auth').hide();
    						let inputElement = document.getElementById("selling_number");
	    					inputElement.readOnly = true;
	    					
							alert(businessIsValid + " >> 1")
	    					businessIsValid2 = businessIsValid;
						}else{
							businessIsValid = false;
							alert("사업자여부 인증실패!");
							businessIsValid2 = businessIsValid;
						}
					},
					error : function(result) {
						console.log(result.responseText); //responseText의 에러메세지 확인
					}
				});// ajax
				
		
	//}); // document ready
}

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


