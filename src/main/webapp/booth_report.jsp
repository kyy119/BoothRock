<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/booth_report.css" type="text/css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
    	<div class="booth-report-form">
	    	<h1>신고하기</h1>
	    	<br><hr class="shadow"><br>
	    	<div class="booth-info">
	    		<h2>삼촌네 떡볶이</h2>
		    	<span> / 서울 광장시장</span>
		    </div>
	    	<div class="report-form">
                <input type="text" class="report-title" placeholder="제목을 입력해주세요.">
                <textarea class="report-content" placeholder="신고 내용을 입력해주세요."></textarea>
                <a href="main.jsp" class="back">취소</a>
                <input type="submit" class="report-submit" value="제출">
            </div>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
