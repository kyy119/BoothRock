<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.multi.FM.review.BoothReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/mypage_review.css"
	type="text/css">
<%
List<BoothReviewVO> VO = (List<BoothReviewVO>) request.getAttribute("list");
%>
<script type="text/javascript" defer>
  $(document).ready(function() { 						// 버튼 클릭 시 동작
    $('.more').on('click', function() {
    	let cnt = $(this).attr('data-more');
    	let review_cnt = '.review-form'+cnt; 			// 버튼 클릭시 보여줄 리뷰
    	let more_cnt = '#more'+cnt;						// 버튼 클릭시 사라질 더보기 버튼
    	let next_more = '#more' + (parseInt(cnt) + 1);	// 버튼 클릭시 보여질 다음 더보기 버튼
    	$(review_cnt).show();
    	$(more_cnt).hide();
    	$(next_more).show();
    });//click
  }); //document
  $('.review-form0').show();						    //처음 리뷰 3개 보여주기
  $('#more1').show();
</script>
<h1>내 리뷰보기</h1>
<br>
<hr class="shadow">
<br>
<div class="review-list">
	<%
	if(VO.size()>0){
	  for (int i = 0; i < VO.size(); i++) {
	    BoothReviewVO list = VO.get(i);
	%>
	<div class="review-form review-form<%=i/3%>" style='display:none'>
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
			<a href="booth/booth_detail?booth_no=<%=list.getBooth_no() %>">
				<h3><%=list.getBooth_name()%></h3>
				<span> / <%=list.getFstv_title()%></span>
				<div class="star-point">
					<%
					for (int j = 0; j < 5; j++) {
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
				<ul>
					<li><i class="fa-solid fa-hashtag"><%=list.getKeyword1()%></i></li>
					<li><i class="fa-solid fa-hashtag"><%=list.getKeyword2()%></i></li>
					<li><i class="fa-solid fa-hashtag"><%=list.getKeyword3()%></i></li>
				</ul>
			</a>
		</div>
	
	</div> <!-- review-form 태그  -->
	<% /* 더보기  */
	if (i%3 == 2 && VO.size()>3) {
	%>
	
	<div class="more" id="more<%=i/3+1 %>" data-more="<%=i/3+1%>" style="display:none;">더보기</div>
	
	<% } %>
	
	<%  } /* for문 */
	 
	} else {
	%>
		<div id="no-review">리뷰가 없습니다.</div>
	<%} %>
</div>
