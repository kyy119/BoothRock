<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.multi.FM.myboothpage.BoothVO"%>
<!DOCTYPE html>
<% BoothVO mybooth = (BoothVO) request.getAttribute("booth"); %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <%
String userId = (String)session.getAttribute("id");
String userRole = (String)session.getAttribute("role");
/* String userRole = "consumer"; */
%>
<!-- 세션 값을 JavaScript 변수에 할당 -->
<!-- 세션이 없다면 메인페이지로 이동 -->
<script type="text/javascript">
let userRole = "<%=userRole%>";
let userId = "<%=userId%>"; 
if (userId == null) {
	alert("로그인이 필요합니다.");
	window.location.href = 'main.jsp';
}
</script>
    <link rel="stylesheet" href="resources/css/mypage_booth_add.css" type="text/css">
    <link rel="stylesheet" href="resources/css/mypage_side.css" type="text/css">
    <script src="resources/js/mypage_booth_add.js" defer type="text/javascript"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // boothCategory 변수에 기본 값 할당 (예시로 "체험형" 설정)
        var boothCategory = "<%= mybooth.getBooth_category() %>";

        // boothCategory 값을 booth-type 요소에 할당
        document.getElementById("booth-type").value = boothCategory;
    });
</script>
</head>
<body>
    <%@ include file="../../../header.jsp" %>
    
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
						<input type="text" value="<%= mybooth.getFstv_title()%>" readonly>
	    			</div>
	    			<div>
	    				<i class="fa-solid fa-store"></i>
						<input type="text" id="booth-name" name="booth-name" value="<%= mybooth.getBooth_name() %>" required>
	    			</div>
	    			<div>
	    				<i class="fa-solid fa-hashtag"></i>
						<select id="booth-type" name="booth-type">
							<option value="판매형">판매형</option>
							<option value="체험형">체험형</option>
						</select>
		    		</div>
	    			<div>
	    				<i class="fa-solid fa-image"></i>
						<input type="text" id="booth-img" name="booth-img" value="<%= mybooth.getBooth_image() %>"><button>첨부파일</button>
	    			</div>
	    			<div>
	    				<i class="fa-solid fa-location-dot"></i>
		    			<input type="text" id="booth-loc" name="booth-loc" value="<%= mybooth.getBooth_addr() %>">
	    			</div>
	    			<div>
	    				<i class="fa-solid fa-phone"></i>
		    			<input type="text" id="booth-tel" name="booth-tel" value="<%= mybooth.getBooth_tel() %>">
	    			</div>
	    			<div>
	    				<i class="fa-regular fa-clock"></i>
		    			<input type="text" id="booth-hour" name="booth-hour" value="<%= mybooth.getBooth_hours() %>">
	    			</div>
	    			<div class="text-area">
	    				<i class="fa-solid fa-store"></i>
		    			<textarea id="booth-intro" name="booth-intro"><%= mybooth.getBooth_introduction() %></textarea>
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
    
    <%@ include file="../../../footer.jsp" %>
    
</body>
</html>
