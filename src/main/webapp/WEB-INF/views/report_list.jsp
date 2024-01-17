<%@page import="com.multi.FM.manager.ReportVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/user_list.css" type="text/css">
    <script src="resources/js/user_list.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="../../admin_header.jsp" %>
    
    <div class="bodywrap">
    	<div class="report-list-form"> <!-- 페이징 필요 -->
	    	<h1>Report List</h1>
	    	<div class="select-search-form">
			    <form action="report_search" id="searchForm">
			    	<select name="type">
			    		<option value="no">No</option>
					    <option value="title">Title</option>
					    <option value="email">Email</option>
					    <option value="booth">Booth</option>
					    <option value="created">Created</option>
			    	</select>
			    	<input name="word" type="text" id="search">
			    	<input type="button" id="submit" value="검색" onclick="searchReport()">
		    	</form>
	    	</div>
	    	<table id="sortableTable">
				<thead>
    				<tr>
      					<th>No <i class="fa-solid fa-caret-down"></i></th>
					    <th>Title</th>
					    <th>Email</th>
					    <th>Booth</th>
					    <th>Created</th>
    				</tr>
				</thead>
				<tbody>
					<%
					ArrayList<ReportVO> list = (ArrayList<ReportVO>)request.getAttribute("report_list");
					for(ReportVO bag: list){
					%>
    				<tr>
				      	<td><%= bag.getReport_no() %></td>
				      	<td><a href="report_detail?report_no=<%= bag.getReport_no() %>"><%= bag.getReport_title() %></a></td>
				      	<td><a href="user_detail.jsp"><%= bag.getUser_id() %></a></td>
				      	<td><a href="booth_detail?booth_no=<%= bag.getBooth_no() %>"><%= bag.getBooth_name() %></a></td>
				      	<td><%= bag.getReport_date() %></td>
				    </tr>
				    <% } %>
				</tbody>
			</table>
    	</div>
    </div>
    
    <%@ include file="../../footer.jsp" %>
    
	<script>
	    function searchReport() {
	    	
	        $.ajax({
	            type: "POST",
	            url: "report_search",
	            data: $('#searchForm').serialize(),
	            success: function (data) {
	                $("tbody").html(data);
	            }
	        });
	    }
	</script>
</body>
</html>
