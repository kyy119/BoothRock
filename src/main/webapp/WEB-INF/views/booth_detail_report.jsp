<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.multi.FM.report.BoothReportVO"%>
<% BoothReportVO boothDetailReport = (BoothReportVO) request.getAttribute("boothDetailReport"); %>


<div class="booth-info">
	    		<h2><%= boothDetailReport.getBooth_name() %></h2>
		    	<span> / <%= boothDetailReport.getFstv_title() %></span>
		    </div>