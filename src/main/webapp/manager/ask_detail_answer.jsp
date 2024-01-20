<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/ask_detail.css" type="text/css">
    <script src="resources/js/user_list.js" defer type="text/javascript"></script>
</head>
<body>
    <%@ include file="admin_header.jsp" %>
    
    <div class="bodywrap">
		<div class="ask-form">
			<h3 class="back"><a href="ask_list.jsp">Ask List <i class="fa-solid fa-chevron-right"></i></a></h3>
			<div class="ask-detail">
				<h2>축제 개최일 수정 문의</h2>
				<span class="ask-type">/ 축제 문의</span><br>
				<div class="ask-info">boo****** | 2023-01-15</div>
				<p class="ask-content">
               		멍냥축제 개최측에 전화해 개최일이 3일 미뤄졌다는 답을 받았습니다.<br>
					아직 사이트에 반영이 되지 않은 것 같아 문의드립니다.
				</p>
				<hr>
        	</div>
       		<div class="comment-form">
       			<div class="icon-form">
       				<span>↪</span>
       				<i class="fa-solid fa-user-tie"></i>
       			</div>
       			<h3>관리자</h3>
	            <p class="admin-comment">안녕하세요. 부스樂 페스티벌 매니저입니다.<br>이용에 불편을 끼쳐 죄송합니다. 불편 사항 접수 되었습니다.<br>신속한 조치 취하겠습니다.</p>
			</div>
		</div>
    </div>
    
    <%@ include file="../footer.jsp" %>
    
</body>
</html>
