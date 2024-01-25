<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
    String phone_number = (String)request.getParameter("phone_number");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup_type.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.3.js"></script>
    <script>
    	$(function(){
    	  $('.cus-type').click(function(){
    	  	$('#cus-form').submit();
    	  })
    	  $('.seller-type').click(function(){
    	  	$('#seller-form').submit();
    	  })
    	})
    </script>
</head>
<body>
    <%@ include file="../header.jsp" %>
    <%
    	if(phone_number == null){
    %>
    	<script type="text/javascript">
    		alert("전화번호 인증을 먼저 진행해주세요!");
    		location.href="signup_num.jsp";
    	</script>
    <% }else{ %>
    <div class="bodywrap">
    	<div class="signup-type">
    		<h2>사이트 이용 유형을 선택해주세요</h2>
    		<div class="cus-type">
    			<form id="cus-form" action="signup_cus.jsp" method="post">
    			<input type="hidden" name="phone_number" value="${param.phone_number}">
    				<div>
    					<i class="fa-solid fa-users"></i><br>소비자
    				</div>
    				<p>축제를 즐기는 일반 참가자로,<br>축제와 부스의 다양한 활동과<br>판매 상품들의 정보를 탐색하고<br>참여할 수 있습니다.</p>
    			</form>
    		
    		</div>
    		<div class="seller-type">
    			<form id="seller-form" action="signup_seller.jsp" method="post">
    			<input type="hidden" name="phone_number" value="${param.phone_number}">
					<div>
    					<i class="fa-solid fa-store"></i><br>판매자
    				</div>
					<p>사업자 등록번호, 부스 정보,<br>판매하는 상품 또는 서비스에 대한<br>간략한 소개 등을 등록하여<br>사이트에 정보를 제공할 수 있습니다.</p>
				</form>
    		</div>
    	</div>
    </div>
    <% } %>
    <%@ include file="../footer.jsp" %>
    
</body>
</html>