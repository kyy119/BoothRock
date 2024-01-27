<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/cs_ask.css" type="text/css">
    <script src="resources/js/cs_ask.js" defer type="text/javascript"></script>
    <%
String userId = (String)session.getAttribute("id");
/* String userRole = "consumer"; */
%>
<!-- 세션 값을 JavaScript 변수에 할당 -->
<!-- 세션이 없다면 메인페이지로 이동 -->
<script type="text/javascript">
let userId = "<%=userId%>"; 
if (userId == "null") {
	alert("로그인이 필요합니다.");
	window.location.href = 'main.jsp';
}
</script>
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
					<option value="축제 문의">축제 문의</option>
					<option value="부스 문의">부스 문의</option>
					<option value="기타 문의">기타 문의</option>
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
