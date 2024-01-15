<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/search_page.css" type="text/css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
	    <div class="search-form">
	    	<div class="search-head">
	    		<h1>'산수유'</h1>
	    		<h2>검색 결과 <i class="fa-solid fa-magnifying-glass"></i></h2>
	    	</div>
	        <div class="search-fstv-list">
	        	<h3><i class="fa-solid fa-chevron-left"></i> 축제 <i class="fa-solid fa-chevron-right"></i></h3>
	            <ul>
	                <li>
	                	<i class="fa-regular fa-heart"></i>
	                    <a href="fstv_detail.jsp">
	                        <img src="resources/img/빙어축제.jpg" alt="이미지1">
	                        <div class="search-fstv-info">
		                        <div class="fstv-title">양평 산수유마을 빙어축제</div>
		                        <div class="fstv-loc">경기도 양평군</div>
		                        <div class="fstv-date">2023.12.23 ~ 2024.02.04</div>
		                        <p>제6회 양평 산수유마을 빙어축제를 개최한다. 서울에서 1시간 거리에 위치하며 6만여평의 아름답고 광활한 저수지 위에서 축제가 펼쳐진다. 꽁꽁 얼어 있는 저수지 위에 올라 구멍을 뚫어 빙어낚시를 즐길 수 있고 도시에서는 경험하기 힘든 추억의 얼음썰매까지 가족과 함께 추억을 담을 수 있다. 또한 수족관에서의 빙어뜰채체험 및 다양한 따뜻한 먹거리(빙어튀김, 어묵, 순대, 떡볶이 등)들이 준비되어 있다.</p>
	                        </div>
	                    </a>
	                </li>  
	                <li>
	                	<i class="fa-regular fa-heart"></i>
	                    <a href="#">
	                        <img src="resources/img/한우축제.jpg" alt="이미지2">
	                        <div class="search-fstv-info">
		                        <div class="fstv-title">양평산수유한우축제</div>
		                        <div class="fstv-loc">경기도 양평군</div>
		                        <div class="fstv-date">2023.04.01 ~ 2023.04.02</div>
		                        <p>4년만에 개최되는 양평산수유한우축제는 양평의 대표 봄꽃축제로 아름다운 산수유꽃과 질좋은 양평한우가 있는 개군면에서 개최되는 축제이다.
수령100년 이상의 산수유나무가 군락을 이루고 있는 내리, 향리, 주읍리 마을 일대와 개군레포츠공원에서 개최되는 이번 축제는 이색 호박터널, 산수유꽃터널, 요리조리 송어잡기 체험 등 다양한 볼거리와 한우식당 및 다양한 먹거리장터로 구성되어 있어 행사장을 찾는 관광객에게 다양한 즐길거리와 먹거리를 제공할 예정이다.</p>
	                        </div>
	                    </a>
	                </li>
	                <li>
	                	<i class="fa-regular fa-heart"></i>
	                    <a href="#">
	                        <img src="resources/img/꽃축제.jpg" alt="이미지2">
	                        <div class="search-fstv-info">
		                        <div class="fstv-title">구례산수유꽃축제</div>
		                        <div class="fstv-loc">전라남도 구례군</div>
		                        <div class="fstv-date">2023.03.11 ~ 2023.03.19</div>
		                        <p>새봄의 정취를 느낄 수 있는 대한민국 대표 봄꽃축제이다. 산수유꽃은 3월에 다른 꽃보다 먼저 개회해 봄소식을 전한다. 3월 11일부터 3월 19일까지 개최하며 3월 15일 전후로 산수유꽃이 만개할 것으로 예상한다. 산수유꽃말인 ‘영원불변의 사랑’을 주제로 다양한 체험프로그램과 음악회가 개최된다.</p>
	                        </div>
	                    </a>
	                </li>
	            </ul>
	        </div>
	        <hr>
	        <div class="search-booth-list">
	        	<h3><i class="fa-solid fa-chevron-left"></i> 부스 <i class="fa-solid fa-chevron-right"></i></h3>
	            <ul>
	                <li>
	                    <a href="#">   
	                        <img src="resources/img/떡볶이.jpg" alt="이미지3">
	                        <div class="search-booth-info">
		                        <div class="booth-title">산수유 떡볶이</div>
		                        <span class="fstv-title">/ 양평 산수유마을 빙어축제</span>
		                        <div class="fstv-loc">경상북도 경주시</div>
		                        <div class="booth-type">판매형</div>
								<p class="booth-intro">
		                           산수유 마을 빙어축제에서 빙어 떡볶이를 맛보세요! 엄청 특별한 맛, 보장합니다.
	                            </p>
		                    </div>
	                    </a>     
	                </li>
	            </ul>
	        </div>
	    </div>
    </div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>