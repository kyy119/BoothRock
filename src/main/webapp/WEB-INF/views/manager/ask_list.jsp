<%@page import="com.multi.FM.manager.AskVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user_list.css" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/js/user_list.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="../../../manager/admin_header.jsp" %>
    
    <div class="bodywrap">
    	<div class="ask-list-form"> <!-- 페이징 필요 -->
	    	<h1>Ask List</h1>
	    	<div class="select-search-form">
	    		<select name="type">
		    		<option value="no">No</option>
		    		<option value="title">Title</option>
		    		<option value="email">Email</option>
		    		<option value="created">Created</option>
		    	</select>
		    	<input name="word" type="text" id="search">
		    	<input type="button" id="submit" value="검색" onclick="search()">
	    	</div>
	    	<table id="sortTable">
				<thead>
    				<tr>
      					<th>No <i class="fa-solid fa-caret-down"></i></th>
					    <th>Title</th>
      					<th class="type-select">
      						<select>
      							<option>Type</option>
      							<option>축제 문의</option>
      							<option>부스 문의</option>
      							<option>기타 문의</option>
      						</select>
      					</th>
					    <th>Email</th>
					    <th>Created</th>
					    <th>Response</th>
    				</tr>
				</thead>
				<tbody>
					<%
					ArrayList<AskVO> list = (ArrayList<AskVO>)request.getAttribute("ask_list");
					for(AskVO bag: list){
					%>
    				<tr>
				      	<td><%= bag.getAsk_no() %></td>
				      	<td><a href="ask_detail?ask_no=<%= bag.getAsk_no() %>"><%= bag.getAsk_title() %></a></td>
				      	<td><%= bag.getAsk_type() %></td>
				      	<td><a href="user_detail_seller.jsp"><%= bag.getUser_id() %></a></td>
				      	<td><%= bag.getAsk_created_at() %></td>
				      	<td><i class="fa-solid fa-check"></i></td>
				    </tr>
    				<% } %>
				</tbody>
			</table>
    	</div>
    </div>
    
    <%@ include file="../../../footer.jsp" %>
    
    <script>
	    function searchAsk() {
	    	
	        $.ajax({
	            type: "POST",
	            url: "manager/ask_search",
	            data: $('#searchForm').serialize(),
	            success: function (data) {
	                $("tbody").html(data);
	            }
	        });
	    }
	</script>
    
</body>
</html>
