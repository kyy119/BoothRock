<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<title>모든 축제의 부스를 담다 - 부스락</title>
<!-- 세션 값 가져오기 -->
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
				<li data-tab="mypage_edit_info" class="tabmenu" id="default">
					<span></span>
					<a><i class="fa-regular fa-user"></i>회원정보수정</a>
				</li>
				<li data-tab="mypage_jjimlist" class="tabmenu">
					<span></span>
					<a><i class="fa-solid fa-heart"></i>찜 목록</a>
				</li>
				<li data-tab="mypage_review" class="tabmenu">
					<span></span>
					<a><i class="fa-regular fa-rectangle-list"></i>내 리뷰보기</a>
				</li>
				<li data-tab="mypage_ask" class="tabmenu">
					<span></span>
					<a><i class="fa-regular fa-pen-to-square"></i>내 문의내역</a>
				</li>
				<%if(userRole=="consumer"){ %> <!-- 소비자면 부스관리 탭 없애기 -->
				<%} else {%>
				<li data-tab="mypage_booth" class="tabmenu">
					<span></span>
					<a><i class="fa-solid fa-store"></i>내 부스관리</a>
				</li>
				<%} %>
			</ul>
		</nav>
	
		<div class="mypage-form" id="result"></div>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>
