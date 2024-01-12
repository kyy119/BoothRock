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
					    <th>Email</th>
					    <th>Title</th>
					    <th>Booth</th>
					    <th>Created <i class="fa-solid fa-caret-down"></i></th>
    				</tr>
				</thead>
				<tbody>
    				<tr>
				      	<td>2</td>
				      	<td><a href="user_detail.jsp">whdgus9696@daum.net</a></td>
				      	<td><a href="report_detail.jsp">부스 날짜가 이상해요</a></td>
				      	<td><a href="booth_detail.jsp">임실 치즈 축제</a></td>
				      	<td>2024-01-11</td>
				    </tr>
    				<tr>
				      	<td>1</td>
				      	<td><a href="user_detail.jsp">yumii2307@naver.com</a></td>
				      	<td><a href="ask_detail.jsp">삼촌네 떡볶이에 삼촌이 없어요</a></td>
				      	<td><a href="booth_detail.jsp">삼촌네 떡볶이</a></td>
				      	<td>2024-01-11</td>
    				</tr>
				</tbody>
			</table>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
