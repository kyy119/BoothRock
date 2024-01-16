<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/fstv_map.css" type="text/css">
    <script src="resources/js/fstv_map.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
	    <div class="fstv-map-form">
		    <div class="fstv-map">
	    		<h1>전국축제지도</h1>
		    	<img alt="지도" src="resources/img/map.jpg">
		    </div>
	        <div class="fstv-list-form"> <%-- 페이징 필요 --%>
	        	<div class="fstv-list-loc">
					<h2><i class="fa-solid fa-location-dot"></i> 서울</h2>
		        	<div class="sort">
		        		<button id="def-btn" class="bold-text">기본순</button> | <button id="pop-btn">인기순</button>
		        	</div>
	        	</div>
	        	<div class="fstv-list"></div> <!-- 지역별 축제 리스트 들어가는 부분 -->
	        </div>
	    </div>
    </div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>
