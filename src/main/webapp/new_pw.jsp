<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String user_tel = (String)request.getParameter("phone_number");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
	<link rel="stylesheet" href="resources/css/signup_num.css" type="text/css">
	<script src="resources/js/new_pw.js" defer type="text/javascript"></script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%
		if(user_tel == null){
	%>
		<script type="text/javascript">
			alert("휴대폰 인증을 먼저 진행해주세요!");
			location.href="find_password_num.jsp";
		</script>
   	<% }else{ %>
   		<div class="bodywrap" style="margin: 200px 0px 330px;">
		   	<div class="signup-form">
		   		<h3>새 비밀번호 변경</h3>
		   		<form action = "edit_password" class="input-form" method="post">
		   			<input type="hidden" id="user_tel" name="user_tel" value="<%= user_tel %>">
		   			<div>
		   				<i class="fa-solid fa-unlock-keyhole"></i>
						<input type="password" id="user_password" name="user_password" placeholder="새 비밀번호" required>
						<div id="password_box"></div>
		   			</div>
		   			<div>
		   				<i class="fa-solid fa-unlock-keyhole"></i>
						<input type="password" id="user_password_check" name="user_password_check" placeholder="새 비밀번호 확인" required>
						<div id="password_box2"></div>
		   			</div>
		   			<input type="submit" class="pw-edit" value="비밀번호 변경">
		   		</form>
		   	</div>
	   	</div>
   	<% } %>
   	<%@ include file="footer.jsp" %>
</body>
</html>
