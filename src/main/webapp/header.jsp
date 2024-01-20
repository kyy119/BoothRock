<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.3.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/header.js" defer type="text/javascript"></script>
	<script src="https://kit.fontawesome.com/fdb840a8cc.js" crossorigin="anonymous"></script>
    
    <header>
        <div class="wrap">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/main.jsp">
					<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="로고">
                </a>
            </div>
            <nav class="menu">
                <ul class="navi">
                    <li><a href="${pageContext.request.contextPath}/fstv_list.jsp">축제리스트</a></li>
                    <li><a href="${pageContext.request.contextPath}/fstv_map.jsp">전국축제지도</a></li>
                    <li><a href="#">고객센터</a>
                        <ul class="sub-menu">
                            <li><a href="cs_question.jsp">자주 묻는 질문</a></li>
                            <li><a href="cs_ask.jsp">문의하기</a></li>
                        </ul>
                    </li>
                    <li class="input-line">
                    	<form action="fstv/fstv_search">
                    		<input name="q" placeholder="검색어를 입력해주세요."><button class="search" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                    	</form>
                    </li>
                </ul>
            </nav>
            <div class="user-btn">
            	<% 
            		if(session.getAttribute("id") == null){
            	%>
	            	<ul>
	                    <li><a href="users/login.jsp">로그인</a></li>		<%-- 로그인 세션을 받아오면 로그아웃/마이페이지로 변경 --%>
	                    <li><a href="signup_num.jsp">회원가입</a></li>
	                </ul>
                <% }else if("admin".equals(session.getAttribute("role"))){ %>
                 	<ul>
                    	<li><a href="logout.jsp">로그아웃</a></li>		 
                    	<li><a href="manager/admin_main.jsp" class="admin">관리자페이지</a></li>
                	</ul>
                <% } else { %>
		            <ul>
		            	<li><a href="logout.jsp">로그아웃</a></li>		 
		            	<li><a href="mypage.jsp" class="mypage">마이페이지</a></li>
		        	</ul>
               <% } %>
            </div>
        </div>
    </header>