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
	<script src="resources/js/fstv_detail.js" defer type="text/javascript"></script>
	<script src="resources/js/fstv_list.js" defer type="text/javascript"></script>
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
	        			<%=vo.getFstv_homepage()%>
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
	
	<%@ include file="../../footer.jsp" %>

</body>
</html>
