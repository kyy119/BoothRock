<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 축제의 부스를 담다 - 부스락</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup_to_num.css" type="text/css">
</head>
<body>
	<%@ include file="../header.jsp" %>
    
    <div class="bodywrap">
    	<div class="signup_to_num">
    		<h3>회원가입을 원하시면 휴대전화 인증을 진행해주세요</h3>
    		<div class="select">
    			<img src="resources/img/message.png">
    			<a href="signup_num.jsp">
    				<button>휴대전화 인증</button>
    			</a>
    		</div>
    	</div>
    </div>
    
    <%@ include file="../footer.jsp" %>
</body>
</html>