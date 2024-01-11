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
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY"></script>
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
	        	
	        		<div id="map" class="fstv-map"></div>
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
		console.log(lat)
		console.log(lng)
 
		var mapContainer = document.getElementById('map'), 		// 지도 표시 div 
		mapOption = {
			center : new kakao.maps.LatLng(lat, lng), 			// 지도 중심좌표
			level : 3 											// 지도 확대 lv
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);	// 지도 생성
		var markerPosition = new kakao.maps.LatLng(lat, lng);	// 마커 position
		var marker = new kakao.maps.Marker({					// 마커를 생성합니다
			position : markerPosition
		});
		marker.setMap(map);										// 마커 지도에 배치
		
		// 인포윈도우에 표출될 내용(HTML 문자열이나 document element 가능)
		var iwContent = '<div style="padding:5px;">'+ title +'<br><a href="https://map.kakao.com/link/map/' + title + ','
						+ lat + ',' + lng + '" style="color:blue" target="_blank">큰지도보기</a><a href="https://map.kakao.com/link/to/'
						+ title + ',' + lat + ',' + lng + '"style="color:blue" target="_blank">길찾기</a></div>',
		iwPosition = new kakao.maps.LatLng(lat, lng); 			//인포윈도우 표시 위치

		var infowindow = new kakao.maps.InfoWindow({			// 인포윈도우를 생성합니다
			position : iwPosition,
			content : iwContent	});
		
		infowindow.open(map, marker);							// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	</script>

</body>
</html>
