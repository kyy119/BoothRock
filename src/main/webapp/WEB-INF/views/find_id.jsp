<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String notify = (String)request.getAttribute("find_id_notify");
    	String find_id_result = (String)request.getAttribute("find_id_result");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모든 축제의 부스를 담다 - 부스락</title>
<style>
	.find-id-result {
		width: 380px;
		height: 265px;
		border: 1px solid #000;
		border-radius: 15px;
		text-align: center;
	}
	.find-id-result a button {
		width: 100px;
		height: 100px;
		border-radius: 15px;
		border: 1px solid #808080;
		color: #808080;
		background-color: #fff;
		font-weight: 600;
	}
	.find-id-result a button:hover {
		background-color: #ddd;
	}
	.find-id-result p{
		font-size : 20px;
		color: red;
	}
	.find-id-result h3{
		font-size : 20px;
		color: blue;
	}
</style>
</head>
<body>
	<%@ include file="../../header.jsp" %>
	
	<div class="find-id-result">
		<h3><%= notify %></h3><br>
		<% 
			if(find_id_result.equals("0")){
		%>
			<a href="find_id_num.jsp"><button>다시 찾기</button></a>
		<%
			}else{
		%>
			<p>아이디 : <%= find_id_result %><p><br><br>
			<a href="login.jsp"><button>로그인 하러가기</button></a>		
		<%
			}
		%>
	</div>
	
	<%@ include file="../../footer.jsp" %>
</body>
</html>