<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@page import="com.multi.FM.booth.BoothReviewVO"%>
<%@page import="com.multi.FM.myboothpage.BoothVO"%>
<%@ page import="java.util.List" %>
<% BoothVO Rbooth = (BoothVO)request.getAttribute("Rbooth"); %>
<% List<BoothReviewVO> boothReview = (List<BoothReviewVO>) request.getAttribute("boothReview");%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/booth_review.css" type="text/css">
</head>
<body>
    <%@ include file="../../header.jsp" %>
    
    <div class="bodywrap">
    	<div class="booth-detail-form">
	    	<div class="booth-title">
				<!-- <h3 class="fstv-title">양평 산수유마을 빙어축제</h3> -->
	    		<c:if test="${not empty Rbooth}">
                    <a href="booth_detail.jsp" style="display: inline-block"><h1> <%=Rbooth.getBooth_name() %></h1></a>
                    <span class="booth-type"> | <%=Rbooth.getBooth_category() %></span>
                </c:if>
            </div>
            <div class="review-list-form">
                <a href="booth_review_write.jsp" class="write-review"><i class="fa-regular fa-file-lines"></i> 영수증 리뷰쓰기</a>
                <ul class="review-ul">
                    <c:if test="${not empty boothReview}">
                        <c:forEach var="review" items="${boothReview}">
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
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    
    <%@ include file="../../footer.jsp" %>

</body>
</html>