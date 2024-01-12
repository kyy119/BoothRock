<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/report_detail.css" type="text/css">
</head>
<body>
    <%@ include file="admin_header.jsp" %>
    
    <div class="bodywrap">
		<div class="report-form">
			<div class="report-booth">
				<h3 class="booth-title">삼촌네 떡볶이</h3><span> / 서울 광장시장</span>
				<h3 class="back">
					<a href="report_list.jsp">
						Report List <i class="fa-solid fa-chevron-right"></i>
					</a>
				</h3>
			</div>
			<div class="report-detail">
				<h2>삼촌네 떡볶이에</h2>
				<div class="report-info">boothrock | 2023-01-15</div><br>
				<p class="report-content">
               		삼촌이 없고 떡볶이가 맛없어요
				</p>
        	</div>
        	<div class="btn">
        		<button>판매자 상세 페이지</button>
        		<button>부스 상세 페이지</button>
        		<button>허위 신고 등록</button>
        		<button>부스 신고 누적</button>
        	</div>
		</div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
