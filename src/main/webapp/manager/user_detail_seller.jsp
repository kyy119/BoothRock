<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/user_detail.css" type="text/css">
</head>
<body>
    <%@ include file="admin_header.jsp" %>
    
    <div class="bodywrap">
    	<div class="user-detail-form"> <!-- 페이징 필요 -->
	    	<h1>User Detail</h1>
	    	<h3 class="back">
	    		<a href="user_list.jsp">
	    			User List <i class="fa-solid fa-chevron-right"></i>
	    		</a>
	    	</h3>
	    	<div class="user-detail">
	    		<ul>
		    		<li>
		    			<span class="title">Email</span>
		    			<span>whdgus9696@gmail.com</span>
		    		</li>
		    		<li>
		    			<span class="title">Name</span>
		    			<span>김종현</span>
		    		</li>
		    		<li>
		    			<span class="title">tel</span>
		    			<span>010-2560-5783</span>
		    		</li>
		    		<li>
		    			<span class="title">Created</span>
		    			<span>2024-01-10</span>
		    		</li>
		    		<li>
		    			<span class="title">Updated</span>
		    			<span>2024-01-10</span>
		    		</li>
		    		<li id="seller-number">
		    			<span class="title">Seller Number</span>
		    			<span>192-93-15345</span>
		    		</li>
	    		</ul>
	    		<ul>
		    		<li>
		    			<span class="title">Booth</span>
		    			<span><button>2 건</button></span>
		    		</li>
		    		<li>
		    			<span class="title">False Post</span>
		    			<span><button>0 건</button></span>
		    		</li>
		    		<li>
		    			<span class="title">Review</span>
		    			<span>1 건</span>
		    		</li>
		    		<li>
		    			<span class="title">Ask</span>
		    			<span><button>1 건</button></span>
		    		</li>
		    		<li>
		    			<span class="title">Report</span>
		    			<span><button>0 건</button></span>
		    		</li>
	    		</ul>
	    	</div>
    		<div class="btn">
	    		<button>악성 회원 등록</button>
	    		<button>관리자 권한 부여</button>
	    		<button>회원 정보 삭제</button>
    		</div>
    	</div>
    </div>
    
    <%@ include file="../footer.jsp" %>
    
</body>
</html>
