<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/mypage_booth_add.css" type="text/css">
    <link rel="stylesheet" href="resources/css/mypage_side.css" type="text/css">
    <script src="resources/js/mypage_booth_add.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
	    <nav class="side-menu">
	    	<h2>마이페이지</h2>
	   		<ul class="side-navi">
	   			<li><span></span><a href="mypage_edit.jsp">회원정보수정</a></li>
	   			<li><span></span><a href="mypage_jjim.jsp">찜 목록</a></li>
	   			<li><span></span><a href="mypage_review.jsp">내 리뷰보기</a></li>
	   			<li><span></span><a href="mypage_ask.jsp">내 문의내역</a></li>
	   			<li style="font-weight: bold"><span class="stick"></span><a href="mypage_booth.jsp">내 부스관리</a></li>		<%-- 세션으로 판매자만 볼 수 있어야함 --%>
	   		</ul>
	    </nav>
	    
	    <div class="mypage-form">
	    	<div class="booth-head">
		        <h1>내 부스관리</h1>
		        <div>
		        	<input type="submit" value="수정하기"> <i class="fa-solid fa-chevron-right"></i>
		        </div>
	    	</div>
		    <br><hr class="shadow"><br>
    		<form class="input-form">
    			<div class="booth-add-form">
	    			<div>
	    				<i class="fa-solid fa-drum"></i>
						<select id="fstv-name" name="fstv-name">
							<option value="fstv1">양평 산수유마을 빙어축제</option>
							<option value="fstv2">임실 치즈 축제</option>
						</select>
	    			</div>
	    			<div>
	    				<i class="fa-solid fa-store"></i>
						<input type="text" id="booth-name" name="booth-name" value="산수유 떡볶이" required>
	    			</div>
	    			<div>
	    				<i class="fa-solid fa-hashtag"></i>
						<select id="booth-type" name="booth-type">
							<option value="selling">판매형</option>
							<option value="trial">체험형</option>
						</select>
		    		</div>
	    			<div>
	    				<i class="fa-solid fa-image"></i>
						<input type="text" id="booth-img" name="booth-img" value="산수유떡볶이.jpg"><button>첨부파일</button>
	    			</div>
	    			<div>
	    				<i class="fa-solid fa-location-dot"></i>
		    			<input type="text" id="booth-loc" name="booth-loc" value="축제 정문에서 130m 직진, 광장 옆옆 부스">
	    			</div>
	    			<div>
	    				<i class="fa-solid fa-phone"></i>
		    			<input type="text" id="booth-tel" name="booth-tel" value="010-1234-5678">
	    			</div>
	    			<div>
	    				<i class="fa-regular fa-clock"></i>
		    			<input type="text" id="booth-hour" name="booth-hour" value="09:00 ~ 18:00">
	    			</div>
	    			<div class="text-area">
	    				<i class="fa-solid fa-store"></i>
		    			<textarea id="booth-intro" name="booth-intro">산수유 마을 빙어축제에서 빙어 떡볶이를 맛보세요! 엄청 특별한 맛, 보장합니다.</textarea>
	    			</div>
	    		</div>
	    		<div class="item-add-form">
	    			<div class="item-form">
	    				<div class="item">
			    			<div>
			    				<i class="fa-solid fa-tag"></i>
								<input type="text" id="booth-item" name="booth-item" value="빙어떡볶이" required>
			    			</div>
			    			<div>
			    				<i class="fa-solid fa-sack-dollar"></i>
								<input type="text" id="booth-item-price" name="booth-item-price" value="4000" required>
			    			</div>
		    			</div>
	    				<div class="item">
	    				<hr>
			    			<div>
			    				<i class="fa-solid fa-tag"></i>
								<input type="text" id="booth-item1" name="booth-item1" value="순대" required>
			    			</div>
			    			<div>
			    				<i class="fa-solid fa-sack-dollar"></i>
								<input type="text" id="booth-item-price1" name="booth-item-price1" value="4000" required>
			    			</div>
		    			</div>
	    				<div class="item">
	    				<hr>
			    			<div>
			    				<i class="fa-solid fa-tag"></i>
								<input type="text" id="booth-item2" name="booth-item2" value="부산어묵" required>
			    			</div>
			    			<div>
			    				<i class="fa-solid fa-sack-dollar"></i>
								<input type="text" id="booth-item-price2" name="booth-item-price2" value="4000" required>
			    			</div>
		    			</div>
	    			</div>
	    			<div style="text-align: center;">
	    				<i class="fa-solid fa-plus" id="item-add"></i>
	    				<i class="fa-solid fa-minus" id="item-remove"></i>
	    			</div>
	    		</div>
    		</form>
    	</div>
   	</div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
