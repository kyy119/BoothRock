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
    <%@ include file="admin_header.jsp" %>
    
    <div class="bodywrap">
    	<div class="booth-list-form"> <!-- 페이징 필요 -->
	    	<h1>Booth List</h1>
	    	<div class="select-search-form">
	    		<select>
		    		<option>No</option>
		    		<option>Email</option>
		    		<option>Booth</option>
		    		<option>Festival</option>
		    		<option>Reports</option>
		    	</select>
		    	<input type="text" id="search">
		    	<input type="submit" id="submit" value="검색">
	    	</div>
	    	<table>
				<thead>
    				<tr>
      					<th>No</th>
					    <th>Email</th>
					    <th>Booth</th>
					    <th>Festival</th>
					    <th>Reports</th>
					    <th>Ban</th>
					    <th>Delete</th>
    				</tr>
				</thead>
				<tbody>
    				<tr>
				      	<td>1</td>
				      	<td><a href="user_detail.jsp">whdgus9696@daum.net</a></td>
				      	<td><a href="booth_detail.jsp">산수유 떡볶이</a></td>
				      	<td><a href="#">양평 산수유마을 빙어축제</a></td>
				      	<td>0 회</td>
				      	<td><button>등록</button></td>
				      	<td><button>삭제</button></td>
    				</tr>
				</tbody>
			</table>
    	</div>
    </div>
    
    <%@ include file="../footer.jsp" %>
    
</body>
</html>
