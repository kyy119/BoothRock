<%@page import="com.multi.FM.fstv.FestivalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% FestivalVO vo = (FestivalVO)request.getAttribute("vo"); %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
	<link rel="stylesheet" href="resources/css/fstv_detail.css" type="text/css">
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d62465477800fd8e2ab405f313773a8c"></script>
	<script src="resources/js/fstv_detail.js" defer type="text/javascript"></script>
</head>
<body>

    <%@ include file="../../header.jsp" %>
   
    <div class="bodywrap">
    	<div class="fstv-detail-form">
	    	<div class="fstv-title">
	    		<h1 style="display: inline-block"><%=vo.getFstv_title() %></h1>
	    		<i id="jjim" class="fa-regular fa-heart">  <%=vo.getFstv_jjimCount() %></i><br>
	    		<span class="fstv-date"><%=vo.getFstv_startdate() %> ~ <%=vo.getFstv_enddate() %></span>
		    </div>
	        <div class="fstv-detail-form">
	        	<h3>
	        		<i class="fa-solid fa-chevron-left"></i>
	        			축제 개요
	        		<i class="fa-solid fa-chevron-right"></i>	
	        	</h3>
	            <p class="info-text"><%=vo.getFstv_eventinfo() %></p>
	            <p class="info-cont"><%=vo.getFstv_eventcont() %></p>
				<button class="more">더보기</button><br>
	        	<hr>
	        	<div style="width: 1000px; height: 350px; text-align: center;">
	        		<div class="fstv-img">
	        			<img alt="페스티벌 이미지" src="<%=vo.getFstv_image()%>">
	        		</div>
	        		<div class="fstv-info">
	        			<div>
	        				<i class="fa-solid fa-calendar-days" style="color: #ff8080;"></i>
	        				<%=vo.getFstv_startdate() %> ~ <%=vo.getFstv_enddate() %>
	        			</div>
	        			<div>
	        				<i class="fa-solid fa-map-location-dot" style="color: #00aa00;"></i>
	        				<%=vo.getFstv_addr1() %>
	        			</div>
	        			<div>
	        				<i class="fa-solid fa-location-dot" style="color: #0080ff;"></i>
	        				<%=vo.getFstv_eventplace() %>
	        			</div>
	        			<div>
	        				<i class="fa-solid fa-clock" style="color: #ff8040;"></i>
	        				<%=vo.getFstv_playtime() %>
	        			</div>
	        			<div>
	        				<i class="fa-solid fa-coins" style="color: #fbd037;"></i>
	        				<%=vo.getFstv_usetimefestival() %>
	        			</div>
	        			<div>
	        				<i class="fa-solid fa-headset" style="color: #004080;"></i>
	        				<%=vo.getFstv_tel() %>
	        			</div>
	        			<div id="home-page-link">
		        			<%=vo.getFstv_homepage()%>
	        			</div>
	        		</div>
	        	</div>
	        	<hr>
	        	<div class="fstv_loc">
	        		<h3>
		        		<i class="fa-solid fa-chevron-left"></i>
		        			찾아오는 길
		        		<i class="fa-solid fa-chevron-right"></i>
	        		</h3>
	        	
	        		<div id="map" class="fstv-map">
	        			<a class="route-finder" href="https://map.kakao.com/link/to/' + title + ',' + lat + ',' + lng + '" target="_blank"><i class="fa-solid fa-location-arrow"></i> 길찾기</a>
	        		</div>
	        		<!-- <div class="fstv-map">
	        			<img alt="카카오맵" src="resources/img/카카오맵.png">
	        		</div> -->
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
	
	<%@ include file="../../footer.jsp" %>
	<script>
		const lat = <%=vo.getFstv_mapy()%>;
		const lng = <%=vo.getFstv_mapx()%>;
		var title = "<%=vo.getFstv_title()%>";
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		  mapOption = { 
		        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };

		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		var imageSrc = 'resources/img/marker.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(35, 38), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(18, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	    
	 	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	        markerPosition = new kakao.maps.LatLng(lat, lng); // 마커가 표시될 위치입니다

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		  position: markerPosition,
		  image: markerImage // 마커이미지 설정 
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  

		// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var content = '<div class="customoverlay">' +
		    '  <a class="title-finder" href="https://map.kakao.com/link/to/' + title + ',' + lat + ',' + lng + '" target="_blank">' +
		    '    <span class="title">' + title + '</span>' +
		    '  </a>' +
		    '</div>';

		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new kakao.maps.LatLng(lat, lng);  

		// 커스텀 오버레이를 생성합니다
		var customOverlay = new kakao.maps.CustomOverlay({
		    map: map,
		    position: position,
		    content: content,
		    yAnchor: 1 
		});
	</script>

</body>
</html>
