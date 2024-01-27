<%@page import="com.multi.FM.manager.AskVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/mypage_ask.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/mypage_ask_detail.css"
	type="text/css">
<script type="text/javascript" src="resources/js/mypage_ask.js" defer>
	
</script>
<%
List<AskVO> VO = (List<AskVO>) request.getAttribute("list");
%>
<div id="whole">
	<!-- 문의내역 리스트 -->
	<h1>내 문의내역</h1>
	<br>
	<hr class="shadow">
	<br>
	<div class="ask-list">
		<%
		  if (VO.size() > 0) {
		%>
		<table>
			<thead>
				<tr>
					<th>Email</th>
					<th>Type</th>
					<th>Title</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<%
				  for (AskVO list : VO) {
				%>
				<tr>
					<td><%=list.getUser_id()%></td>
					<td><%=list.getAsk_type()%></td>
					<td><a class="ask-title" data-ask-no="<%=list.getAsk_no()%>"><%=list.getAsk_title()%></a></td>
					<td><%=list.getAsk_created_at()%></td>
					<td id="ask_no" style="display: none"><%=list.getAsk_no()%></td>
				</tr>
				<%
				  }
				%>
			</tbody>

		</table>
		<%
		  } else {
		%>
		<div id="no_ask">문의하신 내역이 없습니다.</div>
		<%
		  }
		%>
	</div>
</div>
<!-- 문의 내용 / 답변 리스트 : 디폴트는 안보임, 타이틀에 의해 선택된 부분만 보여지게 됨 -->
<%
  for (AskVO list : VO) {
%>
<div id="detail_<%=list.getAsk_no()%>" style="display: none">
	<h1 class="back">&lt;&nbsp;내 문의내역</h1>
	<br>
	<hr class="shadow">
	<br>
	<div class="ask-form">
		<div class="ask-detail">
			<h2><%=list.getAsk_title()%></h2>
			<span class="ask-type">/ <%=list.getAsk_type()%></span><br>
			<div class="ask-info"><%=list.getUser_id()%>
				|
				<%=list.getAsk_created_at()%></div>
			<br>
			<p class="ask-content">
				<%=list.getAsk_content()%>
			</p>
			<hr>
		</div>
		<div class="comment-form">
			<%
			  if (list.getAsk_answer() == null) {
			%>
			<p class="admin-comment">답변을 기다리는 중입니다.</p>
			<%
			  } else {
			%>
			<div class="icon-form">
				<span>↪</span> <i class="fa-solid fa-user-tie"></i>
			</div>


			<p class="admin-comment">
				<%=list.getAsk_answer()%>
			</p>
			<%
			  }
			%>
		</div>
	</div>
</div>
<%}%>
