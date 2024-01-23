 <%@page import="java.util.List"%>
<%@page import="com.multi.FM.myboothpage.BoothVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- <link rel="stylesheet" href="resources/css/mypage_jjim.css"
	type="text/css"> -->
<link rel="stylesheet" href="resources/css/mypage_booth.css"
	type="text/css">
<%
  List<BoothVO> VO = (List<BoothVO>) request.getAttribute("mybooths");
%>
<script src="resources/js/mypage_booth.js" defer type="text/javascript"></script>
<div class="booth-head">
	<h1>내 부스관리</h1>
	<a id="booth_add">부스 등록 <i
		class="fa-solid fa-chevron-right"></i></a>
</div>
<br>
<hr class="shadow">
<br>
<div class="booth-form">
	<%
  if (VO.size() > 0) {
%>
	<%-- 페이징 필요 --%>
	<ul>
		<% for (BoothVO booth : VO) { %>
		<li data-booth-no="<%= booth.getBooth_no() %>"><img
			src="<%= booth.getBooth_image() %>">
			<div class="booth">
				<a href="fstv/fstv_detail?fstv_no=<%= booth.getFstv_no() %>">
				<h4><%= booth.getFstv_title() %></h4>
				</a>
				<h2>
					<a href="booth/booth_detail?booth_no=<%= booth.getBooth_no() %>"><%= booth.getBooth_name() %></a>
				</h2>
				<div class="booth-type"><%= booth.getBooth_category() %></div>
				<button class="booth-delete">삭제</button>
				<button class="booth-edit">
					수정하기 <i class="fa-solid fa-chevron-right"></i>
				</button>
			</div></li>
		<hr>
		<% } %>
	</ul>
	<%
  } else {
%>
	<div id="no-jjim">등록한 부스가 없습니다.</div>
	<%}%>
</div>