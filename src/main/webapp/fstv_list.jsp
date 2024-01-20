<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fstv_list.css" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/js/fstv_list.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="../header.jsp" %>
    <div class="bodywrap">
	    <div class="fstv-list-form">
	    	<div class="fstv-list-head">
	    		<h1>축제리스트</h1>
	    		<div class="date-search">
		    		<form id="dateform">
		    		<!-- date값을 받아들여 검색하는 기능 -->
		    			<input type="date" id="date1" name="date1"> ~ <input type="date" id="date2" name="date2">
		    			<input type="submit" value="검색" style="height: 28px; margin: 0px 5px;">
		    		</form>
	    		</div>
		        <div class="sort">
		        	<button id="def-btn" class="bold-text">기본순</button> | <button id="pop-btn">인기순</button>
		        </div>
		    </div>
	        <div class="fstv-list" id="list"></div> <!-- 축제 리스트 받아오는 div -->
	    </div>
    </div>
	
	<%@ include file="../footer.jsp" %>

</body>
</html>
