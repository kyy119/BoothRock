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
        	<div class="hot-booth-list">
                <ul>
                    <li>
                        <a href="booth_detail.jsp">
	                        <div><i class="fa-solid fa-heart"></i></div>
                            <div class="booth-title">삼촌네 떡볶이</div>
                           	<div class="star-point">
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
							</div>
                            <div class="fstv-title">서울광장시장 축제</div>
                            <hr>
                            <p class="booth-comment">서울 광장시장에 위치한 30년 전통 맛있는 떡볶이입니다~ 많이 찾아주세요</p>
                        </a>
                    </li>  
                    <li>
                        <a href="#" style="height: auto;">
	                        <div><i class="fa-solid fa-heart"></i></div>
                            <div class="booth-title">민지만쥬</div>
                           	<div class="star-point">
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-regular fa-star"></i>
							</div>
                            <div class="fstv-title">속초 태양빛 축제</div>
							<hr>
                            <p class="booth-comment">만쥬 존맛탱 전화로 미리 문의 주세욤</p>
                        </a>
                    </li>  
                    <li>
                        <a href="#">
	                        <div><i class="fa-solid fa-heart"></i></div>
                            <div class="booth-title">임실 치즈 만들기 체험</div>
                           	<div class="star-point">
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-regular fa-star"></i>
							</div>
                            <div class="fstv-title">임실 치즈 축제</div>
                            <hr>
                            <p class="booth-comment">치즈 만들어서 먹으면 얼마나 맛있게요</p>
                        </a>
                    </li>  
                    <li>
                        <a href="#">
	                        <div><i class="fa-solid fa-heart"></i></div>
	                        <div class="booth-title">GRILLED STEAK</div>
                            <div class="star-point">
                            	<i class="fa-solid fa-star"></i>
                            	<i class="fa-solid fa-star"></i>
                            	<i class="fa-solid fa-star"></i>
                            	<i class="fa-solid fa-star"></i>
                            	<i class="fa-solid fa-star"></i>                            	
                            </div>
                            <div class="fstv-title">만수천 빛의거리</div>
                            <hr>
                            <p class="booth-comment">어떤 호텔 셰프였던 사장님이 운영하는 그릴스테이크집입니다. 최고의 고기로 보답하겠습니다.</p>
                        </a>
                    </li>
                </ul>
	        </div>
        </div>
    </div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>
