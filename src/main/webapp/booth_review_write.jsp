<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/booth_review_write.css" type="text/css">
    <script src="resources/js/booth_review_write.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
    	<div class="booth-detail-form">
	    	<div class="booth-title">
	    		<h3 class="fstv-title">양평 산수유마을 빙어축제</h3>
	    		<a href="booth_detail.jsp" style="display: inline-block"><h1>산수유 떡볶이</h1></a>
	    		<span class="booth-type"> | 판매형</span>
		    </div>
		    <div class="review-write-form">
		    	<h2>소중한 리뷰를 남겨주세요</h2>
              	<div class="star-point">
              		<i class="fa-regular fa-star bold-text"></i>
              		<i class="fa-regular fa-star"></i>
              		<i class="fa-regular fa-star"></i>
              		<i class="fa-regular fa-star"></i>
              		<i class="fa-regular fa-star"></i>
              	</div>
		        <form class="tag-list">
		        	<p>최대 3개 선택 가능</p><br>
		        	<ul>
		        		<li>
		        			<i class="fa-solid fa-hashtag"> 가게가 청결해요</i>
		        			<i class="fa-regular fa-thumbs-up"></i>
		        		</li>
		        		<li>
			        		<i class="fa-solid fa-hashtag"> 친절해요</i>
			        		<i class="fa-regular fa-thumbs-up"></i>
		        		</li>
		        		<li>
		        			<i class="fa-solid fa-hashtag"> 음식이 맛있어요</i>
		        			<i class="fa-regular fa-thumbs-up"></i>
		        		</li>
		        		<li>
		        			<i class="fa-solid fa-hashtag"> 적당해요</i>
		        			<i class="fa-regular fa-thumbs-up"></i>
		        		</li>
		        	</ul>
		        	<ul>
		        		<li>
		        			<i class="fa-solid fa-hashtag"> 그저 그랬어요</i>
		        			<i class="fa-regular fa-thumbs-down"></i>
		        		</li>
		        		<li>
			        		<i class="fa-solid fa-hashtag"> 불친절해요</i>
			        		<i class="fa-regular fa-thumbs-down"></i>
		        		</li>
		        		<li>
		        			<i class="fa-solid fa-hashtag"> 위생이 좋지 않아요</i>
		        			<i class="fa-regular fa-thumbs-down"></i>
		        		</li>
		        		<li>
		        			<i class="fa-solid fa-hashtag"> 음식이 맛없어요</i>
		        			<i class="fa-regular fa-thumbs-down"></i>
		        		</li>
		        	</ul>
		        	<input type="submit" value="리뷰 등록하기">
		        </form>
		     </div>
	     </div>
    </div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>
