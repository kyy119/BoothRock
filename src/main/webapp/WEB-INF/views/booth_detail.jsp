<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.multi.FM.myboothpage.BoothVO"%>
<%@ page import="com.multi.FM.booth.BoothProductVO"%>
<%@ page import="java.util.List"%>

<% BoothVO boothDetail = (BoothVO) request.getAttribute("boothDetail"); %>

<% 	HttpSession boothSession = request.getSession();
	String user_id = (String) boothSession.getAttribute("id"); %>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모든 축제의 부스를 담다 - 부스락</title>
<link rel="stylesheet" href="resources/css/booth_detail.css"
	type="text/css">
<script src="resources/js/booth_detail.js?ver=01151712" defer
	type="text/javascript"></script>
<script>
        <c:if test="${showAlert}">
            alert('신고가 성공적으로 제출되었습니다.');
            window.location.href = '/booth_detail?booth_no=${booth_no}';
        </c:if>
    </script>
</head>
<body>
	<%@ include file="../../header.jsp"%>

	<div class="bodywrap">
		<div class="booth-detail-form">
			<div class="booth-title">
				<h3 class="fstv-title"><%= boothDetail.getFstv_title() %></h3>
				<a href="booth_detail.jsp" style="display: inline-block"><%=boothDetail.getBooth_name()%></a>
				<span class="booth-type"> | <%=boothDetail.getBooth_category()%></span>
			</div>
			<div class="booth-menu"
				style="width: 1000px; height: 300px; margin-top: 20px;">
				<div class="booth-img">
					<img alt="부스 이미지" src="<%=boothDetail.getBooth_image()%>">
				</div>
				<div class="booth-item">
					<ul>
						<li class="booth-item-menu"><i
							class="fa-solid fa-chevron-left"></i> 판매 정보 <i
							class="fa-solid fa-chevron-right"></i>
							<div class="boothProduct"></div></li>
					</ul>
				</div>
			</div>
			<div class="booth-info-form">
				<ul class="tabmenu">
					<li class="active" id="tab"><a href="#" class="tab-name">부스
							정보</a>
						<div class="booth-info">
							<ul>
								<li class="booth-intro"><i class="fa-solid fa-quote-left"></i>
									<%=boothDetail.getBooth_introduction()%> <i
									class="fa-solid fa-quote-right"></i></li>
								<li><i class="fa-solid fa-location-dot"
									style="color: #0080ff;"></i> <%=boothDetail.getBooth_addr()%>
								</li>
								<li><i class="fa-solid fa-clock" style="color: #ff8040;"></i>
									<%=boothDetail.getBooth_hours()%></li>
								<li><i class="fa-solid fa-phone" style="color: #00aa00;"></i>
									<%=boothDetail.getBooth_tel()%></li>
							</ul>
							<button class="report" onclick="duplicateReportCheck('<%=user_id %>','<%= request.getParameter("booth_no") %>')">
								 <i class="fa-solid fa-triangle-exclamation"></i> 부스정보 신고하기 
							</button>
						</div></li>
					<li id="tab"><a href="#" class="tab-name">리뷰</a>
						<div class="review-form">
							<a href="booth_review_write.jsp" class="write-review"><i
								class="fa-regular fa-file-lines"></i> 영수증 리뷰쓰기</a>
							<div class="boothDetailReview"></div>
							<a href="booth_review?booth_no=<%=boothDetail.getBooth_no()%>"
								class="review-more">리뷰 더보기 <i
								class="fa-solid fa-chevron-right"></i></a>
						</div></li>
				</ul>
			</div>
		</div>
	</div>

	<%@ include file="../../footer.jsp"%>

</body>
</html>
