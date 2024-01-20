<%@page import="com.multi.FM.manager.AskVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% AskVO vo = (AskVO)request.getAttribute("ask_detail"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ask_detail.css" type="text/css">
    <script src="resources/js/user_list.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="../../../manager/admin_header.jsp" %>
    
    <div class="bodywrap">
		<div class="ask-form">
			<h3 class="back">
				<a href="ask_list">Ask List <i class="fa-solid fa-chevron-right"></i></a>
			</h3>
			<div class="ask-detail">
				<h2><%= vo.getAsk_title() %></h2>
				<span class="ask-type">/ <%= vo.getAsk_type() %></span><br>
				<div class="ask-info"><%= vo.getUser_id() %> | <%= vo.getAsk_created_at() %></div>
				<p class="ask-content">
               		<%= vo.getAsk_content() %>
				</p>
				<hr>
        	</div>
       		<div class="comment-form">
       			<div class="icon-form">
       				<span>↪</span>
       				<i class="fa-solid fa-user-tie"></i>
       			</div>
       			<textarea><%= vo.getAsk_answer() %></textarea>
       			<button>답변 등록</button>
			</div>
		</div>
    </div>
    
    <%@ include file="../../../footer.jsp" %>
    
</body>
</html>
