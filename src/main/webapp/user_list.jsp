<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/user_list.css" type="text/css">
</head>
<body>
    <%@ include file="admin_header.jsp" %>
    
    <div class="bodywrap">
    	<div class="user-list-form"> <!-- 페이징 필요 -->
	    	<h1>User List</h1>
	    	<table>
				<thead>
    				<tr>
      					<th>ID</th>
      					<th class=type-select>
      						<select>
      							<option>Type</option>
      							<option>소비자</option>
      							<option>판매자</option>
      							<option>관리자</option>
      						</select>
      					</th>
					    <th>Name</th>
					    <th>Tel</th>
					    <th>Created</th>
					    <th>Updated</th>
					    <th>Selling Num</th>
					    <th>U / D</th>
					    <th>Admin</th>
					    <th>Ban</th>
    				</tr>
				</thead>
				<tbody>
    				<tr>
				      	<td>Boothrock</td>
				      	<td>관리자</td>
				      	<td>Admin</td>
				      	<td>010-1234-5678</td>
				      	<td>2024-01-10</td>
				      	<td>2024-01-10</td>
				      	<td></td>
				      	<td>
				      		<button onclick="location.href = 'user_edit.jsp'">수정</button>
				      		<button>삭제</button>
				      	</td>
				      	<td><button>권한 해제</button></td>
				      	<td></td>
				    </tr>
    				<tr>
				      	<td>yumii2307</td>
				      	<td>소비자</td>
				      	<td>김유미</td>
				      	<td>010-5706-2307</td>
				      	<td>2024-01-10</td>
				      	<td>2024-01-10</td>
				      	<td></td>
				      	<td>
				      		<button>수정</button>
				      		<button>삭제</button>
				      	</td>
				      	<td><button>권한 부여</button></td>
				      	<td>
				      		<button>등록</button>
				      	</td>
    				</tr>
    				<tr>
				      	<td>whdgus9696</td>
				      	<td>판매자</td>
				      	<td>김종현</td>
				      	<td>010-2560-5783</td>
				      	<td>2024-01-10</td>
				      	<td>2024-01-10</td>
				      	<td>387-50-65201</td>
				      	<td>
				      		<button>수정</button>
				      		<button>삭제</button>
				      	</td>
				      	<td><button>권한 부여</button></td>
				      	<td>
				      		<button>등록</button>
				      	</td>
    				</tr>
				</tbody>
			</table>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
