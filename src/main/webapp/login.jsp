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
    		<h1 style="font-weight: 500; text-align: left;">로그인</h1>
		    <hr>
    		<div class="input-form">
    			<form action="login" method="post">
    				<input type="hidden" name ="referer" value = "<%= request.getHeader("Referer") %>">
    				<div>
    					<i class="fa-regular fa-user"></i>
						<input type="email" id="user_id" name="user_id" placeholder="이메일" required>
					</div>
					<div>
						<i class="fa-solid fa-unlock-keyhole"></i>
						<input type="password" id="user_password" name="user_password" placeholder="비밀번호" required>
					</div>
		    		<input type="submit" class="login" value="로그인">
    			</form>
    		</div>
   			<div class="sub-btn">
            	<ul>
                    <li><a href="find_id_num.jsp" class="find-id">아이디 찾기</a></li>
                    <li>|</li>
                    <li><a href="find_password_num.jsp" class="find-pw">비밀번호 찾기</a></li>
                    <li>|</li>
                    <li><a href="signup_num.jsp" class="signup">회원가입</a></li>
                </ul>
   			</div>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
