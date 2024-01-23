<%@page import="com.multi.FM.manager.ReportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ReportVO vo = (ReportVO)request.getAttribute("report_detail"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report_detail.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
    <%@ include file="../../../manager/admin_header.jsp" %>
    
    <div class="bodywrap">
		<div class="report-form">
			<h3 class="back">
				<a href="report_list">Report List <i class="fa-solid fa-chevron-right"></i></a>
			</h3>
			<div class="report-booth-fstv">
				<a href="booth_detail?booth_no=<%= vo.getBooth_no() %>" class="booth-title"><%= vo.getBooth_name() %></a>
				<span> / <a href="fstv_detail?fstv_no=<%= vo.getFstv_no() %>"><%= vo.getFstv_title() %></a></span>
			</div>
			<div class="report-detail">
				<h2><%= vo.getReport_title() %></h2>
				<div class="report-info"><%= vo.getUser_id() %> | <%= vo.getReport_date() %></div>
				<p class="report-content"><%= vo.getReport_comment() %></p>
			<hr>
		   	</div>
        	<div class="btn">
        		<button>판매자 상세 페이지</button>
        		<button>허위 신고 등록</button>
        		<button>부스 신고 누적</button>
        	</div>
		</div>
    </div>
    
    <%@ include file="../../../footer.jsp" %>
    
</body>
</html>
