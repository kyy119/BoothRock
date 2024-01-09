<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/mypage_edit.css"
	type="text/css">
<h1>회원정보수정</h1>
<br>
<hr class="shadow">
<br>
<div class="edit-form">
	<form class="input-form">
		<div>
			<label for="email">이메일</label>
			<%-- 변경 불가 --%>
			<input type="email" id="email" name="email"
				placeholder="email@adress.com" required>
		</div>
		<div>
			<label for="password">비밀번호</label> <input type="password"
				id="password" name="password" required>
		</div>
		<div>
			<label for="password2">비밀번호 확인</label> <input type="password"
				id="password2" name="password2" required>
		</div>
		<div>
			<label for="name">이름</label>
			<%-- 변경 불가 --%>
			<input type="text" id="name" name="name" placeholder="부스락" required>
		</div>
		<div>
			<label for="tel">전화번호</label> <input type="text" id="tel" name="tel"
				required>
			<button>본인인증</button>
		</div>
		<div class="seller-number">
			<label for="seller-number">사업자번호</label> <input type="text"
				id="seller-number" name="seller-number">
		</div>
		<input type="submit" class="edit" value="완료">
	</form>
</div>