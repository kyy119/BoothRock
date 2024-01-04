<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/mypage_review.css" type="text/css">
    <link rel="stylesheet" href="resources/css/mypage_side.css" type="text/css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
	    <nav class="side-menu">
	    	<h2>마이페이지</h2>
	   		<ul class="side-navi">
	   			<li><span></span><a href="mypage_edit.jsp">회원정보수정</a></li> <%-- 본인인증 넣어도 되고 안 넣어도 되고 --%>
	   			<li><span></span><a href="mypage_jjim.jsp">찜 목록</a></li>
	   			<li style="font-weight: bold"><span class="stick"></span><a href="mypage_review.jsp">내 리뷰보기</a></li>
	   			<li><span></span><a href="mypage_ask.jsp">내 문의내역</a></li>
	   			<li><span></span><a href="mypage_booth.jsp">내 부스관리</a></li>
	   		</ul>
	    </nav>
	    
    	<div class="mypage-form">		<%-- 페이징 필요 --%>
	        <h1>내 리뷰보기</h1>
	    	<br><hr class="shadow"><br>
	    	<div class="review-list">
	    		<div class="review-form">
		    		<i class="fa-solid fa-utensils" id="review-icon"></i>
		    		<div class="review">
		    			<div class="star-point">
		    				<i class="fa-solid fa-star"></i>
		    				<i class="fa-solid fa-star"></i>
		    				<i class="fa-solid fa-star"></i>
		    				<i class="fa-solid fa-star"></i>
		    				<i class="fa-solid fa-star"></i>
		    			</div>
		    			<div class="id-date">boo***** | 23.12.19</div>
		    			<h3>삼촌네 떡볶이</h3>
		    			<span> / 서울 광장시장</span>
		    			<ul>
		    				<li><i class="fa-solid fa-hashtag">맛있어요</i></li>
		    				<li><i class="fa-solid fa-hashtag">친절해요</i></li>
		    				<li><i class="fa-solid fa-hashtag">재방문의사 있어요</i></li>
		    			</ul>
		    		</div>
		    	</div>
	    		<div class="review-form">
	    			<i class="fa-solid fa-rocket" id="review-icon"></i>
		    		<div class="review">
		    			<div class="star-point">
		    				<i class="fa-solid fa-star"></i>
		    				<i class="fa-solid fa-star"></i>
		    				<i class="fa-solid fa-star"></i>
		    				<i class="fa-solid fa-star"></i>
		    				<i class="fa-regular fa-star"></i>
		    			</div>
		    			<div class="review-date">boo***** | 23.11.20</div>
		    			<h3>임실 치즈 만들기 체험</h3>
		    			<span> / 임실 치즈 축제</span>
		    			<ul>
		    				<li><i class="fa-solid fa-hashtag">적당해요</i></li>
		    				<li><i class="fa-solid fa-hashtag">친절해요</i></li>
		    				<li><i class="fa-solid fa-hashtag">재방문의사 있어요</i></li>
		    			</ul>
		    		</div>
		    	</div>
	    		<div class="review-form">
	    			<i class="fa-solid fa-utensils" id="review-icon"></i>
		    		<div class="review">
		    			<div class="star-point">
		    				<i class="fa-solid fa-star"></i>
		    				<i class="fa-regular fa-star"></i>
		    				<i class="fa-regular fa-star"></i>
		    				<i class="fa-regular fa-star"></i>
		    				<i class="fa-regular fa-star"></i>
		    			</div>
		    			<div class="review-date">boo***** | 23.10.01</div>
		    			<h3>존맛탱 소곱창</h3>
		    			<span> / 소곱창 대축제</span>
		    			<ul>
		    				<li><i class="fa-solid fa-hashtag">줄이 길어요</i></li>
		    				<li><i class="fa-solid fa-hashtag">불친절해요</i></li>
		    				<li><i class="fa-solid fa-hashtag">가격이 이상해요</i></li>
		    			</ul>
		    		</div>
		    	</div>
	    	</div>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
