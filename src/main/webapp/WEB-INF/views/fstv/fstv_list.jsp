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
<script>
	function handleFestivalDateStatus(fstv_no, start_date, end_date) {
	    var $li = $('#no-' + fstv_no);
	    if (start_date > current_date) {
	        $li.addClass('fstv-will');				// 축제 예정
	    } else if (end_date < current_date) {
	        $li.addClass('fstv-end');				// 축제 종료
	    } else {
	        $li.addClass('fstv-cur');				// 둘 다 해당하지 않는 경우
	    }
	}
	function convert_to_date(date_string) {
	    var parts = date_string.split('.');
	    return new Date(parts[0], parts[1] - 1, parts[2]);
	}
</script>
<ul>
	<% 
	try{
		for(int i = idx;i < idx + 9 && i < list.size(); i++){
		  	if(list.get(i)!=null){
		  	%>
			<li id="no-<%=list.get(i).getFstv_no()%>" class="">
			<script>
				var current_date = new Date();
				var start_date = convert_to_date('<%=list.get(i).getFstv_startdate() %>');
				var end_date = convert_to_date('<%=list.get(i).getFstv_enddate() %>');
				
				handleFestivalDateStatus(<%=list.get(i).getFstv_no()%>, start_date, end_date);
			</script>
				<a href="fstv/fstv_detail?fstv_no=<%=list.get(i).getFstv_no()%>">
					<% if(list.get(i).getFstv_image().equals("resources/img/no-image.jpg")){  %>
					<img src="${pageContext.request.contextPath}/<%=list.get(i).getFstv_image()%>" alt="">
					<%} else { %>
					<img src="<%=list.get(i).getFstv_image()%>" alt="">
					<%} %>
					<div class="fstv-jjim"><i class="fa-solid fa-heart"></i> <%=list.get(i).getFstv_jjimCount()%></div>
					<div class="fstv-title"><%=list.get(i).getFstv_title() %></div>
					<div class="fstv-loc"><%=list.get(i).getFstv_banneraddr() %></div>
					<div class="fstv-date"><%=list.get(i).getFstv_startdate() %>~
						<%=list.get(i).getFstv_enddate() %></div>
				</a>
			</li>
		<% }}} catch (Exception e){} %>
</ul>
