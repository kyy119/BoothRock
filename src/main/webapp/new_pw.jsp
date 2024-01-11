<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
	<link rel="stylesheet" href="resources/css/new_pw.css" type="text/css">
</head>
<body>

	<%@ include file="header.jsp" %>
	
	<div class="bodywrap">
	   	<div class="new-pw-form">
	   		<form class="input-form">
	   			<div>
	    			<label for="new-password">새 비밀번호</label>
					<input type="password" id="new-password" name="new-password" required>
	   			</div>
	   			<div>
	    			<label for="new-password2">새 비밀번호 확인</label>
					<input type="password" id="new-password2" name="new-password2" required>
	   			</div>
	   			<input type="submit" class="pw-edit" value="비밀번호 변경">
	   		</form>
	   	</div>
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>
