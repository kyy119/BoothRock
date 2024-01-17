<%@page import="java.util.List"%>
<%@page import="com.multi.FM.fstv.FestivalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/mypage_jjim.css"
	type="text/css">
<%
List <FestivalVO> VO = (List<FestivalVO>) request.getAttribute("list");
%>
<h1>찜 목록</h1>
<br>
<hr class="shadow">
<br>
<ul class="jjim-list">
	<%
	  for (FestivalVO list : VO) { //카테고리별 이미지
	%>
	<li><i class="fa-solid fa-heart"></i> <a href="fstv_detail?fstv_no=<%=list.getFstv_no()%>">
			<img src=<%=list.getFstv_image() %> alt="resource/img/no-image.jpg"> 
			<span class="fstv-title"><%=list.getFstv_title() %></span><br> 
			<span class="fstv-loc"><%=list.getFstv_eventplace() %></span><br>
			 <span class="fstv-date"><%=list.getFstv_startdate() %> ~ <%=list.getFstv_enddate() %></span>
	</a></li>
	<%} %>
</ul>