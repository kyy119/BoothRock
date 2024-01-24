<%@page import="java.util.List"%>
<%@page import="com.multi.FM.users.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/mypage_edit.css"
	type="text/css">
<%
List<UsersVO> list = (List<UsersVO>) request.getAttribute("list");
String sellerNum = (String) request.getAttribute("sellerNum");
String userRole = (String) session.getAttribute("role");
%>

<script type="text/javascript">let userRole = "<%=userRole%>";</script>
<script src="resources/js/mypage_edit.js" defer type="text/javascript"></script>
<h1>회원정보수정</h1>
<br>
<hr class="shadow">
<br>
<div class="edit-form">
	<form class="input-form" onsubmit="return validateForm()"
		action="mypage/mypage_edit" method="post">
		<div>
			<%-- 변경 불가 --%>
			<i class="fa-regular fa-user"></i>
			<input type="email" id="email" name="user_id" style="color:#757575;"
				value=<%=list.get(0).getUser_id()%> placeholder="이메일" readonly>
		</div>
		<div id="password_box">
			<i class="fa-solid fa-unlock-keyhole"></i>
			<input type="password" id="password" name="user_password"
				value=<%=list.get(0).getUser_password()%> placeholder="비밀번호" required>
			<output id="passwordMessage" style="color: red; font-size: 10px; margin-top: 4px;"></output>
		</div>
		<div id="password_box2">
			<i class="fa-solid fa-unlock-keyhole"></i>
			<input type="password" id="password2" name="password2"
				value=<%=list.get(0).getUser_password()%> placeholder="비밀번호 확인" required>
		</div>
		<div>
			<%-- 변경 불가 --%>
			<i class="fa-regular fa-user"></i>
			<input type="text" id="name" name="user_name" style="color:#757575;"
				value=<%=list.get(0).getUser_name()%> placeholder="이름" readonly>
		</div>
		<div>
			<i class="fa-solid fa-mobile-screen"></i>
			<input type="text" id="tel" name="user_tel" value=<%=list.get(0).getUser_tel()%> placeholder="전화번호" required>
			<button type="button" id="send">본인인증</button>
			<!-- 전화번호가 기존과 동일하면 인증 진행 x / 동일하지 않으면 인증 진행 o -->
		</div>
		<div id="authNum"></div>
		<%
		  if (userRole.equals("consumer")) {
		%>
		<!-- 소비자면 사업자번호 입력칸 없애기 -->
		<%
		  } else {
		%>
		<div class="seller-number">
			<i class="fa-regular fa-address-card"></i>
			<input type="text" id="seller-number" name="selling_number" value=<%=sellerNum %> placeholder="사업자등록번호" required>
				<button type ="button" id="auth">인증하기</button>
		</div>
		<%
		  }
		%>
		<input type="text" name="user_role"
			value=<%=list.get(0).getUser_role()%> style="display: none;">
		<input type="submit" class="edit" value="완료">
	</form>
</div>