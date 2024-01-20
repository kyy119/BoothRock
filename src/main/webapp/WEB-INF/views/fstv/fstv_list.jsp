<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
	<% 
	try{
		for(int i = idx;i < idx + 9 && i < list.size(); i++){
		  	if(list.get(i)!=null){
		  	%>
			<li>
				<a href="fstv/fstv_detail?fstv_no=<%=list.get(i).getFstv_no()%>">
					<% if(list.get(i).getFstv_image().equals("resources/img/no-image.jpg")){  %>
					<img src="${pageContext.request.contextPath}/<%=list.get(i).getFstv_image()%>" alt="">
					<%} else { %>
					<img src="<%=list.get(i).getFstv_image()%>" alt="">
					<%} %>
					<div class="fstv-title"><%=list.get(i).getFstv_title() %></div>
					<div class="fstv-loc"><%=list.get(i).getFstv_banneraddr() %></div>
					<div class="fstv-date"><%=list.get(i).getFstv_startdate() %>~
						<%=list.get(i).getFstv_enddate() %></div>
				</a>
			</li>
		<% }}} catch (Exception e){} %>
</ul>
