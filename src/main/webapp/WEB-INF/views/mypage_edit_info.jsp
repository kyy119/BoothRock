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
<script src="resources/js/mypage_edit.js" defer type="text/javascript"></script>

<h1>회원정보수정</h1>
<br>
<hr class="shadow">
<br>
<div class="edit-form">
	<form class="input-form" onsubmit="return validateForm()"
		action="mypage_edit" method="post">
		<div>
			<label for="email">이메일</label>
			<%-- 변경 불가 --%>
			<input type="email" id="email" name="email"
				placeholder=<%=list.get(0).getUser_id()%> disabled>
		</div>
		<div id="password_box">
			<label for="user_password">비밀번호</label> <input type="password"
				id="password" name="user_password"
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
			<label for="tel">전화번호</label> <input type="text" id="tel" name="user_tel"
				value=<%=list.get(0).getUser_tel()%> required>
			<button type="button" id="send">본인인증</button>
			<!-- 전화번호가 기존과 동일하면 인증 진행 x / 동일하지 않으면 인증 진행 o -->
		</div>
		<div id="authNum"></div>
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