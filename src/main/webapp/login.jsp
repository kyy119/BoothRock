<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/login.css" type="text/css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
    	<div class="login-form">
    		<div class="input-form">
    			<form action="login" method="post">
		    		<label for="user_id">E-MAIL</label><br>
					<input type="email" id="user_id" name="user_id" placeholder="email@address.com" required><br>
		    		<label for="user_password">PASSWORD</label><br>
					<input type="password" id="user_password" name="user_password" placeholder="password" required>
		    		<input type="submit" class="login" value="로그인">
    			</form>
    		</div>
   			<div class="sub-btn">
            	<ul>
                    <li><a href="#" class="find-id">아이디 찾기</a></li>
                    <li>|</li>
                    <li><a href="#" class="find-pw">비밀번호 찾기</a></li>
                    <li>|</li>
                    <li><a href="signup_to_num.jsp" class="signup">회원가입</a></li>
                </ul>
   			</div>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
