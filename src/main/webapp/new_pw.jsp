<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
	<style>
		.new-pw-form {
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
		.input-form div button {
			width: 62px;
			height: 35px;
			float: right;
			border-radius: 15px;
			border: 1px solid #808080;
			color: #808080;
			background-color: #fff;
			font-weight: 600;
		}
		.input-form div button:hover {
			background-color: #ddd;
		}
		.pw-edit {
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
		.pw-edit:hover {
			background-color: #ddd;
		}
	</style>
</head>
<body>
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
</body>
</html>
