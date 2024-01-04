<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/booth_detail.css" type="text/css">
    <script src="resources/js/booth_detail.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
    	<div class="booth-detail-form">
	    	<div class="booth-title">
	    		<h3 class="fstv-title">양평 산수유마을 빙어축제</h3>
	    		<h1 style="display: inline-block">산수유 떡볶이</h1>
	    		<span class="booth-type"> | 판매형</span>
		    </div>
		    <div class="booth-menu" style="width: 1000px; height: 300px; margin-top: 20px;">
	       		<div class="booth-img">
	       			<img alt="부스 이미지" src="resources/img/떡볶이.jpg">
	       		</div>
	       		<div class="booth-item">
	       			<ul>
	       				<li class="booth-item-menu">
	       					<i class="fa-solid fa-chevron-left"></i>
	       						MENU
	       					<i class="fa-solid fa-chevron-right"></i>
	       				</li>
	       				<li>빙어떡볶이<span>4000원</span></li>
	       				<li>순대<span>4000원</span></li>
	       				<li>부산어묵<span>4000원</span></li>
	       				<li>튀김<span>8000원</span></li>
	       				<li>해물라면<span>4000원</span></li>
	       				<li>참치김밥<span>4000원</span></li>
	       				<li>쫄면<span>4000원</span></li>
	       				<li>돈까스<span>4000원</span></li>
	       			</ul>
	       		</div>
	        </div>
	        <div class="booth-info-form">
	        	<ul class="tabmenu">
	                <li class="active" id="tab"><a href="#" class="tab-name">부스 정보</a>
	                    <div class="booth-info">
	                        <ul>
	                            <li class="booth-intro">
		                            <i class="fa-solid fa-quote-left"></i>
		                                산수유 마을 빙어축제에서 빙어 떡볶이를 맛보세요! 엄청 특별한 맛, 보장합니다.
		                            <i class="fa-solid fa-quote-right"></i>
	                            </li>
	                            <li>
	                                <i class="fa-solid fa-location-dot" style="color: #0080ff;"></i>
	       							축제 정문에서 130m 직진, 광장 옆옆 부스
	                            </li>
	                            <li>
	                                <i class="fa-solid fa-clock" style="color: #ff8040;"></i>
	       							09:00 ~ 18:00
	                            </li>
	                            <li>
	                                <i class="fa-solid fa-phone" style="color: #00aa00;"></i>
	       							010-1234-5678
	                            </li>
	                        </ul>
				            <a href="report.jsp" class="report"><i class="fa-solid fa-triangle-exclamation"></i>
				    			부스정보 신고하기
				    		</a>
	                    </div>
	                </li>
	                <li id="tab"><a href="#" class="tab-name">리뷰</a>
	                    <div class="review-form">
                        	<a href="#" class="write-review"><i class="fa-regular fa-file-lines"></i> 영수증 리뷰쓰기</a>
	                    	<ul class="review-ul">
		                    	<li class="review-li">
		                          	<span class="star-point">
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</span><br>
									<span class="id-date">yumii**** | 2024.01.03</span>
				                    <ul>
		                            	<li><i class="fa-solid fa-hashtag">음식이 맛있어요</i></li>
		                            	<li><i class="fa-solid fa-hashtag">불친절해요</i></li>
		                            	<li><i class="fa-solid fa-hashtag">가격이 비싸요</i></li>
		                           	</ul>
	                           	</li>
	                           	<hr>
		                    	<li class="review-li">
		                          	<span class="star-point">
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</span><br>
									<span class="id-date">yumii**** | 2024.01.03</span>
				                    <ul>
		                            	<li><i class="fa-solid fa-hashtag">음식이 맛있어요</i></li>
		                            	<li><i class="fa-solid fa-hashtag">친절해요</i></li>
		                           	</ul>
	                           	</li>
                        	</ul>
                        	<a href="#" class="review-more">리뷰 더보기 <i class="fa-solid fa-chevron-right""></i></a>
	                    </div>
	                </li>   
	            </ul>
	        </div>
	     </div>
    </div>
	
	<%-- 푸터파일 아직 없어서 주석처리 <%@ include file="footer.jsp" %> --%>

</body>
</html>
