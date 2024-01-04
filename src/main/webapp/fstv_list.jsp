<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/fstv_list.css" type="text/css">
    <script src="resources/js/fstv_list.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
	    <div class="fstv-list-form">
	    	<div class="fstv-list-head">
	    		<h1>축제리스트</h1>
		        <div class="sort">
		        	<button id="def-btn" class="bold-text">기본순</button> | <button id="pop-btn">인기순</button>
		        </div>
		    </div>
	        <div class="fstv-list"> <%-- 페이징 필요 --%>
	            <ul>
	                <li>
	                	<i class="fa-regular fa-heart"></i>
	                    <a href="fstv_detail.jsp">
	                        <img src="resources/img/청계천.jpg" alt="이미지1">
	                        <div class="fstv-title">겨울, 청계천의 빛</div>
	                        <div class="fstv-loc">서울 중구</div>
	                        <div class="fstv-date">2023.12.15 ~ 2023.12.31</div>
	                    </a>
	                </li>  
	                <li>
	                	<i class="fa-regular fa-heart"></i>
	                    <a href="#">
	                        <img src="resources/img/광화문.png" alt="이미지2">
	                        <div class="fstv-title">광화문광장 마켓</div>
	                        <div class="fstv-loc">서울 종로구</div>
	                        <div class="fstv-date">2023.12.15 ~ 2024.01.21</div>
	                    </a>
	                </li>
	                <li>
	                	<i class="fa-regular fa-heart"></i>
	                    <a href="#">   
	                        <img src="resources/img/금리단.jpg" alt="이미지3">
	                        <div class="fstv-title">금리단아트페스타</div>
	                        <div class="fstv-loc">경상북도 경주시</div>
	                        <div class="fstv-date">2023.12.15 ~ 2023.12.16</div>
	                    </a>     
	                </li>
	                <li>
	                	<i class="fa-regular fa-heart"></i>
	                    <a href="#">
	                        <img src="resources/img/빛초롱.jpg" alt="이미지1">
	                        <div class="fstv-title">서울 빛초롱 축제</div>
	                        <div class="fstv-loc">서울 종로구</div>
	                        <div class="fstv-date">2023.12.15 ~ 2024.01.21</div>
	                    </a>
	                </li>  
	                <li>
	                	<i class="fa-regular fa-heart"></i>
	                    <a href="#">
	                        <img src="resources/img/송현동.jpg" alt="이미지2">
	                        <div class="fstv-title">송현동 솔빛축제</div>
	                        <div class="fstv-loc">서울 종로구</div>
	                        <div class="fstv-date">2023.12.15 ~ 2024.01.21</div>
	                    </a>
	                </li>
	                <li>
	                	<i class="fa-regular fa-heart"></i>
	                    <a href="#">   
	                        <img src="resources/img/고호재.jpg" alt="이미지3">
	                        <div class="fstv-title">한국의집 고호재</div>
	                        <div class="fstv-loc">서울 중구</div>
	                        <div class="fstv-date">2023.12.12 ~ 2024.02.29</div>
	                    </a>     
	                </li>
	                <li>
	                	<i class="fa-regular fa-heart"></i>
	                    <a href="fstv_detail.jsp">
	                        <img src="resources/img/청계천.jpg" alt="이미지1">
	                        <div class="fstv-title">겨울, 청계천의 빛</div>
	                        <div class="fstv-loc">서울 중구</div>
	                        <div class="fstv-date">2023.12.15 ~ 2023.12.31</div>
	                    </a>
	                </li> 
	            </ul>
	        </div>
	    </div>
    </div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>
