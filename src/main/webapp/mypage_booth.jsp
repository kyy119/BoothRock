<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/mypage_booth.css" type="text/css">
    <link rel="stylesheet" href="resources/css/mypage_side.css" type="text/css">
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
		        <a href="mypage_booth_add.jsp">부스 등록 <i class="fa-solid fa-chevron-right"></i></a>
	    	</div>
		    <br><hr class="shadow"><br>
	    	<div class="booth-form">		<%-- 페이징 필요 --%>
    			<ul>
		            <li>
		            	<img src="resources/img/booth1.jpg">
		            	<h4>충남대 라일락 대동제</h4>
		            	<h2>꿈돌이 체험 부스</h2>
		            	<div class="booth-type">체험형</div>
		            	<button class="booth-delete">삭제</button>
		            	<button class="booth-edit" onclick="location.href='mypage_booth_edit.jsp'">수정하기 <i class="fa-solid fa-chevron-right"></i></button>
		            </li>
		            <li>
		            	<img src="resources/img/booth2.jpg">
		            	<h4>이화여대 대동제</h4>
		            	<h2>코코넛 부스</h2>
		            	<div class="booth-type">판매형</div>
		            	<button class="booth-delete">삭제</button>
		            	<button class="booth-edit" onclick="location.href='mypage_booth_edit.jsp'">수정하기 <i class="fa-solid fa-chevron-right"></i></button>
		            </li>
	            </ul>
    		</div>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
