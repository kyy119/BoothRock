<%@page import="com.multi.FM.manager.ReportVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ReportVO vo = (ReportVO)request.getAttribute("vo"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report_detail.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
	<script>
    	$(document).ready(function() {
    		var report_no = <%= vo.getReport_no() %>;
	        function update_report(action, message) {
	            $.ajax({
	                type: "POST",
	                url: action,
	                data: { report_no: report_no },
	                success: function(data) {
	                    alert(message);
	                    window.location.href = 'report_list';
	                }
	            });
	        }

	        $(".report_lie").on("click", function() {
	        	update_report("update_report", "허위 신고 변경이 완료되었습니다.");
	        });
	    });
    </script>
</head>
<body>
    <%@ include file="../../../manager/admin_header.jsp" %>
    
    <div class="bodywrap">
		<div class="report-form">
			<h3 class="back">
				<a href="report_list">Report List <i class="fa-solid fa-chevron-right"></i></a>
			</h3>
			<div class="report-booth-fstv">
				<a href="../booth/booth_detail?booth_no=${vo.booth_no}" class="booth-title">${vo.booth_name}</a>
				<span> / <a href="../fstv/fstv_detail?fstv_no=${vo.fstv_no}">${vo.fstv_title}</a></span>
			</div>
			<div class="report-detail">
				<h2>${vo.report_title}</h2>
				<div class="report-info"><a class="user-id" href="user_detail?user_id=${vo.user_id}">${vo.user_id}</a> | ${vo.report_date}</div>
				<p class="report-content">${vo.report_comment}</p>
			<hr>
		   	</div>
        	<div class="btn">
        		<button onclick="location.href='user_detail?user_id=${vo.seller_id}'">판매자 상세 페이지</button>
        		<c:if test="${vo.report_lie == 0}">
        			<button class="report_lie">허위 신고 등록</button>
        		</c:if>
        		<c:if test="${vo.report_lie == 1}">
        			<button class="report_lie">허위 신고 등록 해제</button>
        		</c:if>
        	</div>
		</div>
    </div>
    
    <%@ include file="../../../footer.jsp" %>
    
</body>
</html>
