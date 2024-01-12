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
    	<div class="ban-list-form"> <!-- 페이징 필요 -->
	    	<h1>User Ban List</h1>
	    	<div class="select-search-form">
	    		<select>
		    		<option>Name</option>
		    		<option>Email</option>
		    		<option>Tel</option>
		    		<option>Created</option>
		    		<option>Updated</option>
		    		<option>F / C</option>
		    	</select>
		    	<input type="text" id="search">
		    	<input type="submit" id="submit" value="검색">
	    	</div>
	    	<table>
				<thead>
    				<tr>
					    <th>Name</th>
      					<th>Email</th>
      					<th class="type-select">
      						<select>
      							<option>Type</option>
      							<option>소비자</option>
      							<option>판매자</option>
      						</select>
      					</th>
					    <th>Tel</th>
					    <th>Created <i class="fa-solid fa-caret-down"></i></th>
					    <th>Updated <i class="fa-solid fa-caret-down"></i></th>
					    <th>F / C</th>
    				</tr>
				</thead>
				<tbody>
    				<tr>
				      	<td>김유미</td>
				      	<td><a href="user_detail.jsp">yumii2307@naver.com</a></td>
				      	<td>소비자</td>
				      	<td>010-5706-2307</td>
				      	<td>2024-01-10</td>
				      	<td>2024-01-10</td>
				      	<td>2 회</td>
    				</tr>
    				<tr>
				      	<td>김종현</td>
				      	<td><a href="user_detail.jsp">whdgus9696@daum.net</a></td>
				      	<td>판매자</td>
				      	<td>010-2560-5783</td>
				      	<td>2024-01-10</td>
				      	<td>2024-01-10</td>
				      	<td>2 회</td>
    				</tr>
				</tbody>
			</table>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
