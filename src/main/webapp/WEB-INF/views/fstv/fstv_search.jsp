<%@page import="com.multi.FM.fstv.FestivalVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String q = (String)request.getAttribute("q");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fstv_search.css" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/js/fstv_search.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="../../../header.jsp" %>
    <div class="bodywrap">
	    <div class="search-form">
	    	<div class="search-head">
	    		<h1>'${q}'</h1>
	    		<h2>검색 결과 <i class="fa-solid fa-magnifying-glass"></i></h2>
	    	</div>
	         <div class="search-fstv-list">
	        	<h3><i class="fa-solid fa-chevron-left"></i> 축제 <i class="fa-solid fa-chevron-right"></i></h3>
		        <ul>
					<c:forEach items="${list}" var="vo">
						<li>
		                    <a href="fstv_detail?fstv_no=${vo.fstv_no}">
		                        <img src="${vo.fstv_image}" alt="이미지1">
		                        <div class="search-fstv-info">
			                        <div class="fstv-title">${vo.fstv_title}</div>
			                        <div class="fstv-loc">${vo.fstv_banneraddr}</div>
			                        <div class="fstv-date">${vo.fstv_startdate} ~ ${vo.fstv_enddate}</div>
			                        <p>${vo.fstv_eventinfo}</p>
		                        </div>
		                    </a>
		                </li>  
					</c:forEach>
				</ul>
	        </div>
	    </div>
    </div>
	
	<%@ include file="../../../footer.jsp" %>

</body>
</html>


