<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/mypage_ask.css" type="text/css">
    <link rel="stylesheet" href="resources/css/mypage_side.css" type="text/css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
	    <nav class="side-menu">
	    	<h2>마이페이지</h2>
	   		<ul class="side-navi">
	   			<li><span></span><a href="mypage_edit.jsp">회원정보수정</a></li>
	   			<li><span></span><a href="mypage_jjim.jsp">찜 목록</a></li>
	   			<li><span></span><a href="mypage_review.jsp">내 리뷰보기</a></li>
	   			<li style="font-weight: bold"><span class="stick"></span><a href="mypage_ask.jsp">내 문의내역</a></li>
	   			<li><span></span><a href="mypage_booth.jsp">내 부스관리</a></li>
	   		</ul>
	    </nav>
	    
    	<div class="mypage-form">		<%-- 페이징 필요 --%>
	        <h1>내 문의내역</h1>
	    	<br><hr class="shadow"><br>
	    	<div class="ask-list">
	    		<table>
					<thead>
	    				<tr>
	      					<th>User ID</th>
	      					<th>Type</th>
						    <th>Title</th>
						    <th>Date</th>
	    				</tr>
					</thead>
					<tbody>
	    				<tr>
					      	<td>boo******</td>
					      	<td>축제 문의</td>
					      	<td><a href="mypage_ask_detail.jsp" class="ask-title">축제 개최일 수정 문의</a></td>
					      	<td>2023-01-15</td>
	    				</tr>
	    				<tr>
					      	<td>boo******</td>
					      	<td>축제 문의</td>
					      	<td><a href="#" class="ask-title">문의드립니다.</a></td>
					      	<td>2023-02-05</td>
	    				</tr>
	    				<tr>
					      	<td>boo******</td>
					      	<td>기타 문의</td>
					      	<td><a href="#" class="ask-title">부당 사례 문의</a></td>
					      	<td>2023-03-20</td>
					    </tr>
					</tbody>
				</table>
			</div>
    	</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
