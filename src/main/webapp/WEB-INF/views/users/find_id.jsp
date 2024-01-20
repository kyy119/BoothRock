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
	.bodywrap {
		margin: 200px 0px 350px;
		text-align: center;
	}
	.find-id-result {
		width: 380px;
		height: 200px;
		border: 1px solid #000;
		border-radius: 15px;
	}
	.find-id-result .find-id {
		font-size : 25px;
		color: red;
		margin: 50px 0px;
	}
	.find-id-result a button {
		width: 150px;
		height: 40px;
		border-radius: 15px;
		border: 1px solid #808080;
		color: #808080;
		background-color: #fff;
		font-weight: bold;
		font-size: 16px;
	}
	.find-id-result a button:hover {
		background-color: #ddd;
	}
</style>
</head>
<body>
	<%@ include file="../../../header.jsp" %>
	
	<div class="bodywrap">
		<h3><%= notify %></h3><br>
		<div class="find-id-result">
			<% 
				if(find_id_result.equals("0")){
			%>
				<a href="find_id_num.jsp" style="margin-top: 70px;">
					<button>다시 찾기</button>
				</a>
			<%
				}else{
			%>
				<div class="find-id">ID : <%= find_id_result %></div>
				<a href="login.jsp">
					<button>로그인 하러가기</button>
				</a>		
			<%
				}
			%>
		</div>
	</div>
	
	<%@ include file="../../../footer.jsp" %>
</body>
</html>