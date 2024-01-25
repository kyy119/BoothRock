<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_header.css" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.3.js"></script>
	<script src="https://kit.fontawesome.com/fdb840a8cc.js" crossorigin="anonymous"></script>
    
    <header>
        <div class="wrap">
            <a href="admin_main.jsp">
	            <div class="logo">
					<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="로고">
	            </div>
				<div class="logo-admin">
					<div>Admin</div>
				</div>
            </a>

            <div class="user-btn">
                <ul>
					<li><a href="#" class="data-update">GET API</a></li>
                    <li><a href="../main.jsp" class="main">메인페이지</a></li>
                    <li><a href="../logout.jsp" class="logout">로그아웃</a></li>
                </ul>
            </div>
        </div>
    </header>