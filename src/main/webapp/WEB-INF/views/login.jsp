<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.springframework.ui.Model" %>
<%
	String login = (String)request.getAttribute("result");
	String notify = "아이디나 비밀번호를 확인해주세요";
	if (login.equals("1")) {
		notify = "로그인 성공! 메인으로 이동합니다.";
	}else if(login.equals("2")){
	  	notify = "블랙리스트에 등록된 유저이므로 로그인 불가입니다.";
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
	  	//var referrer = document.referrer;
	  	//alert("이전 페이지 URL: "+referrer);
	  location.href = "main.jsp";
	}else{
	  location.href = "login.jsp";
	}
</script>
</head>
<body>
</body>
</html>