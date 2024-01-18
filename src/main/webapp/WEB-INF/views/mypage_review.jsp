<%@page import="java.util.List"%>
<%@page import="com.multi.FM.booth.BoothReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/mypage_review.css"
	type="text/css">
<%
List<BoothReviewVO> VO = (List<BoothReviewVO>) request.getAttribute("list");
%>
<h1>내 리뷰보기</h1>
<br>
<hr class="shadow">
<br>
<div class="review-list">
	<%
	if(VO.size()>0){
	  for (BoothReviewVO list : VO) { 
	%>
	<div class="review-form">
		<%
		  if (list.getBooth_category().equals("food")) { //카테고리별 이미지
		%>
		<i class="fa-solid fa-utensils" id="review-icon"></i>
		<%
		  } else {
		%>
		<i class="fa-solid fa-rocket" id="review-icon"></i>
		<%
		  }
		%>
		<div class="review">
			<div class="star-point">
				<%
				  for (int i = 0; i < 5; i++) {
				  if (i < list.getReview_starpoint()) { //별점
				%>
				<i class="fa-solid fa-star"></i>
				<%
				  } else {
				%>
				<i class="fa-regular fa-star"></i>
				<%
				  }
				}
				%>
			</div>
			<!-- 세션값으로 유저아이디 -->
			<div class="id-date">
				<%=list.getUser_id() %> |
				<%=list.getReview_created_at()%></div>
			<h3><%=list.getBooth_name()%></h3>
			<span> / <%=list.getFstv_title()%></span>
			<ul>
				<li><i class="fa-solid fa-hashtag"><%=list.getKeyword1()%></i></li>
				<li><i class="fa-solid fa-hashtag"><%=list.getKeyword2()%></i></li>
				<li><i class="fa-solid fa-hashtag"><%=list.getKeyword3()%></i></li>
			</ul>
		</div>
	</div>
	<%
	  } 
	} else {
	%>
		<div id="no-review">리뷰가 없습니다.</div>
	<%} %>
</div>
