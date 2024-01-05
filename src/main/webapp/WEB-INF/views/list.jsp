<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
	<c:forEach var="list" items="${list}">
		<li>
			<i class="fa-regular fa-heart"></i>
			<a href="fstv_detail.jsp">
				<img src="${list.fstv_image}" alt="resources/img/no-image.jpg">
				<div class="fstv-title">${list.fstv_title}</div>
				<div class="fstv-loc">${list.fstv_banneraddr}</div>
				<div class="fstv-date">${list.fstv_startdate} ~ ${list.fstv_enddate}</div>
			</a>
		</li>
	</c:forEach>
</ul>  
