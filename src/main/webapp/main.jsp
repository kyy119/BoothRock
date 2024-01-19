<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/main.css" type="text/css">
    <script src="resources/js/main.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
        <div class="img-slide">
            <div class="slide-list" id="banner"></div> <!-- 축제 배너 데이터 들어가는 div 정렬은 찜 많은 순(인기순) -->
            <div class="banner-btn">
		        <button class="banner-prev-btn"><i class="fa-solid fa-chevron-left"></i></button>
		        <button class="banner-next-btn"><i class="fa-solid fa-chevron-right"></i></button>
	        </div>
	        <div class="dot">
		        <i id="img1" class="fa-solid fa-minus current-img"></i>
		        <i id="img2" class="fa-solid fa-minus"></i>
		        <i id="img3" class="fa-solid fa-minus"></i>
	        </div>
        </div>
        <div class="soon-fstv">
        	<h2>곧 끝나는 축제 <i class="fa-solid fa-calendar-days" style="color: #fbd037;"></i></h2>
        	<div class="multi-slide">
	            <div class="multi-slide-list" id="endlist"></div> <!-- 곧 끝나는 축제 들어가는 div -->
	        </div>
	        <button class="prev-btn"><i class="fa-solid fa-chevron-left"></i></button>
        	<button class="next-btn"><i class="fa-solid fa-chevron-right"></i></button>
        </div>
        <hr style="margin-top: 50px; border: 1px solid #ddd;">
        <div class="hot-booth">
        	<h2>요즘 뜨고 있는 부스 <i class="fa-solid fa-fire" style="color: #ce3b3b;"></i></h2>
        	<div class="hot-booth-list" id="boothup"></div> <!-- 요즘 뜨고 있는 부스 데이터 들어가는 div -->
        </div>
    </div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>
