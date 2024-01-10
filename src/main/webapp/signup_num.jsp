<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모든 축제의 부스를 담다 - 부스락</title>
<link rel="stylesheet" href="resources/css/signup2.css" type="text/css">
<script src="resources/js/signup_num.js" defer type="text/javascript"></script>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="bodywrap" style="height: 430px; display: flex; align-items: center; justify-content: center;">
		<div class="signup-form">
			<form action="signup_type.jsp" class="input-form" method="post">
				<div>
					<label for="phone_number">전화번호</label> <input type="text" id="phone_number"
						name="phone_number" maxlength="11" required>
					<button id="send">인증번호</button>
				</div>
				<div id="authNum"></div>
			</form>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>