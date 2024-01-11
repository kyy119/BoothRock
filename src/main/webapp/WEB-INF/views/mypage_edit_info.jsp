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
<%	String userRole = (String) session.getAttribute("userRole");
 %>
<script type="text/javascript">

</script>

<h1>회원정보수정</h1>
<br>
<hr class="shadow">
<br>
<div class="edit-form">
	<form class="input-form" onsubmit="return validateForm()" action="mypage_edit">
		<div>
			<label for="email">이메일</label>
			<%-- 변경 불가 --%>
			<input type="email" id="email" name="email"
				placeholder=<%=list.get(0).getUser_id() %> disabled>
		</div>
		<div>
			<label for="password">비밀번호</label> <input type="password"
				id="password" name="password" value=<%=list.get(0).getUser_password() %> required>
		</div>
		<div>
			<label for="password2">비밀번호 확인</label> <input type="password"
				id="password2" name="password2" value=<%=list.get(0).getUser_password() %> required>
		</div>
		<div>
			<label for="name">이름</label>
			<%-- 변경 불가 --%>
			<input type="text" id="name" name="name" placeholder=<%=list.get(0).getUser_name()%>
				disabled>
		</div>
		<div>
			<label for="tel">전화번호</label> <input type="text" id="tel" name="tel" value=<%=list.get(0).getUser_tel() %>
				required>
			<button>본인인증</button>
			<!-- 전화번호가 기존과 동일하면 인증 진행 x / 동일하지 않으면 인증 진행 o -->
		</div>
		<%if(userRole=="cus"){ %> <!-- 소비자면 사업자번호 입력칸 없애기 -->
		<%} else{ %>
		<div class="seller-number">
			<label for="seller-number">사업자번호</label> <input type="text"
				id="seller-number" name="seller-number" required>
		</div>
		<%} %>
		<input type="submit" class="edit" value="완료">
	</form>
</div>

<script type="text/javascript">
    function validateForm() {
        // 여기에 필요한 조건을 추가하여 폼 유효성을 검사
        // 예: if (조건을 만족하지 않으면) { alert("에러 메시지"); return false; }
        // 폼이 유효하면 true 반환, 유효하지 않으면 false 반환
        return true; // 예제에서는 항상 true를 반환하도록 설정
    }
</script>