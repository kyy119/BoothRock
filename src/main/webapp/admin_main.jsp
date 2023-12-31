<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/admin_main.css" type="text/css">
</head>
<body>
    <%@ include file="admin_header.jsp" %>
    
    <div class="bodywrap">
    	<div class="admin-main-form">
	    	<div>
	    		<h2>User</h2>
	    		<a href="user_list.jsp">
	    			<span>회원 관리</span>
	    			<p>회원 조회 및 수정, 삭제</p>
	    			<p>악성 회원 등록</p>
	    			<p>관리자 권한 부여</p>
	    		</a>
	    		<a href="ban_list.jsp">
	    			<span>악성 회원 관리</span>
	    			<p>악성 회원 조회 및 등록 해제</p>
	    		</a>
	    	</div>
	    	<div>
	    		<h2>Booth</h2>
	    		<a href="booth_list.jsp">
	    			<span>부스 게시물 관리</span>
	    			<p>게시물 조회 및 수정, 삭제</p>
	    			<p>허위 게시물 등록 및 조회, 해제</p>
	    		</a>
	    	</div>
	    	<div>
	    		<h2>Report / Ask</h2>
	    		<a href="report.jsp">
	    			<span>신고 내역 관리</span>
	    			<p>신고 리스트 조회 및 세부내역 열람</p>
	    			<p>신고에 따른 부스 제재</p>
	    			<p>허위 신고 등록 및 리스트 조회</p>
	    		</a>
	    		<a href="ask_list.jsp">
	    			<span>문의 내역 관리</span>
	    			<p>문의 리스트 조회 및 삭제</p>
	    			<p>문의 답글 등록</p>
	    		</a>
	    	</div>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
