<%@page import="com.multi.FM.manager.AskVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% AskVO vo = (AskVO) request.getAttribute("vo"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ask_detail.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
	<script>
    	$(document).ready(function() {
    		var ask_no = <%= vo.getAsk_no() %>;
	        function update_ask(action, message) {
    			var answer = $('#ask_answer').val();
	            $.ajax({
	                type: "POST",
	                url: action,
	                data: {
							ask_no: ask_no,
	                		ask_answer: answer
	                		},
	                success: function(data) {
	                    alert(message);
	                    window.location.href = 'ask_list';
	                }
	            });
	        }

	        $(".insert_answer").on("click", function() {
	        	update_ask("update_ask", "문의 답변 등록이 완료되었습니다.");
	        });
	    });
    </script>
</head>
<body>
    <%@ include file="../../../manager/admin_header.jsp" %>
    
    <div class="bodywrap">
		<div class="ask-form">
			<h3 class="back">
				<a href="ask_list">Ask List <i class="fa-solid fa-chevron-right"></i></a>
			</h3>
			<div class="ask-detail">
				<h2>${vo.ask_title}</h2>
				<span class="ask-type">/ ${vo.ask_type}</span><br>
				<div class="ask-info"><a class="user-id" href="user_detail?user_id=${vo.user_id}">${vo.user_id}</a> | ${vo.ask_created_at}</div>
				<p class="ask-content">
               		${vo.ask_content}
				</p>
				<hr>
        	</div>
       		<div class="comment-form">
       			<div class="icon-form">
       				<span>↪</span>
       				<i class="fa-solid fa-user-tie"></i>
       			</div>
       			<c:if test="${vo.ask_answer == null}">
       				<textarea id="ask_answer"></textarea>
	       			<button class="insert_answer">답변 등록</button>
       			</c:if>
       			<c:if test="${vo.ask_answer != null}">
       				<p class="admin-comment">${vo.ask_answer}</p>
       			</c:if>
			</div>
		</div>
    </div>
    
    <%@ include file="../../../footer.jsp" %>
    
</body>
</html>
