<%@page import="com.multi.FM.fstv.FestivalBoothVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<FestivalBoothVO> list = (List<FestivalBoothVO>)request.getAttribute("list");
	int idx = 0;	
	for(int i = 0; i < (list.size() / 4)+1; i++){
%>
<ul>
	<% 
	try{
		for(int j = 0; j < 4; j++){ %>
	<li>
		<a href="../booth/booth_detail?booth_no=<%=list.get(idx).getBooth_no()%>">
			<img src="<%=list.get(idx).getBooth_image()%>" alt="이미지1">
			<div class="booth-title"><%=list.get(idx).getBooth_name()%></div>
			<div class="booth-type"><%=list.get(idx).getBooth_category()%></div>
			<span><i class="fa-solid fa-star"> <%=list.get(idx).getBooth_starpoint()%></i></span>
		</a>
	</li>
	<% idx++; }} catch (Exception e){} %>
</ul>
<% }%>