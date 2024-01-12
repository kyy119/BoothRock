<%@page import="java.util.List"%>
<%@page import="com.multi.FM.users.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/mypage_edit.css"
	type="text/css">
<%
List<UsersVO> list = (List<UsersVO>) request.getAttribute("list");
%>
<%
  String userRole = (String) session.getAttribute("userRole");
%>
<script type="text/javascript">
	$(document).ready(function() {
		$('#send').hide(); //전화번호 인증칸 숨기기
		let sameTel = true;
		$('#password').on('blur', function() {
			let passwordIsValid = false;
			let passwordSameIsValid = false;
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

		$('#password2').on('blur', function() {
			if ($('#password').val() == $(this).val() && $(this).val() != '') {
				passwordSameIsValid = true;
				removeImage2();
				addImage2();
				alert("test");
				alert(<%=list.get(0).getUser_tel()%>);
			} else {
				removeImage2();
				passwordSameIsValid = false;
			}
			console.log('패스워드2 : ' + passwordSameIsValid);// 삭제예정 
		});// 비밀번호와 비밀번호 확인 로직
		//console.log(emailIsValid + ' ' + passwordIsValid + ' ' + passwordSameIsValid);
		
		
		$('#tel').on('blur', function() { //전화번호 입력값 변경시 실행되는 함수
			let origin_num = <%=list.get(0).getUser_tel()%>;
			if (origin_num == $(this).val().replace(/\D/g, '')){
				sameTel = true;
				$('#send').hide();
			} else {
				sameTel = false;
				$('#send').show();
			}
		});
		
		
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
</script>

<h1>회원정보수정</h1>
<br>
<hr class="shadow">
<br>
<div class="edit-form">
	<form class="input-form" onsubmit="return validateForm()"
		action="mypage_edit">
		<div>
			<label for="email">이메일</label>
			<%-- 변경 불가 --%>
			<input type="email" id="email" name="email"
				placeholder=<%=list.get(0).getUser_id()%> disabled>
		</div>
		<div id="password_box">
			<label for="user_password">비밀번호</label> <input type="password"
				id="password" name="password"
				value=<%=list.get(0).getUser_password()%> required>
			<output id="passwordMessage" style="color: red; font-size: 10px;"></output>
		</div>
		<div id="password_box2">
			<label for="user_password2">비밀번호 확인</label> <input type="password"
				id="password2" name="password2"
				value=<%=list.get(0).getUser_password()%> required>
		</div>
		<div>
			<label for="name">이름</label>
			<%-- 변경 불가 --%>
			<input type="text" id="name" name="name"
				placeholder=<%=list.get(0).getUser_name()%> disabled>
		</div>
		<div>
			<label for="tel">전화번호</label> <input type="text" id="tel" name="tel"
				value=<%=list.get(0).getUser_tel()%> required>
			<button id="send">본인인증</button>
			<!-- 전화번호가 기존과 동일하면 인증 진행 x / 동일하지 않으면 인증 진행 o -->
		</div>
		<%
		  if (userRole == "cus") {
		%>
		<!-- 소비자면 사업자번호 입력칸 없애기 -->
		<%
		  } else {
		%>
		<div class="seller-number">
			<label for="seller-number">사업자번호</label> <input type="text"
				id="seller-number" name="seller-number" required>
		</div>
		<%
		  }
		%>
		<input type="submit" class="edit" value="완료">
	</form>
</div>

<script type="text/javascript">
	function validateForm() {
		
		// 비밀번호 동일 하면 true 다르면 alert
		// 기존과 전화번호 사업자번호 동일하면 true 다르면 인증해서 true 둘다 아니면 false
		// 사업자면 post요청 두번 user테이블, seller테이블 
		// 
		// 여기에 필요한 조건을 추가하여 폼 유효성을 검사
		// 예: if (조건을 만족하지 않으면) { alert("에러 메시지"); return false; }
		// 폼이 유효하면 true 반환, 유효하지 않으면 false 반환
		return false; // 예제에서는 항상 true를 반환하도록 설정
	}
</script>