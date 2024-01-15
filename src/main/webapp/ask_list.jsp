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
    	<div class="ask-list-form"> <!-- 페이징 필요 -->
	    	<h1>Ask List</h1>
	    	<div class="select-search-form">
	    		<select>
		    		<option>No</option>
		    		<option>Title</option>
		    		<option>Type</option>
		    		<option>Email</option>
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
      					<th class=type-select>
      						<select>
      							<option>Type</option>
      							<option>축제 문의</option>
      							<option>부스 문의</option>
      							<option>기타 문의</option>
      						</select>
      					</th>
					    <th>Email</th>
					    <th>Created <i class="fa-solid fa-caret-down"></i></th>
					    <th>Response</th>
    				</tr>
				</thead>
				<tbody>
    				<tr>
				      	<td>2</td>
				      	<td><a href="ask_detail_answer.jsp">축제 날짜가 이상해요</a></td>
				      	<td>축제 문의</td>
				      	<td><a href="user_detail_seller.jsp">whdgus9696@daum.net</a></td>
				      	<td>2024-01-11</td>
				      	<td><i class="fa-solid fa-check"></i></td>
				    </tr>
    				<tr>
				      	<td>1</td>
				      	<td><a href="ask_detail.jsp">연예인 누구 온다는데 맞아요?</a></td>
				      	<td>기타 문의</td>
				      	<td><a href="user_detail_cus.jsp">yumii2307@naver.com</a></td>
				      	<td>2024-01-11</td>
				      	<td></td>
    				</tr>
				</tbody>
			</table>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
