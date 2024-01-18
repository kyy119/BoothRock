<%@page import="java.util.List"%>
<%@page import="com.multi.FM.myboothpage.BoothVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/mypage_booth.css"
	type="text/css">
<%
  List<BoothVO> VO = (List<BoothVO>) request.getAttribute("mybooths");
%>
<div class="mypage-form">
	<div class="booth-head">
		<h1>내 부스관리</h1>
		<a href="mypage_booth_add">부스 등록 <i
			class="fa-solid fa-chevron-right"></i></a>
	</div>
	<br>
	<hr class="shadow">
	<br>
	<div class="booth-form">
		<%-- 페이징 필요 --%>
		<ul>
            <% for (BoothVO booth : VO) { %>
            <li>
                <img src="<%= booth.getBooth_image() %>">
                <div class="booth">
                    <h4><%= booth.getFstv_title() %></h4>
                    <h2><a href="booth_detail.jsp"><%= booth.getBooth_name() %></a></h2>
                    <div class="booth-type"><%= booth.getBooth_category() %></div>
                    <button class="booth-delete">삭제</button>
                    <button class="booth-edit" onclick="location.href='mypage_booth_edit.jsp'">
                        수정하기 <i class="fa-solid fa-chevron-right"></i>
                    </button>
                </div>
            </li>
            <hr>
            <% } %>
        </ul>
		<!-- <ul>
			<li><img src="resources/img/booth1.jpg">
				<div class="booth">
					<h4>충남대 라일락 대동제</h4>
					<h2>
						<a href="booth_detail.jsp">꿈돌이 체험 부스</a>
					</h2>
					<div class="booth-type">체험형</div>
					<button class="booth-delete">삭제</button>
					<button class="booth-edit"
						onclick="location.href='mypage_booth_edit.jsp'">
						수정하기 <i class="fa-solid fa-chevron-right"></i>
					</button>
				</div></li>
			<hr>
			<li><img src="resources/img/booth2.jpg">
				<div class="booth">
					<h4>이화여대 대동제</h4>
					<h2>
						<a href="booth_detail.jsp">코코넛 부스</a>
					</h2>
					<div class="booth-type">판매형</div>
					<button class="booth-delete">삭제</button>
					<button class="booth-edit"
						onclick="location.href='mypage_booth_edit.jsp'">
						수정하기 <i class="fa-solid fa-chevron-right"></i>
					</button>
				</div></li>
		</ul> -->
	</div>
</div>