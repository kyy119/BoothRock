<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/mypage_booth.css"
	type="text/css">
<div class="booth-head">
	<h1>내 부스관리</h1>
	<a href="mypage_booth_add.jsp">부스 등록 <i
		class="fa-solid fa-chevron-right"></i></a>
</div>
<br>
<hr class="shadow">
<br>
<div class="booth-form">
	<%-- 페이징 필요 --%>
	<ul>
		<li><img src="resources/img/booth1.jpg">
			<h4>충남대 라일락 대동제</h4>
			<h2>꿈돌이 체험 부스</h2>
			<div class="booth-type">체험형</div>
			<button class="booth-delete">삭제</button>
			<button class="booth-edit"
				onclick="location.href='mypage_booth_edit.jsp'">
				수정하기 <i class="fa-solid fa-chevron-right"></i>
			</button></li>
		<li><img src="resources/img/booth2.jpg">
			<h4>이화여대 대동제</h4>
			<h2>코코넛 부스</h2>
			<div class="booth-type">판매형</div>
			<button class="booth-delete">삭제</button>
			<button class="booth-edit"
				onclick="location.href='mypage_booth_edit.jsp'">
				수정하기 <i class="fa-solid fa-chevron-right"></i>
			</button></li>
	</ul>
</div>