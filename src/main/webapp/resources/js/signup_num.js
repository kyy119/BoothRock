jQuery(document).ready(function() {

		$('#send').click(function(){
		  let duplicate = false; // 중복여부 확인.
		  let result2 = false; // 전화번호가 중복인 사람이 가입하려고 하면 가입 실패가 뜨게 하기 위함
	      let phoneNumber = $('#phone_number').val();
			
	      // 전화번호에서 공백을 제거하고 숫자만 추출
	      let numericPhoneNumber = phoneNumber.replace(/\D/g, '');
	
	      if (numericPhoneNumber.length !== 11) {
	        alert('유효하지 않은 전화번호 입니다!');
	        document.getElementById('phone_number').value = '';
	        return false;
	      }else{
	      	$.ajax({
	      		url : "phone_duplicate",
	      		data : {
	      			user_tel : phoneNumber
	      		},
	      		success : function(result){
	      			if(result == 0){
	      				duplicate = true;
	      			}
	      			result2 = dupli(duplicate);
	      		}// success
	      	})
	      	if(result2 == false){
	      		return false;
	      	}
	      }// else1
	}); // #send
	
});
function dupli(duplicate){
	if(duplicate){
	     $('#send').hide();
	     let inputElement = document.getElementById("phone_number");
	     inputElement.readOnly = true;
	     let num = 0
		 alert('인증번호를 전송하였습니다!');
		 // authNum이라는 div 태그에 인증번호를 받는 HTML 추가
	     let authNumHTML = '<label for="num">인증번호</label>'; 
	     authNumHTML += '<input type="text" id="num" name="num" required>';
	     authNumHTML += '<button id="verify">인증하기</button>';
	     $('#authNum').html(authNumHTML);
		 $.ajax({
			url : "create_authentication1",
			data : {
				receive : $('#phone_number').val()
			},
			success : function(result){
				num = result
				alert("" + num) // 맨 마지막에 꼭 지우기!!
			}// success
				}) // ajax
			$('#verify').click(function() {
	        	let inputNum = $('#num').val();
	        	while(true){
					if(inputNum==num){
						alert('본인인증이 완료되었습니다! 회원가입 페이지로 넘어갑니다.');
						break;
					}else{
						let select = confirm('인증번호가 일치하지않습니다! 재인증 하시겠습니까?');
						if(select){
							$('#send').show();
							$('#authNum').html('');
						}
						return false;
					}// else3
				}
	    	}); // #verify
	  }else{
	     alert('이미 가입된 전화번호 입니다!');
	     let inputElement = document.getElementById("phone_number");
	     inputElement.readOnly = false;
	     document.getElementById('phone_number').value = '';
	     return false;
	  }; // else2
}