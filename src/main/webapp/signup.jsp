<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
    String phone_number = (String)request.getParameter("phone_number");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/signup.css" type="text/css">
    <script src="resources/js/signup.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
    	<div class="signup-form">
    		<form action = "create_account_consumer" class="input-form" method="post">
    			<div>
	    			<label for="user_id">이메일</label>
					<input type="email" id="user_id" name="user_id" required>
					<button id= "emailConfirm">중복확인</button>
    			</div>
    			<div id="password_box">
	    			<label for="user_password">비밀번호</label>
					<input type="password" id="user_password" name="user_password" placeholder="비밀번호는 8자리 이상," required>
    				<output id="passwordMessage" style="color: red; font-size : 10px;"></output>
    			</div>
    			<div id="password_box2">
	    			<label for="user_password2">비밀번호 확인</label>
					<input type="password" id="user_password2" name="user_password2" required>
    			</div>
    			<div>
	    			<label for="user_name">이름</label>
	    			<input type="text" id="user_name" name="user_name" required>
    			</div>
    			<div>
	    			<label for="user_tel">전화번호</label>
	    			<input type="text" id="user_tel" name="user_tel" value="<%= phone_number %>" readonly>
    			</div>
    				<input type="checkbox" id="seller-check" name="seller-check">
    				<label for="seller-check" style="font-size: 15px;">판매자입니다.</label><br>
    			<div class="seller-number">
    			</div>
    			<input type="submit" class="signup" value="회원가입">
    		</form>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
