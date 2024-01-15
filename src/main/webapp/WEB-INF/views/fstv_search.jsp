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
    <link rel="stylesheet" href="resources/css/fstv_search.css" type="text/css">
    <link rel="stylesheet" href="resources/css/fstv_list.css" type="text/css">
    <script src="resources/js/fstv_search.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="../../header.jsp" %>
    <div class="bodywrap">
	    <div class="fstv-list-form">
	    	<div class="fstv-list-head">
	    		<span class="search-data">'${q}'</span><span class="search-res"> 에 대한 검색결과</span>
		    </div>
	        <div class="fstv-list" id="list">
		        <ul>
					<c:forEach items="${list}" var="vo">
						<li><i class="fa-regular fa-heart"></i>
							<a href="fstv_detail?fstv_no=${vo.fstv_no}">
								<img src="${vo.fstv_image}" alt="resources/img/no-image.jpg">
								<div class="fstv-title">${vo.fstv_title}</div>
								<div class="fstv-loc">${vo.fstv_banneraddr}</div>
								<div class="fstv-date">${vo.fstv_startdate} ~ ${vo.fstv_enddate}</div>
							</a>
						</li>
					</c:forEach>
				</ul>
	        </div> <!-- 축제 리스트 받아오는 div -->
	    </div>
    </div>
	
	<%@ include file="../../footer.jsp" %>

</body>
</html>
