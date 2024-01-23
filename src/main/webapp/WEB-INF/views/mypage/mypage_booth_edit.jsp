<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.multi.FM.myboothpage.BoothVO"%>
<%@ page import="com.multi.FM.booth.BoothProductVO"%>
<!DOCTYPE html>
<% BoothVO mybooth = (BoothVO) request.getAttribute("booth"); %>
<% List<BoothProductVO> products = (List<BoothProductVO>) request.getAttribute("products"); %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage_booth_add.css"
	type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/mypage_booth_edit.js"
	defer type="text/javascript"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var boothNo = <%= mybooth.getBooth_no() %>;

        // JavaScript 변수로 booth_no 값을 할당
        document.getElementById("booth-no").value = boothNo;
    });
</script>
			<div class="booth-head">
				<h1>내 부스관리</h1>
				<div>
					<input type="submit" id="updateSubmit" value="수정하기"> <i
						class="fa-solid fa-chevron-right"></i>
				</div>
			</div>
			<br>
			<hr class="shadow">
			<br>
			<form class="input-form">
				<div class="booth-add-form">
					<div>
						<i class="fa-solid fa-drum"></i> <input type="text"
							value="<%= mybooth.getFstv_title()%>" readonly>
					</div>
					<div>
						<i class="fa-solid fa-store"></i> <input type="text"
							id="booth-name" name="booth-name"
							value="<%= mybooth.getBooth_name() %>" required>
					</div>
					<div>
						<i class="fa-solid fa-hashtag"></i> <select id="booth-type"
							name="booth-type">
							<option value="판매형" <%= mybooth.getBooth_category().equals("판매형") ? "selected" : "" %>>판매형</option>
							<option value="체험형" <%= mybooth.getBooth_category().equals("체험형") ? "selected" : "" %>>체험형</option>
						</select>
					</div>
					<div>
						<i class="fa-solid fa-image"></i> <input type="text"
							id="booth-img" name="booth-img"
							value="<%= mybooth.getBooth_image() %>">
						<button>첨부파일</button>
					</div>
					<div>
						<i class="fa-solid fa-location-dot"></i> <input type="text"
							id="booth-loc" name="booth-loc"
							value="<%= mybooth.getBooth_addr() %>">
					</div>
					<div>
						<i class="fa-solid fa-phone"></i> <input type="text"
							id="booth-tel" name="booth-tel"
							value="<%= mybooth.getBooth_tel() %>">
					</div>
					<div>
						<i class="fa-regular fa-clock"></i> <input type="text"
							id="booth-hour" name="booth-hour"
							value="<%= mybooth.getBooth_hours() %>">
					</div>
					<div class="text-area">
						<i class="fa-solid fa-store"></i>
						<textarea id="booth-intro" name="booth-intro"><%= mybooth.getBooth_introduction() %></textarea>
					</div>
				</div>
				<div class="item-add-form">
					<%for (BoothProductVO product : products) {%>
					<div class="item-form">
						<div class="item">
							<div>
								<i class="fa-solid fa-tag"></i> <input type="text" class="booth-item"
									id="booth-item" name="booth-item" value="<%= product.getProduct() %>"
									required>
							</div>
							<div>
								<i class="fa-solid fa-sack-dollar"></i> <input type="text" class="booth-item-price"
									id="booth-item-price" name="booth-item-price"
									value="<%= product.getPrice() %>" required>
							</div>
						</div>
					</div>
					<% } %>
					<div style="text-align: center;">
						<i class="fa-solid fa-plus" id="item-add"></i> <i
							class="fa-solid fa-minus" id="item-remove"></i>
					</div>
				</div>
				<input type="hidden" id="booth-no" name="booth-no" value="<%= mybooth.getBooth_no() %>">
			</form>

