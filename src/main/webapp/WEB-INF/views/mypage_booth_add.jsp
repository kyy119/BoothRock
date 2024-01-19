<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
<link rel="stylesheet" href="resources/css/mypage_booth_add.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/mypage_side.css"
	type="text/css">
<script src="resources/js/mypage_booth_add.js" defer
	type="text/javascript"></script>
</head>
<body>
	<%@ include file="../../header.jsp"%>

	<div class="bodywrap">
		<nav class="side-menu">
			<h2>마이페이지</h2>
			<ul class="side-navi">
				<li data-tab="mypage_edit_info" class="tabmenu"><span></span><a>회원정보수정</a></li>
				<li data-tab="mypage_jjimlist" class="tabmenu"><span></span><a>찜 목록</a></li>
				<li data-tab="mypage_review" class="tabmenu"><span></span><a>내 리뷰보기</a></li>
				<li data-tab="mypage_ask" class="tabmenu"><span></span><a>내 문의내역</a></li>
				<li style="font-weight: bold" data-tab="mypage_booth" class="tabmenu"><span class="stick"></span><a>내 부스관리</a></li>
				<%-- 세션으로 판매자만 볼 수 있어야함 --%>
			</ul>
		</nav>

		<div class="mypage-form">
			<div class="booth-head">
				<h1>내 부스관리</h1>
				<div>
					<input type="submit" id="submitForm" value="등록하기"> <i
						class="fa-solid fa-chevron-right"></i>
				</div>
			</div>
			<br>
			<hr class="shadow">
			<br>
			<form class="input-form">
				<div class="booth-add-form">
					<div>
						<i class="fa-solid fa-drum"></i> <select id="fstv_title"
							name="fstv_title">
							<c:forEach var="festival" items="${festivals}">
								<option value="${festival.fstv_no}">${festival.fstv_title}</option>
							</c:forEach>
						</select>
					</div>
					<div>
						<i class="fa-solid fa-store"></i> <input type="text"
							id="booth-name" name="booth-name" placeholder="부스명" required>
					</div>
					<div>
						<i class="fa-solid fa-hashtag"></i> <select id="booth-type"
							name="booth-type">
							<option value="판매형">판매형</option>
							<option value="체험형">체험형</option>
						</select>
					</div>
					<div>
						<i class="fa-solid fa-image"></i> <input type="text"
							name="booth-img" id="booth-img" placeholder="부스 대표이미지">
						<button>첨부파일</button>
					</div>
					<div>
						<i class="fa-solid fa-location-dot"></i> <input type="text"
							id="booth-loc" name="booth-loc" placeholder="부스 위치">
					</div>
					<div>
						<i class="fa-solid fa-phone"></i> <input type="text"
							id="booth-tel" name="booth-tel" placeholder="부스 전화번호">
					</div>
					<div>
						<i class="fa-regular fa-clock"></i> <input type="text"
							id="booth-hour" name="booth-hour" placeholder="부스 운영시간">
					</div>
					<div class="text-area">
						<i class="fa-solid fa-store"></i>
						<textarea id="booth-intro" name="booth-intro" placeholder="부스 소개"></textarea>
					</div>
				</div>
				<div class="item-add-form">
					<div class="item-form">
						<div class="item">
							<div>
								<i class="fa-solid fa-tag"></i> <input type="text" class = "booth-item"
									name="booth-item" placeholder="상품명" required>
							</div>
							<div>
								<i class="fa-solid fa-sack-dollar"></i> <input type="text" class = "booth-item-price"
									name="booth-item-price" placeholder="가격 입력(숫자만 입력해주세요)"
									required>
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

	<%@ include file="../../footer.jsp"%>

</body>
</html>
