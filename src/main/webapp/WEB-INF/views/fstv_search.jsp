<%@page import="com.multi.FM.fstv.FestivalVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String q = (String)request.getAttribute("q");
    	List<FestivalVO> list = (List<FestivalVO>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/fstv_list.css" type="text/css">
    <script src="resources/js/fstv_search.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="../../header.jsp" %>
    <div class="bodywrap">
	    <div class="fstv-list-form">
	    	<div class="fstv-list-head">
	    		<span>'${q}'</span>에 대한 검색결과</h1>
	    		<font size="40px" ="lightblue">'${q}</font>
		    </div>
	        <div class="fstv-search" id="list"></div> <!-- 축제 리스트 받아오는 div -->
	    </div>
    </div>
	
	<%@ include file="../../footer.jsp" %>

</body>
</html>
