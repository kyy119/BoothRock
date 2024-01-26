<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.multi.FM.myboothpage.BoothVO"%>

<%
	BoothVO boothDetail = (BoothVO) request.getAttribute("boothDetail");
	HttpSession boothSession = request.getSession();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모든 축제의 부스를 담다 - 부스락</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/booth_review_write.css"
	type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/booth_review_write.js"
	defer type="text/javascript"></script>
	
	<script>
	    var booth_no = <%= boothDetail.getBooth_no() %>;
	    var user_id = '<%= (String) boothSession.getAttribute("id") %>';
	</script>
</head>
<body>
	<%@ include file="../../../header.jsp"%>

	<div class="bodywrap">
		<div class="booth-detail-form">
			<div class="booth-title">
				<h3 class="fstv-title"><%=boothDetail.getFstv_title()%></h3>
				<a href="#" style="display: inline-block"><h1><%=boothDetail.getBooth_name()%></h1></a>
				<span class="booth-type"> | <%=boothDetail.getBooth_category()%></span>
			</div>
			<div class="review-write-form">
				<h2>소중한 리뷰를 남겨주세요</h2>
				<div class="star-point" id="starRating">
					<i class="fa-regular fa-star" data-rating="1"></i> <i
						class="fa-regular fa-star" data-rating="2"></i> <i
						class="fa-regular fa-star" data-rating="3"></i> <i
						class="fa-regular fa-star" data-rating="4"></i> <i
						class="fa-regular fa-star" data-rating="5"></i>
				</div>
				<form class="tag-list" action="javascript:void(0);">
					<p>최대 3개 선택 가능</p>
					<br>
					<ul>
						<li><i class="fa-solid fa-hashtag"> 청결해요</i> <i
							class="fa-regular fa-thumbs-up"></i></li>
						<li><i class="fa-solid fa-hashtag"> 친절해요</i> <i
							class="fa-regular fa-thumbs-up"></i></li>
						<li><i class="fa-solid fa-hashtag"> 가성비가 좋아요 </i> <i
							class="fa-regular fa-thumbs-up"></i></li>
						<li><i class="fa-solid fa-hashtag"> 재방문 의사있어요</i> <i
							class="fa-regular fa-thumbs-up"></i></li>
					</ul>
					<ul>
						<li><i class="fa-solid fa-hashtag"> 퀄리티가 별로에요</i> <i
							class="fa-regular fa-thumbs-down"></i></li>
						<li><i class="fa-solid fa-hashtag"> 불친절해요</i> <i
							class="fa-regular fa-thumbs-down"></i></li>
						<li><i class="fa-solid fa-hashtag"> 위생이 좋지 않아요</i> <i
							class="fa-regular fa-thumbs-down"></i></li>
						<li><i class="fa-solid fa-hashtag"> 가성비가 나빠요</i> <i
							class="fa-regular fa-thumbs-down"></i></li>
					</ul>
					 <input type="submit" value="리뷰 등록하기" onclick="submitReview()">
				</form>
			</div>
		</div>
	</div>

	<%@ include file="../../../footer.jsp"%>

</body>
</html>
