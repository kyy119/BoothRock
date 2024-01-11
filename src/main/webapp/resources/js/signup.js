jQuery(document).ready(function() {
	$('#seller-check').change(function() {
		let businessIsValid = false;
		if ($(this).is(':checked')) {
	      $('.signup-form').css({
	        height: '530px'
	      });
	      $('.input-form').css({
	        height: '430px'
	      });
	     
	    } else {
	      $('.signup-form').css({
	        height: '450px'
	      });
	      $('.input-form').css({
	        height: '350px'
	      });
	    }
	    
	    let sellerNumberHTML = businessHTML(businessIsValid); // >> 판매자 체크박스를 클릭할 경우
	    $('.seller-number').html(sellerNumberHTML);
		$('.seller-number').slideToggle();
	}); // '#seller-check'.change
	
	//회원가입 규칙 위배 여부 확인
	$(document).ready(function() {
		$('.signup').hide();
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
	//console.log(emailIsValid + ' ' + passwordIsValid + ' ' + passwordSameIsValid);
	$('#user_name').on('blur', function() {
		if($(this).val() != ''){
			if(emailIsValid == true && passwordIsValid == true && passwordSameIsValid == true){
				$('.signup').show();				
			}else if(emailIsValid == false && passwordIsValid == true && passwordSameIsValid == true){
				alert('이메일 형식이 맞는지 또는 이메일이 입력되었는지 확인해주세요!');
				$('.signup').hide();
			}else if(emailIsValid == true && passwordIsValid == false && passwordSameIsValid == true){
				alert('비밀번호 형식이 맞는지 또는 비밀번호가 입력되었는지 확인해주세요!');
				$('.signup').hide();
			}else if(emailIsValid == true && passwordIsValid == true && passwordSameIsValid == false){
				alert('비밀번호가 일치하는지 확인해주세요!');
				$('.signup').hide();
			}
			// 이름까지 규칙만족할시 회원가입 가능으로!
		}
	});	
	// 아래는 3가지 조건이 만족할시 회원가입이 가능하도록 하는 로직 짤 예정
	});
}); // 제이쿼리 전체

// 아래는 사업자 인증을 하는 로직
function authenticateBusiness(businessIsValid) {
    // 여기에 사업자 인증 로직을 추가
    // 예를 들어, 서버와 통신하여 인증을 수행하고 성공하면 action을 변경
	
	$(document).ready(function() {
			var data = {
				"b_no" : [$('#selling_number').val()]
			};
				$.ajax({
					url : "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=",
					type : "POST",
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
    						document.querySelector('.input-form').action= "create_account_seller";
						}else{
							alert("사업자여부 인증실패!");
							document.querySelector('.input-form').action = "create_account_consumer";
						}
					},
					error : function(result) {
						console.log(result.responseText); //responseText의 에러메세지 확인
					}
				});// ajax
	}); // document ready
	
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
 
function businessHTML(businessIsValid) {
	let sellerNumberHTML = '<label for="selling_number">사업자번호</label>';
	sellerNumberHTML += '<input type="text" id="selling_number" name="selling_number" required>';
	sellerNumberHTML += '<button id="auth" onclick="authenticateBusiness(\'' + businessIsValid + '\')">인증하기</button>';
	return sellerNumberHTML;
}