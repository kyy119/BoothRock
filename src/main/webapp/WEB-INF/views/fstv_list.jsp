<%@page import="com.multi.FM.fstv.FestivalVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int idx = (int)request.getAttribute("idx");
	List<FestivalVO> list = (List<FestivalVO>)request.getAttribute("list");
%>
<ul>
	<% for(int i = idx; i<idx+9;i++){
	  	if(list.get(i)!=null){
	  	%>
		<li><i class="fa-regular fa-heart"></i> <a href="fstv_detail?fstv_no=<%=list.get(i).getFstv_no()%>">
				<img src="<%=list.get(i).getFstv_image() %>" alt="resources/img/no-image.jpg">
				<div class="fstv-title"><%=list.get(i).getFstv_title() %></div>
				<div class="fstv-loc"><%=list.get(i).getFstv_banneraddr() %></div>
				<div class="fstv-date"><%=list.get(i).getFstv_startdate() %>~
					<%=list.get(i).getFstv_enddate() %></div>
		</a></li>
	<% }} %>
</ul>
