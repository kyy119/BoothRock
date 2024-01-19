let telAuth = false; // 전화번호 인증여부
let sameTel = true; // 전화번호 변경여부
let passwordIsValid = true; //비밀번호 유효성
let passwordSameIsValid = true; //비밀번호 확인 일치여부
let businessIsValid = false; //사업자 번호 인증여부
let sameBusiness = true; //사업자번호 변경여부
let origin_tel = document.getElementById('tel').value; //기존 전화번호
let origin_num = document.getElementById('seller-number').value; //기존 사업자번호

jQuery(document).ready(function() {
		$('#send').hide(); //전화번호 인증칸 숨기기
		$('#authNum').hide(); //전화번호 인증칸 숨기기
		$('#auth').hide(); //사업자번호 인증칸 숨기기
		
		$('#password').on('blur', function() { //비밀번호 입력값 변경 시 실행되는 함수
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

		$('#password2').on('blur', function() { //비밀번호 확인 입력값 변경시 실행되는 함수
			if ($('#password').val() == $(this).val() && $(this).val() != '') {
				passwordSameIsValid = true;
				removeImage2();
				addImage2();
			} else {
				removeImage2();
				passwordSameIsValid = false;
			}
		});// 비밀번호와 비밀번호 확인 로직

		$('#tel').on('blur', function() { //전화번호 입력값 변경시 실행되는 함수
			if (telAuth) { // 전화번호 인증 완료시 인증하기 버튼 생성되지 않음
				return;
			} else if (origin_tel == $(this).val().replace(/\D/g, '')) {
				sameTel = true;
				$('#send').hide();
				$('#authNum').hide();
			}  else {
				sameTel = false;
				$('#send').show();
			}
		});

		$('#send').click(function() { //전화번호 인증하기 클릭시
			let duplicate = false; // 중복여부 확인.
			let result2 = false; // 전화번호가 중복인 사람이 가입하려고 하면 가입 실패가 뜨게 하기 위함
			let phoneNumber = $('#tel').val();

			// 전화번호에서 공백을 제거하고 숫자만 추출
			let numericPhoneNumber = phoneNumber.replace(/\D/g, '');

			if (numericPhoneNumber.length !== 11) {
				alert('유효하지 않은 전화번호 입니다!');
				document.getElementById('tel').value = '';
				return false;
			} else {
				$.ajax({
					url : "phone_duplicate",
					data : {
						user_tel : phoneNumber
					},
					success : function(result) {
						if (result == 0) {
							duplicate = true;
						}
						result2 = dupli(duplicate);
					}// success
				})
				if (result2 == false) {
					return false;
				}
			}// else1
		}); // #send
		
		$('#seller-number').on('blur', function() { //사업자 번호 입력값 변경시 실행되는 함수
			if (businessIsValid) { // 사업자 인증 완료시 인증하기 버튼 생성되지 않음
				return;
			} else if (origin_num == $(this).val().replace(/\D/g, '')) {
				sameBusiness = true;
				$('#auth').hide();
			}  else {
				sameBusiness = false;
				$('#auth').show();
			}
		});
		
		$('#auth').click(function(){ //사업자 번호 인증하기 클릭시
	
				var data = {
					"b_no" : [$('#seller-number').val()]
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
						status_box = result.data
						if(result.match_cnt == '1' && status_box[0].b_stt == '계속사업자'){
							alert("사업자여부 인증완료");
    						businessIsValid = true;
    						$('#auth').hide();
    						let inputElement = document.getElementById("seller-number");
	    					inputElement.readOnly = true;
						}else{
							businessIsValid = false;
							alert("사업자여부 인증실패!");
						}
					},
					error : function(result) {
						console.log(result.responseText); //responseText의 에러메세지 확인
					}
				});// ajax
			});// auth
});//document.ready

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

	function addImage1() { // 체크 이미지 동적으로 추가(패스워드 규칙 위배여부 확인용)
		let image = document.createElement("img");
		image.src = "resources/img/signup_check_mark.png";
		image.id = "dynamicImage1";
		document.getElementById("password_box").appendChild(image);
	}

	function addImage2() { // 체크 이미지 동적으로 추가(패스워드 규칙 위배여부 확인용)
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

	function dupli(duplicate) { // 전화번호 인증api
		if (duplicate) {
			$('#send').hide();
			let inputElement = document.getElementById("tel");
			inputElement.readOnly = true;
			let num = 0;
			// authNum이라는 div 태그에 인증번호를 받는 HTML 추가
			let authNumHTML = '<label for="num">인증번호</label>';
			authNumHTML += '<input type="text" id="num" name="num" required>';
			authNumHTML += '<button type="button" id="verify">인증하기</button>';
			alert('인증번호를 전송하였습니다!');
			$('#authNum').html(authNumHTML);
			$('#authNum').show(); //인증번호칸 보이기
			$.ajax({
				url : "create_authentication",
				data : {
					receive : $('#tel').val()
				},
				success : function(result) {
					num = result
					alert("" + num) // 맨 마지막에 꼭 지우기!!
				}// success
			}) // ajax
			$('#verify').click(function() {
				let inputNum = $('#num').val();
				while (true) {
					if (inputNum == num) {
						alert('본인인증이 완료되었습니다!');
						$('#tel').prop('readOnly', true);
						$('#num').prop('readOnly', true);
						$('#verify').hide();
						$('#authNum').hide();
						telAuth = true;
						break;
					} else {
						let select = confirm('인증번호가 일치하지않습니다! 재인증 하시겠습니까?');
						if (select) {
							$('#send').show();
							$('#authNum').html('');
							$('#authNum').hide();
						}
						return false;
					}// else3
				}
			}); // #verify
		} else {
			alert('이미 가입된 전화번호 입니다!');
			let inputElement = document.getElementById("tel");
			inputElement.readOnly = false;
			document.getElementById('tel').value = '';
			return false;
		} // else2
	};
	function validateForm() { //폼 형식 유효성 체크, 모두 완료시 수정가능
		if (!passwordSameIsValid) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		} else if(!passwordIsValid) {
			alert("유효하지 않은 비밀번호입니다.");
			return false;
		} else if(!(sameTel || telAuth)) {
			alert("전화번호 인증이 필요합니다.");
			return false;
		} else if(userRole == "seller") {
			if(!(sameBusiness || businessIsValid)){ //판매자일 경우 사업자 번호 변경없거나 인증 완료되면 수정가능 
				alert("사업자 인증이 필요합니다.");
				return false;
			} else {
				alert("회원정보수정이 완료되었습니다.");
				return true;
			}
		} else {
			alert("회원정보수정이 완료되었습니다.");
			return true;
		}
	};
	