<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
	<c:forEach items="${list}" var="vo">
		<li>
			<a href="booth/booth_detail?booth_no=${vo.booth_no}">
				<div class="fstv-title">${vo.fstv_title}</div>
				<div class="booth-title">${vo.booth_name}</div>
				<div class="star-point"><i class="fa-solid fa-star"> ${vo.booth_starpoint}</i></div>
		        <hr>
		        <p class="booth-comment">${vo.booth_introduction}</p>	
			</a>
		</li>  
	</c:forEach>
</ul>