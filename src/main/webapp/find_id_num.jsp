<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
	<style>
		.find-id-form {
			width: 380px;
			height: 265px;
			border: 1px solid #000;
			border-radius: 15px;
		}
		.input-form {
			width: 320px;
			height: 165px;
			margin: 50px 30px;
			text-align: center;
		}
		.input-form div {
			height: 35px;
			margin: 20px 0px;
		}
		.input-form div label {
			font-weight: bold;
			line-height: 35px;
			float: left;
			text-align: center;
			width: 140px;
		}
		.input-form div input {
			width: 150px;
			height: 35px;
			border: 1px solid #000;
			background-color: #fff;
			border-radius: 15px;
			font-weight: bold;
			float: left;
			padding: 0px 10px;
			text-align: center;
		}
		.id-find {
			width: 120px;
			height: 40px;
			border: 1px solid #000;
			background-color: #fff;
			border-radius: 15px;
			font-weight: bold;
			text-align: center;
			margin-top: 15px;
			font-size: 15px;
		}
		.id-find:hover {
			background-color: #ddd;
		}
	</style>
</head>
<body>
	<%@ include file="header.jsp" %>

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
   	
   	<%@ include file="footer.jsp" %>
</body>
</html>