<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모든 축제의 부스를 담다 - 부스락</title>
<!-- 임의로 세션 설정 -->
<%
	session.setAttribute("userId", "user1");
	session.setAttribute("userRole", "sell");
%>
<!-- 세션 값 가져오기 -->
<%
	String userId = (String) session.getAttribute("userId");
	String userRole = (String) session.getAttribute("userRole");
%>
<!-- 세션 값을 JavaScript 변수에 할당 -->
<script type="text/javascript">let userId = '<%=userId%>';</script>
<link rel="stylesheet" href="resources/css/mypage_side.css"
	type="text/css">
<script type="text/javascript" src="resources/js/jquery-1.12.3.js"></script>
<script src="resources/js/mypage.js" defer type="text/javascript"></script>
</head>
<body>

	<%@ include file="header.jsp"%>

	<div class="bodywrap">
		<nav class="side-menu">
			<h2>마이페이지</h2>
			<ul class="side-navi">
				<li data-tab="mypage_edit_info" class="tabmenu" id="default"><span></span><a>회원정보수정</a></li>
				<li data-tab="mypage_jjimlist" class="tabmenu"><span></span><a>찜목록</a></li>
				<li data-tab="mypage_review" class="tabmenu"><span></span><a>내리뷰보기</a></li>
				<li data-tab="mypage_ask" class="tabmenu"><span></span><a>내문의내역</a></li>
				<%if(userRole=="cus"){ %> <!-- 소비자면 부스관리 탭 없애기 -->
				<%} else {%>
				<li data-tab="mypage_booth" class="tabmenu"><span></span><a>내부스관리</a></li>
				<%} %>
			</ul>
		</nav>

		<div class="mypage-form" id="result"></div>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>
