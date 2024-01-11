<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/user_edit.css" type="text/css">
</head>
<body>
    <%@ include file="admin_header.jsp" %>
    
    <div class="bodywrap">
	    <div class="user-edit-form">
		    <h1>회원정보수정</h1>
	    	<div class="edit-form">
	    		<form class="input-form">
	    			<div>
		    			<label for="email">이메일</label>	<%-- 변경 불가 --%>
						<input type="email" id="email" name="email" placeholder="email@adress.com" required>
	    			</div>
	    			<div>
		    			<label for="password">비밀번호</label>
						<input type="password" id="password" name="password" placeholder="12345678" required>
	    			</div>
	    			<div>
		    			<label for="name">이름</label>
		    			<input type="text" id="name" name="name" placeholder="부스락" required>
	    			</div>
	    			<div>
		    			<label for="password2">비밀번호 확인</label>
						<input type="password" id="password2" name="password2" placeholder="12345678" required>
	    			</div>
	    			<div>
		    			<label for="tel">전화번호</label>
		    			<input type="text" id="tel" name="tel" placeholder="010-5706-2307" required>
		    		</div>
		    		<div class="seller-number">
		    			<label for="seller-number">사업자번호</label>
		    			<input type="text" id="seller-number" name="seller-number" placeholder="000-00-00000">
	    			</div>
	    			<div class="btn">
		    			<a href="user_list.jsp">취소</a>
		    			<input type="submit" class="edit" value="완료">
	    			</div>
	    		</form>
	    	</div>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
