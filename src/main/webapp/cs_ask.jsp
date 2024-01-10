<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/cs_ask.css" type="text/css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
    	<div class="cs-ask-form">
	    	<h1>문의하기</h1>
	    	<br><hr class="shadow"><br>
	    	<div class="ask-form">
                <input type="text" class="ask-title" placeholder="제목을 입력해주세요.">
                <select id="ask-type" name="ask-type">
					<option value="fstv-ask">축제 문의</option>
					<option value="booth-ask">부스 문의</option>
					<option value="other-ask">기타 문의</option>
			    </select>
                <textarea class="ask-content" placeholder="문의 내용을 입력해주세요."></textarea>
                <a href="main.jsp" class="back">취소</a>
                <input type="submit" class="ask-submit" value="제출">
            </div>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
