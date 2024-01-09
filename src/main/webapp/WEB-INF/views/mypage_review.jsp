<%@page import="java.util.List"%>
<%@page import="com.multi.FM.booth.BoothReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/mypage_review.css"
	type="text/css">
<%
  /* List<ReviewVO> VO = (List<ReviewVO>)request.getAttribute("list"); */
List<BoothReviewVO> VO = (List<BoothReviewVO>) request.getAttribute("list");
System.out.print(VO);
%>
<h1>내 리뷰보기</h1>
<br>
<hr class="shadow">
<br>
<div class="review-list">

	<%
	  for (BoothReviewVO list : VO) {
	%>
	<div class="review-form">
		<i class="fa-solid fa-utensils" id="review-icon"></i>
		<div class="review">
			<div class="star-point">
				<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
					class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
					class="fa-solid fa-star"></i>
			</div> <!-- 세션값으로 유저아이디 -->
			<div class="id-date">user1 | <%=list.getReview_created_at() %></div>
			<h3><%=list.getBooth_name() %></h3>
			<span> / <%=list.getFstv_title() %></span>
			<ul>
				<li><i class="fa-solid fa-hashtag"><%=list.getKeyword1() %></i></li>
				<li><i class="fa-solid fa-hashtag"><%=list.getKeyword2() %></i></li>
				<li><i class="fa-solid fa-hashtag"><%=list.getKeyword3() %></i></li>
			</ul>
		</div>
	</div>
	<%
	  }
	%>

</div>
