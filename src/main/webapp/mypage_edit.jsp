<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/mypage_edit.css" type="text/css">
	<link rel="stylesheet" href="resources/css/mypage_side.css" type="text/css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
	    <nav class="side-menu">
	    	<h2>마이페이지</h2>
	   		<ul class="side-navi">
	   			<li style="font-weight: bold"><span class="stick"></span><a href="mypage_edit.jsp">회원정보수정</a></li> <%-- 본인인증 넣어도 되고 안 넣어도 되고 --%>
	   			<li><span></span><a href="mypage_jjim.jsp">찜 목록</a></li>
	   			<li><span></span><a href="mypage_review.jsp">내 리뷰보기</a></li>
	   			<li><span></span><a href="mypage_ask.jsp">내 문의내역</a></li>
	   			<li><span></span><a href="mypage_booth.jsp">내 부스관리</a></li>
	   		</ul>
	    </nav>
	    
	    <div class="mypage-form">
		    <h1>회원정보수정</h1>
	    	<br><hr class="shadow"><br>
	    	<div class="edit-form">
	    		<form class="input-form">
	    			<div>
		    			<label for="email">이메일</label>	<%-- 변경 불가 --%>
						<input type="email" id="email" name="email" placeholder="email@adress.com" required>
	    			</div>
	    			<div>
		    			<label for="password">비밀번호</label>
						<input type="password" id="password" name="password" required>
	    			</div>
	    			<div>
		    			<label for="password2">비밀번호 확인</label>
						<input type="password" id="password2" name="password2" required>
	    			</div>
	    			<div>
		    			<label for="name">이름</label>		<%-- 변경 불가 --%>
		    			<input type="text" id="name" name="name" placeholder="부스락" required>
	    			</div>
	    			<div>
		    			<label for="tel">전화번호</label>
		    			<input type="text" id="tel" name="tel" required>
		    			<button>본인인증</button>
		    		</div>
		    		<div class="seller-number">
		    			<label for="seller-number">사업자번호</label>
		    			<input type="text" id="seller-number" name="seller-number">
	    			</div>
	    			<input type="submit" class="edit" value="완료">
	    		</form>
	    	</div>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
