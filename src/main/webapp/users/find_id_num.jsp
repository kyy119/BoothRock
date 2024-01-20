<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup_num.css" type="text/css">
</head>
<body>
	<%@ include file="../header.jsp" %>

	<div class="bodywrap" style="margin: 200px 0px 330px;">
		<h3>가입한 회원정보를 입력해주세요</h3>
	   	<div class="signup-form">
	   		<form action = "find_id" class="input-form" method="post">
	   			<div>
	   				<i class="fa-regular fa-user"></i>
					<input type="text" id="user_name" name="user_name" placeholder="이름" required>
	   			</div>
	   			<div>
	   				<i class="fa-solid fa-mobile-screen"></i>
					<input type="text" id="user_tel" name="user_tel" placeholder="전화번호" required>
	   			</div>
	   			<input type="submit" class="pw-edit" value="아이디 찾기">
	   		</form>
	   	</div>
   	</div>
   	
   	<%@ include file="../footer.jsp" %>
</body>
</html>