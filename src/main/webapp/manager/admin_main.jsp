<%
    String role = (String) session.getAttribute("role");

    if (role == null || !"admin".equals(role)) {
        response.sendRedirect("access_denied.jsp");
        return;
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_main.css" type="text/css">
</head>
<body>
    <%@ include file="admin_header.jsp" %>
    
    <div class="bodywrap">
    	<div class="admin-main-form">
	    	<div>
	    		<a href="common_user_list1?user_black=0">
	    			<i class="fa-regular fa-user"></i>
	    			<span>회원 관리</span>
	    			<p>회원 조회 및 수정, 삭제</p>
	    			<p>악성 회원 등록</p>
	    			<p>관리자 권한 부여</p>
	    		</a>
	    		<a href="common_user_list1?user_black=1">
	    			<i class="fa-solid fa-user-slash"></i>
	    			<span>악성 회원 관리</span>
	    			<p>악성 회원 조회 및 등록 해제</p>
	    		</a>
	    	</div>
	    	<div>
	    		<a href="booth_list">
	    			<i class="fa-regular fa-paste"></i>
	    			<span>부스 게시물 관리</span>
	    			<p>게시물 조회 및 수정, 삭제</p>
	    			<p>허위 게시물 등록</p>
	    		</a>
	    		<a href="ban_booth_list">
	    			<i class="fa-solid fa-paste"></i>
	    			<span>허위 게시물 관리</span>
	    			<p>허위 게시물 조회 및 해제</p>
	    		</a>
	    	</div>
	    	<div>
	    		<a href="report_list">
	    			<i class="fa-solid fa-land-mine-on"></i>
	    			<span>신고 내역 관리</span>
	    			<p>신고 리스트 조회 및 세부내역 열람</p>
	    			<p>신고에 따른 부스 제재</p>
	    			<p>허위 신고 등록 및 리스트 조회</p>
	    		</a>
	    		<a href="ask_list">
	    			<i class="fa-regular fa-envelope"></i>
	    			<span>문의 내역 관리</span>
	    			<p>문의 리스트 조회 및 삭제</p>
	    			<p>문의 답글 등록</p>
	    		</a>
	    	</div>
    	</div>
    </div>
    
    <%@ include file="../footer.jsp" %>
    
</body>
</html>
