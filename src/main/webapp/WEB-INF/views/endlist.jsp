<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
	<c:forEach items="${endlist}" var="vo">
	<li>
		<a href="fstv_detail.jsp">
			<img src="${vo.fstv_image}" alt="이미지1">
			<div class="fstv-title">${vo.fstv_title}</div>
			<div class="fstv-loc">${vo.fstv_banneraddr}</div>
			<div class="fstv-date">${vo.fstv_startdate} ~ ${vo.fstv_enddate}</div>
			<p class="fstv-comment">${vo.fstv_eventinfo}</p>
		</a>
	</li>  
	</c:forEach>
</ul>