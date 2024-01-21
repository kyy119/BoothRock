<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@page import="com.multi.FM.booth.BoothReviewVO"%>

<% List<BoothReviewVO> boothDetailReview = (List<BoothReviewVO>) request.getAttribute("boothDetailReview");%>


<link rel="stylesheet" href="resources/css/booth_detail.css"
	type="text/css">
	
<ul class="review-ul">
<c:if test="${not empty boothDetailReview}">
    <c:forEach var="review" items="${boothDetailReview}" varStatus="loop">
        <c:if test="${loop.index le 1}">
            <li class="review-li">
                <span class="star-point">
                    <c:forEach begin="1" end="${review.getReview_starpoint()}">
                        <i class="fa-solid fa-star"></i>
                    </c:forEach>
                </span>
                <br>
                <span class="id-date">${review.getUser_id()} | ${review.getReview_created_at()}</span>
                <ul>
                    <li><i class="fa-solid fa-hashtag">${review.getKeyword1()}</i></li>
                    <li><i class="fa-solid fa-hashtag">${review.getKeyword2()}</i></li>
                    <li><i class="fa-solid fa-hashtag">${review.getKeyword3()}</i></li>
                </ul>
            </li>
        </c:if>
    </c:forEach>
</c:if>
</ul>