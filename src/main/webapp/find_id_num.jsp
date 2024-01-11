<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/find_id_num.css" type="text/css">
</head>
<body>
	<%@ include file="header.jsp" %>

	<div class="bodywrap">
	   	<div class="find-id-form">
	   		<form action = "find_id" class="input-form" method="post">
	   			<div>
	    			<label for="user_name">이름</label>
					<input type="text" id="user_name" name="user_name" required>
	   			</div>
	   			<div>
	    			<label for="user_tel">전화번호</label>
					<input type="text" id="user_tel" name="user_tel" required>
	   			</div>
	   			<input type="submit" class="id-find" value="아이디 찾기">
	   		</form>
	   	</div>
   	</div>
   	
   	<%@ include file="footer.jsp" %>
</body>
</html>