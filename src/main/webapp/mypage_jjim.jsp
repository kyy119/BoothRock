<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/mypage_jjim.css" type="text/css">
    <link rel="stylesheet" href="resources/css/mypage_side.css" type="text/css">
	<script src="resources/js/mypage_jjim.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
	    <nav class="side-menu">
	    	<h2>마이페이지</h2>
	   		<ul class="side-navi">
	   			<li><span></span><a href="mypage_edit.jsp">회원정보수정</a></li>
	   			<li style="font-weight: bold"><span class="stick"></span><a href="mypage_jjim.jsp">찜 목록</a></li>
	   			<li><span></span><a href="mypage_review.jsp">내 리뷰보기</a></li>
	   			<li><span></span><a href="mypage_ask.jsp">내 문의내역</a></li>
	   			<li><span></span><a href="mypage_booth.jsp">내 부스관리</a></li>
	   		</ul>
	    </nav>
	    
    	<div class="mypage-form">		<%-- 페이징 필요 --%>
	        <h1>찜 목록</h1>
	    	<br><hr class="shadow"><br>
			<ul class="jjim-list">
         		<li>
					<i id="jjim" class="fa-solid fa-heart"></i>
                 	<a href="fstv_detail.jsp">
						<img src="resources/img/청계천.jpg" alt="이미지1">
						<span class="fstv-title">겨울, 청계천의 빛</span><br>
						<span class="fstv-loc">서울 중구</span><br>
						<span class="fstv-date">2023.12.15 ~ 2023.12.31</span>
                 	</a>
             	</li>
             	<li>
             		<i id="jjim" class="fa-solid fa-heart"></i>
                 	<a href="#">
                     	<img src="resources/img/광화문.png" alt="이미지2">
                     	<span class="fstv-title">광화문광장 마켓</span><br>
                     	<span class="fstv-loc">서울 중구</span><br>
                     	<span class="fstv-date">2023.12.15 ~ 2024.01.21</span>
                 	</a>
             	</li>
             	<li>
             		<i id="jjim" class="fa-solid fa-heart"></i>
                 	<a href="#">
                     	<img src="resources/img/금리단.jpg" alt="이미지3">
                     	<span class="fstv-title">금리단아트페스타</span><br>
                     	<span class="fstv-loc">서울 중구</span><br>
                     	<span class="fstv-date">2023.12.15 ~ 2023.12.16</span>
                 	</a>
             	</li>
				<li>
					<i id="jjim" class="fa-solid fa-heart"></i>
             		<a href="#">
                      	<img src="resources/img/빛초롱.jpg" alt="이미지1">
                      	<span class="fstv-title">서울 빛초롱 축제</span><br>
                      	<span class="fstv-loc">서울 중구</span><br>
                      	<span class="fstv-date">2023.12.15 ~ 2024.01.21</span>
                 	</a>
             	</li>  
             	<li>
             		<i id="jjim" class="fa-solid fa-heart"></i>
                 	<a href="#">
	                    <img src="resources/img/송현동.jpg" alt="이미지2">
	                    <span class="fstv-title">송현동 솔빛축제</span><br>
	                    <span class="fstv-loc">서울 중구</span><br>
	                    <span class="fstv-date">2023.12.15 ~ 2024.01.21</span>
                 	</a>
             	</li>
             	<li>
             		<i id="jjim" class="fa-solid fa-heart"></i>
                	<a href="#">
						<img src="resources/img/금리단.jpg" alt="이미지3">
                     	<span class="fstv-title">금리단아트페스타</span><br>
                     	<span class="fstv-loc">서울 중구</span><br>
                     	<span class="fstv-date">2023.12.15 ~ 2023.12.16</span>
					</a>     
             	</li>
             	<li>
             		<i id="jjim" class="fa-solid fa-heart"></i>
                	<a href="#">
						<img src="resources/img/금리단.jpg" alt="이미지3">
                     	<span class="fstv-title">금리단아트페스타</span><br>
                     	<span class="fstv-loc">서울 중구</span><br>
                     	<span class="fstv-date">2023.12.15 ~ 2023.12.16</span>
					</a>     
             	</li>
             </ul>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
