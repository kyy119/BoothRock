<%@page import="com.multi.FM.fstv.FestivalVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul>
	<c:forEach items="${list}" var="vo">
		<li>
			<a href="fstv/fstv_detail?fstv_no=${vo.fstv_no}">
				<img src="${vo.fstv_image}" alt="resources/img/no-image.jpg">
				<div class="fstv-title">${vo.fstv_title}</div>
				<div class="fstv-loc">${vo.fstv_addr1}</div>
				<div class="fstv-date">${vo.fstv_startdate} ~ ${vo.fstv_enddate}</div>
			</a>
		</li>
	</c:forEach>
</ul>
