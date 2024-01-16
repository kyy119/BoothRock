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
	    		<select>
		    		<option>No</option>
		    		<option>Title</option>
		    		<option>Email</option>
		    		<option>Booth</option>
		    		<option>Created</option>
		    	</select>
		    	<input type="text" id="search">
		    	<input type="submit" id="submit" value="검색">
	    	</div>
	    	<table>
				<thead>
    				<tr>
      					<th>No</th>
					    <th>Title</th>
					    <th>Email</th>
					    <th>Booth</th>
					    <th>Created <i class="fa-solid fa-caret-down"></i></th>
    				</tr>
				</thead>
				<tbody>
					<%
					ArrayList<ReportVO> list = (ArrayList<ReportVO>)request.getAttribute("report_list");
					for(ReportVO bag: list){
					%>
    				<tr>
				      	<td><%= bag.getReport_no() %></td>
				      	<td><a href="report_detail.jsp"><%= bag.getReport_title() %></a></td>
				      	<td><a href="user_detail.jsp"><%= bag.getUser_id() %></a></td>
				      	<td><a href="booth_detail.jsp"><%= bag.getBooth_name() %></a></td>
				      	<td><%= bag.getReport_date() %></td>
				    </tr>
				    <% } %>
				</tbody>
			</table>
    	</div>
    </div>
    
    <%@ include file="../../footer.jsp" %>
    
</body>
</html>
