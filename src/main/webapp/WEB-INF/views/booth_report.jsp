<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.multi.FM.report.BoothReportVO"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<% 

HttpSession reportSession = request.getSession(); 
BoothReportVO DuplicateTrue = (BoothReportVO)request.getAttribute("DuplicateTrue");

%>
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/booth_report.css" type="text/css"> 
      <script src="resources/js/booth_detail.js?ver=01151712" defer
	type="text/javascript"></script>
      
<script>
    var showAlert = <%= session.getAttribute("showAlert") %> ;
		if (showAlert) {
		    alert("이미 신고하신 부스입니다");
		   	window.history.back();
		}
</script>
      
</head>
<body>
    <%@ include file="../../header.jsp" %>
    
    <div class="bodywrap">
    	<div class="booth-report-form">
	    	<h1>신고하기</h1>
	    	<br><hr class="shadow"><br>
	    	<div class="booth_detail_report"></div>
		    <form action="insertReport" method="post">
		    	<div class="report-form">
		    	    <input type="hidden" name="booth_no" value="<%= request.getAttribute("booth_no")%>">
		    	    <input type="hidden" name="user_id" value="<%= reportSession.getAttribute("id")%>">
	                
	                <input type="text" name="report_title" class="report-title" placeholder="제목을 입력해주세요.">
	                <textarea name="report_comment" class="report-content" placeholder="신고 내용을 입력해주세요."></textarea>
	                <a href="main.jsp" class="back">취소</a>
	                <input type="submit" class="report-submit" value="제출">
	            </div>
            </form>
    	</div>
    </div>
    
    <%@ include file="../../footer.jsp" %>
    
</body>
</html>
