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
		    			<label for="fstv-name">축제명</label>
							<select id="fstv-name" name="fstv-name">
							<option value="fstv1">양평 산수유마을 빙어축제</option>
							<option value="fstv2">임실 치즈 축제</option>
						</select>
	    			</div>
	    			<div>
		    			<label for="booth-name">부스명</label>
						<input type="text" id="booth-name" name="booth-name" value="산수유 떡볶이" required>
	    			</div>
	    			<div>
						<label for="booth-type">부스타입</label>
						<select id="booth-type" name="booth-type">
							<option value="selling">판매형</option>
							<option value="trial">체험형</option>
						</select>
		    		</div>
	    			<div>
		    			<label for="booth-img">이미지</label>
						<input type="text" id="booth-img" name="booth-img" value="산수유떡볶이.jpg"><button>첨부파일</button>
	    			</div>
	    			<div>
		    			<label for="booth-loc">위치</label>
		    			<input type="text" id="booth-loc" name="booth-loc" value="축제 정문에서 130m 직진, 광장 옆옆 부스">
	    			</div>
	    			<div>
		    			<label for="booth-tel">전화번호</label>
		    			<input type="text" id="booth-tel" name="booth-tel" value="010-1234-5678">
	    			</div>
	    			<div>
		    			<label for="booth-hour">운영시간</label>
		    			<input type="text" id="booth-hour" name="booth-hour" value="09:00 ~ 18:00">
	    			</div>
	    			<div style="height: 100px;">
		    			<label for="booth-intro">부스소개</label>
		    			<textarea id="booth-intro" name="booth-intro">산수유 마을 빙어축제에서 빙어 떡볶이를 맛보세요! 엄청 특별한 맛, 보장합니다.</textarea>
	    			</div>
	    		</div>
	    		<div class="item-add-form">
	    			<div class="item-form">
	    				<div class="item">
			    			<div>
				    			<label for="booth-item">상품명</label>
								<input type="text" id="booth-item" name="booth-item" value="빙어떡볶이" required>
			    			</div>
			    			<div>
				    			<label for="booth-item-price">가격</label>
								<input type="text" id="booth-item-price" name="booth-item-price" value="4000" required>
			    			</div>
		    			</div>
	    				<div class="item">
	    				<hr>
			    			<div>
				    			<label for="booth-item1">상품명</label>
								<input type="text" id="booth-item1" name="booth-item1" value="순대" required>
			    			</div>
			    			<div>
				    			<label for="booth-item-price1">가격</label>
								<input type="text" id="booth-item-price1" name="booth-item-price1" value="4000" required>
			    			</div>
		    			</div>
	    				<div class="item">
	    				<hr>
			    			<div>
				    			<label for="booth-item2">상품명</label>
								<input type="text" id="booth-item2" name="booth-item2" value="부산어묵" required>
			    			</div>
			    			<div>
				    			<label for="booth-item-price2">가격</label>
								<input type="text" id="booth-item-price2" name="booth-item-price2" value="4000" required>
			    			</div>
		    			</div>
	    			</div>
	    			<div style="text-align: center;">
	    				<i class="fa-solid fa-plus" id="item-add"></i>
	    			</div>
	    		</div>
    		</form>
    	</div>
   	</div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
