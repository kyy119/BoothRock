<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/fstv_detail.css" type="text/css">
    <script src="resources/js/fstv_detail.js" defer type="text/javascript"></script>
    <script src="resources/js/fstv_list.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
    	<div class="fstv-detail-form">
	    	<div class="fstv-title">
	    		<h1 style="display: inline-block">겨울, 청계천의 빛</h1>
	    		<i id="jjim" class="fa-regular fa-heart"></i><br>
	    		<span class="fstv-date">2023.12.15 ~ 2023.12.31</span>
		    </div>
	        <div class="fstv-detail-form">
	        	<h3>
	        		<i class="fa-solid fa-chevron-left"></i>
	        			축제 개요
	        		<i class="fa-solid fa-chevron-right"></i>	
	        	</h3>
	            <p class="info-text">올해로 9회째를 맞는 '2023 겨울, 청계천의 빛'이 12월 15일부터 31일까지 청계과장광장에서 모전교 구간에서 열린다. 푸른 별 지구의 모습을 블루 앤 화이트로 연출한 대형 트리, 사랑스러운 하얀 북극곰과 빙산 트러스 장식, 광장을 장식한 동그란 얼음 조각과 얼음 터널 등 지구온난화로 전 세계가 어려움을 겪는 가운데 아름답고 행복한 지구를 만들자는 소망을 빛으로 담았다.</p>
	            <p class="info-cont">
	            	[행사내용]<br>
					1.메인광장<br>
					연말을 느낄 수 있는 크리스마스 조명 연출에서 벗어나 기후변화에 대한 이야기를 담아 북극곰과 함께 크리스마스를 연출했다.<br>
					2.분수대 방향<br>
					포토존과 함께 작은 크리스마스 트리 사이로 숨어있는 루돌프로 방문객들에게 즐거운 공간을 연출했다.<br>
					3.분수대<br>
					대형벌룬과 작은 하트, LED볼조명을 설치하여 낭만적인 분위기로 연출했다.<br>
					4.모전교<br>
					벽면에 날개와 무지개, 종이비행기 조명을 설치해 청계천을 찾는 방문객에게 빛나는 희망과 비상을 선물한다.
				</p>
				<button class="more">더보기</button><br>
	        	<hr>
	        	<div style="width: 1000px; height: 350px; text-align: center;">
	        		<div class="fstv-img">
	        			<img alt="페스티벌 이미지" src="resources/img/청계천포스터.jpg">
	        		</div>
	        		<div class="fstv-info">
	        			<div>
	        				<i class="fa-solid fa-calendar-days" style="color: #ff8080;"></i>
	        				2023.12.15 ~ 2023.12.31
	        			</div>
	        			<div>
	        				<i class="fa-solid fa-map-location-dot" style="color: #00aa00;"></i>
	        				서울 중구 태평로1가 1
	        			</div>
	        			<div>
	        				<i class="fa-solid fa-location-dot" style="color: #0080ff;"></i>
	        				청계천 일대
	        			</div>
	        			<div>
	        				<i class="fa-solid fa-clock" style="color: #ff8040;"></i>
	        				정보없음
	        			</div>
	        			<div>
	        				<i class="fa-solid fa-coins" style="color: #fbd037;"></i>
	        				무료<br> (캠핑: 홈페이지 사전 접수 / 일반 : 당일 무료 입장)
	        			</div>
	        			<div>
	        				<i class="fa-solid fa-headset" style="color: #004080;"></i>
	        				02-904-1159
	        			</div>
	        			<a href="#"><i class="fa-regular fa-paper-plane"></i> 공식 홈페이지</a>
	        		</div>
	        	</div>
	        	<hr>
	        	<div class="fstv_loc">
	        		<h3>
		        		<i class="fa-solid fa-chevron-left"></i>
		        			찾아오는 길
		        		<i class="fa-solid fa-chevron-right"></i>
	        		</h3>
	        		<div class="fstv-map">
	        			<img alt="카카오맵" src="resources/img/카카오맵.png">
	        		</div>
	        	</div>
	        	<hr>
	        	<div class="booth-form">
	        		<h3>
	        			<i class="fa-solid fa-chevron-left"></i>
		        			진행 부스
		        		<i class="fa-solid fa-chevron-right"></i>
	        		</h3>
        			<div class="sort">
        				<button id="def-btn" class="bold-text">기본순</button> | <button id="pop-btn">인기순</button>
        			</div>
	        		<div class="booth-list">		<%-- 페이징 필요 --%>
						<ul>			<%-- ul이 반복되어야 css가 적용됨 --%>
			                <li>
			                    <a href="booth_detail.jsp">
			                        <img src="resources/img/판매형.jpg" alt="이미지1">
			                        <div class="booth-title">삼촌네 떡볶이</div>
									<div class="booth-type">판매형</div>
			                        <div>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</div>
			                    </a>
			                </li>  
			                <li>
			                    <a href="#">
			                        <img src="resources/img/판매형.jpg" alt="이미지1">
			                        <div class="booth-title">민지만쥬</div>
									<div class="booth-type">판매형</div>
			                        <div>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-regular fa-star"></i>
									</div>
			                    </a>
			                </li>  
			                <li>
			                    <a href="#">
			                        <img src="resources/img/체험형.jpg" alt="이미지1">
			                        <div class="booth-title">임실 치즈 만들기 체험</div>
									<div class="booth-type">체험형</div>
			                        <div>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-regular fa-star"></i>
									</div>
			                    </a>
			                </li>
			                <li>
			                    <a href="#">
			                        <img src="resources/img/판매형.jpg" alt="이미지1">
			                        <div class="booth-title">GRILLED STEAK</div>
									<div class="booth-type">판매형</div>
			                        <div>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</div>
			                    </a>
			                </li>
			            </ul>
						<ul>
			                <li>
			                    <a href="#">
			                        <img src="resources/img/체험형.jpg" alt="이미지1">
			                        <div class="booth-title">임실 치즈 만들기 체험</div>
									<div class="booth-type">체험형</div>
			                        <div>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-regular fa-star"></i>
									</div>
			                    </a>
			                </li>
			                <li>
			                    <a href="booth_detail.jsp">
			                        <img src="resources/img/판매형.jpg" alt="이미지1">
			                        <div class="booth-title">삼촌네 떡볶이</div>
									<div class="booth-type">판매형</div>
			                        <div>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</div>
			                    </a>
			                </li>  
			                <li>
			                    <a href="#">
			                        <img src="resources/img/판매형.jpg" alt="이미지1">
			                        <div class="booth-title">민지만쥬</div>
									<div class="booth-type">판매형</div>
			                        <div>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-regular fa-star"></i>
									</div>
			                    </a>
			                </li>  
			                <li>
			                    <a href="#">
			                        <img src="resources/img/판매형.jpg" alt="이미지1">
			                        <div class="booth-title">GRILLED STEAK</div>
									<div class="booth-type">판매형</div>
			                        <div>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</div>
			                    </a>
			                </li>
			            </ul>
	        		</div>
	        	</div>
	        </div>
        </div>
    </div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>
