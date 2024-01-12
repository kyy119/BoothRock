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
	    <div class="fstv-map-from">
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
	        	<div class="fstv-list">
		            <ul>
		                <li>
		                	<i class="fa-regular fa-heart"></i>
		                    <a href="fstv_detail.jsp">
		                        <img src="resources/img/청계천.jpg" alt="이미지1">
		                        <span class="fstv-title">겨울, 청계천의 빛</span><br>
		                        <span class="fstv-loc">서울 중구</span><br>
		                        <span class="fstv-date">2023.12.15 ~ 2023.12.31</span>
		                    </a>
		                </li>  
		                <li>
		                	<i class="fa-regular fa-heart"></i>
		                    <a href="#">
		                        <img src="resources/img/광화문.png" alt="이미지2">
		                        <span class="fstv-title">광화문광장 마켓</span><br>
		                        <span class="fstv-loc">서울 종로구</span><br>
		                        <span class="fstv-date">2023.12.15 ~ 2024.01.21</span>
		                    </a>
		                </li>
		                <li>
		                	<i class="fa-regular fa-heart"></i>
		                    <a href="#">
		                        <img src="resources/img/빛초롱.jpg" alt="이미지1">
		                        <span class="fstv-title">서울 빛초롱 축제</span><br>
		                        <span class="fstv-loc">서울 종로구</span><br>
		                        <span class="fstv-date">2023.12.15 ~ 2024.01.21</span>
		                    </a>
		                </li>  
		                <li>
		                	<i class="fa-regular fa-heart"></i>
		                    <a href="#">
		                        <img src="resources/img/송현동.jpg" alt="이미지2">
		                        <span class="fstv-title">송현동 솔빛축제</span><br>
		                        <span class="fstv-loc">서울 종로구</span><br>
		                        <span class="fstv-date">2023.12.15 ~ 2024.01.21</span>
		                    </a>
		                </li>
		                <li>
		                	<i class="fa-regular fa-heart"></i>
		                    <a href="#">   
		                        <img src="resources/img/고호재.jpg" alt="이미지3">
		                        <span class="fstv-title">한국의집 고호재</span><br>
		                        <span class="fstv-loc">서울 중구</span><br>
		                        <span class="fstv-date">2023.12.12 ~ 2024.02.29</span>
		                    </a>     
		                </li>
		            </ul>
		         </div>
	        </div>
	    </div>
    </div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>
