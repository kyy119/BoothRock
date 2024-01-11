<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.springframework.ui.Model" %>
<%
	String login = (String)request.getAttribute("result");
	String notify = "아이디나 비밀번호를 확인해주세요";
	if (login.equals("1")) {
		notify = "로그인 성공! 메인으로 이동합니다.";
	} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 축제의 부스를 담다 - 부스락</title>
<script type="text/javascript">
	alert("<%= notify %>");
	let result = <%= login %>;
	if(result == "1"){
	  location.href = "main.jsp";
	}else{
	  location.href = "login.jsp";
	}
</script>
</head>
<body>
</body>
</html>