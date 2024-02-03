jQuery(document).ready(function() {

    $('#send').click(function(){
      let duplicate = false; // 중복여부 확인.
      let result2 = false; // 전화번호가 db에 있는 사람들만 찾기 가능
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
                  if(result == 1){ 
                      // 일치하는 전화번호 찾기 실패
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
     
     $.ajax({
        url : "create_authentication",
        data : {
            receive : $('#phone_number').val()
        },
        success : function(result){
            num = result
        }// success
            }) // ajax
        $('#verify').click(function() {
            let inputNum = $('#num').val();
            while(true){
                if(inputNum==num){
                    alert('본인인증이 완료되었습니다! 비밀번호 수정 페이지로 넘어갑니다.');
                    break;
                }else{
                    let select = confirm('인증번호가 일치하지않습니다! 재인증 하시겠습니까?');
                    if(select){
                        location.href = "find_password_num.jsp";
                    }
                    return false;
                }// else3
            }
        }); // #verify
  }else{
     alert('일치하는 정보가 없습니다!');
     let inputElement = document.getElementById("phone_number");
     inputElement.readOnly = false;
     document.getElementById('phone_number').value = '';
     return false;
  }; // else2
}