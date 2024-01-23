<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage_booth_add.css"
	type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/mypage_booth_add.js"
	defer type="text/javascript"></script>

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
				<i class="fa-solid fa-store"></i> <input type="text" id="booth-name"
					name="booth-name" placeholder="부스명" required>
			</div>
			<div>
				<i class="fa-solid fa-hashtag"></i> <select id="booth-type"
					name="booth-type">
					<option value="판매형">판매형</option>
					<option value="체험형">체험형</option>
				</select>
			</div>
			<div>
				<i class="fa-solid fa-image"></i> <input type="file" name="booth-img" id="booth-img" accept="image/*">
			</div>
			<div>
				<i class="fa-solid fa-location-dot"></i> <input type="text"
					id="booth-loc" name="booth-loc" placeholder="부스 위치">
			</div>
			<div>
				<i class="fa-solid fa-phone"></i> <input type="text" id="booth-tel"
					name="booth-tel" placeholder="부스 전화번호">
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
						<i class="fa-solid fa-tag"></i> <input type="text"
							class="booth-item" name="booth-item" placeholder="상품명" required>
					</div>
					<div>
						<i class="fa-solid fa-sack-dollar"></i> <input type="text"
							class="booth-item-price" name="booth-item-price"
							placeholder="가격 입력(숫자만 입력해주세요)" required>
					</div>
				</div>
			</div>
			<div style="text-align: center;">
				<i class="fa-solid fa-plus" id="item-add"></i> <i
					class="fa-solid fa-minus" id="item-remove"></i>
			</div>
		</div>
	</form>