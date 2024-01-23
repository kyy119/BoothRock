<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.multi.FM.users.UsersVO"%>
<% UsersVO vo = (UsersVO)request.getAttribute("user_detail"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user_detail.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <script>
    	$(document).ready(function() {
	        $('.user_role').each(function() {
	            var user_role = $(this).text();
	
	            switch (user_role) {
	                case 'admin':
	                    $(this).text('관리자');
	                    break;
	                case 'consumer':
	                    $(this).text('소비자');
	                    break;
	                case 'seller':
	                    $(this).text('판매자');
	                    break;
	            }
	        });
	        
	        $("a").on("click", function(event) {
	            if ($(this).text() === '0 건') {
	              event.preventDefault();
	              alert('검색 정보가 없습니다.');
	            }
	        });
	        
	        function update_user(action, message) {
	            $.ajax({
	                type: "POST",
	                url: action,
	                data: { user_id: '<%= vo.getUser_id() %>' },
	                success: function(data) {
	                    alert(message);
	                    if (<%= vo.getUser_black() %> == 1) {
	                        window.location.href = 'ban_user_list';
	                    } else {
	                        window.location.href = 'user_list';
	                    }
	                }
	            });
	        }

	        $(".update_user").on("click", function() {
	        	update_user("update_user", "악성 회원 변경이 완료되었습니다.");
	        });
	        
	        $(".update_admin").on("click", function() {
	        	update_user("update_admin", "관리자 권한 변경이 완료되었습니다.");
	        });
	        
	        $(".update_seller").on("click", function() {
	        	update_user("update_seller", "판매자 권한 변경이 완료되었습니다.");
	        });
	    });
    </script>
</head>
<body>
    <%@ include file="../../../manager/admin_header.jsp" %>
    
    <div class="bodywrap">
    	<div class="user-detail-form"> <!-- 페이징 필요 -->
	    	<h1>User Detail</h1>
    		<c:if test="${not empty user_detail}">
	    	<h3 class="back">
	    		<c:if test="${user_detail.user_black == 0}">
		    		<a href="user_list">
		    			User List <i class="fa-solid fa-chevron-right"></i>
		    		</a>
	    		</c:if>
	    		<c:if test="${user_detail.user_black == 1}">
		    		<a href="ban_user_list">
		    			Ban User List <i class="fa-solid fa-chevron-right"></i>
	    			</a>
	    		</c:if>
	    	</h3>
	    		<div class="user-detail">
		    		<ul>
			    		<li>
			    			<span class="title">Email</span>
			    			<span>${user_detail.user_id}</span>
			    		</li>
			    		<li>
			    			<span class="title">Name</span>
			    			<span>${user_detail.user_name}</span>
			    		</li>
			    		<li>
			    			<span class="title">Type</span>
			    			<c:choose>
								<c:when test="${user_detail.user_role == 'consumer' && user_detail.selling_number != null}">
			    					<span class="user_role" style="color: blue;">${user_detail.user_role}</span>
								</c:when>
								<c:otherwise>
								    <span class="user_role">${user_detail.user_role}</span>
								</c:otherwise>
							</c:choose>
			    		</li>
			    		<li>
			    			<span class="title">tel</span>
			    			<span>${user_detail.user_tel}</span>
			    		</li>
			    		<li>
			    			<span class="title">Created</span>
			    			<span>${user_detail.user_created_at}</span>
			    		</li>
			    		<li>
			    			<span class="title">Updated</span>
			    			<span>${user_detail.user_updated_at}</span>
			    		</li>
			    		<c:if test="${user_detail.selling_number != null}">
				    		<li id="seller-number">
				    			<span class="title">Seller Number</span>
				    			<span>${user_detail.selling_number}</span>
				    		</li>
			    		</c:if>
		    		</ul>
		    		<ul>
		    			<c:if test="${user_detail.selling_number != null}">
				    		<li>
				    			<span class="title">Booth</span>
				    			<span><a href="booth_list?type=email&keyword=${user_detail.user_id}">${user_detail.report_ban_count} 건</a></span>
				    		</li>
			    		</c:if>
			    		<li>
			    			<span class="title">Review</span>
			    			<span>${user_detail.review_count} 건</span>
			    		</li>
			    		<li>
			    			<span class="title">Ask</span>
			    			<span><a href="ask_list?type=email&keyword=${user_detail.user_id}">${user_detail.ask_count} 건</a></span>
			    		</li>
			    		<li>
			    			<span class="title">Report</span>
			    			<span><a href="report_list?type=email&keyword=${user_detail.user_id}">${user_detail.report_count} 건</a></span>
			    		</li>
			    		<c:if test="${user_detail.selling_number != null}">
					    	<li>
				    			<span class="title">False Post</span>
								<span><a href="ban_booth_list?type=email&keyword=${user_detail.user_id}">${user_detail.report_ban_count} 건</a></span>
					    	</li>
			    		</c:if>
			    		<li>
			    			<span class="title">False Report</span>
			    			<span>${user_detail.report_ban_count} 건</span>
			    		</li>
		    		</ul>
		    	</div>
	    		<div class="btn">
					<c:if test="${user_detail.user_black == 0 && user_detail.user_role != 'admin'}">
					    <button class="update_user">악성 회원 등록</button>
					</c:if>
					<c:if test="${user_detail.user_black == 0 && user_detail.seller_black != 1 && user_detail.user_role != 'admin'}">
			    		<button class="update_admin">관리자 권한 부여</button>
					</c:if>
					<c:if test="${user_detail.user_role == 'consumer' && user_detail.selling_number != null}">
			    		<button class="update_seller">판매자 권한 부여</button>
					</c:if>
					<c:if test="${user_detail.seller_black == 0 && user_detail.user_role == 'seller'}">
			    		<button class="update_seller">판매자 권한 해제</button>
					</c:if>
					<c:if test="${user_detail.user_role == 'admin'}">
			    		<button class="update_admin">관리자 권한 해제</button>
			    	</c:if>
					<c:if test="${user_detail.user_black == 1}">
					    <button class="update_user">악성 회원 해제</button>
					</c:if>
		    		<button class="delete">회원 정보 삭제</button>
	    		</div>
	    	</c:if>
    	</div>
    </div>
    
    <%@ include file="../../../footer.jsp" %>
    
</body>
</html>
