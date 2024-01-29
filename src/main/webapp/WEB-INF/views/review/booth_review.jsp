<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.multi.FM.review.BoothReviewVO"%>
<%@ page import="java.util.List"%>
<%
  List<BoothReviewVO> boothReview = (List<BoothReviewVO>) request.getAttribute("boothReview");
HttpSession boothSession = request.getSession();
String user_id = (String) boothSession.getAttribute("id");

int booth_no = (int)boothSession.getAttribute("booth_no");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모든 축제의 부스를 담다 - 부스락</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/booth_review.css"
	type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/booth_review_write.js?ver=0129"
	defer type="text/javascript"></script>
<script>
    const urlParams = new URLSearchParams(window.location.search);
    const booth_no = urlParams.get('booth_no');
</script>
</head>
<body>
	<%@ include file="../../../header.jsp"%>

	<div class="bodywrap">
		<div class="booth-detail-form">
			<div class="booth-title">
				<c:if test="${not empty boothReview}">
					<c:set var="firstReview" value="${boothReview[0]}" />
					<h3 class="fstv-title">${firstReview.getFstv_title()}</h3>
					<a href="#" onclick="goToBoothDetail('<%=booth_no%>');"
						style="display: inline-block">
						<h1>${firstReview.getBooth_name()}</h1>
					</a>
					<span class="booth-type"> |
						${firstReview.getBooth_category()}</span>
				</c:if>
			</div>
			<div class="review-list-form">
				<a href="#" class="write-review"
					onclick="showFileSelector(event,'<%=user_id%>',<%=booth_no%>)"><i
					class="fa-regular fa-file-lines"></i> 영수증 리뷰쓰기</a>
				<ul class="review-ul">
					<c:if test="${not empty boothReview}">
						<c:forEach var="review" items="${boothReview}">
							<li class="review-li"><span class="star-point"> <c:forEach
										begin="1" end="${review.getReview_starpoint()}">
										<i class="fa-solid fa-star"></i>
									</c:forEach>
							</span> <br> <span class="id-date">${review.getUser_id()} |
									${review.getReview_created_at()}</span>
								<ul>
									<li><i class="fa-solid fa-hashtag">${review.getKeyword1()}</i></li>
									<li><i class="fa-solid fa-hashtag">${review.getKeyword2()}</i></li>
									<li><i class="fa-solid fa-hashtag">${review.getKeyword3()}</i></li>
								</ul></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

	<%@ include file="../../../footer.jsp"%>

</body>
</html>