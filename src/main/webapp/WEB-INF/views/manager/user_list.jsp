<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String user_black = request.getParameter("user_black"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user_list.css" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/js/user_list.js" defer type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
	<script type="text/javascript">
	var user_black = <%= user_black %>;
	$(document).ready(function() {
	    role_update();
	    
        var urlParams = new URLSearchParams(window.location.search);
        var type = urlParams.get("type");
        var keyword = urlParams.get("keyword");

        if (type && keyword) {
            $("#type").val(type);
            $("#keyword").val(keyword);
            search(1);
        }
        
        function update_user(user_id, action, message) {
            $.ajax({
                type: "POST",
                url: action,
                data: { user_id: user_id },
                success: function(data) {
                    alert(message);
                    if (user_black == 1) {
                        window.location.href = 'user_list?user_black=1';
                    } else {
                        window.location.href = 'user_list?user_black=0';
                    }
                }
            });
        }

        $(".update_user").on("click", function() {
	        var user_id = $(this).closest('tr').find('td:eq(2)').text();
        	update_user(user_id ,"update_user", "악성 회원 변경이 완료되었습니다.");
        });
        
        $("a").on("click", function(event) {
            if ($(this).text() === '0 건') {
              event.preventDefault();
              alert('검색 정보가 없습니다.');
            }
        });
	});
	
    var pages = <%= request.getAttribute("pages") %>;
    $(function(){
	    $(document).on('click', '.pages', function(){
        	var page = $(this).text();
        	
            $.ajax({
                type: "POST",
                url: "user_list",
                data: {
                    page: page,
                    user_black: user_black
                },
                success: function(data){
                    var tbody = $(data).find("tbody").html();
                    $('#result').html(tbody);
                    role_update();
		        	list_pagination(pages, page);
                }
            });
            
            function list_pagination(pages, page) {
		        $("#pagination").empty();
		        var current_page = parseInt(page);
		        
		        if (current_page == 1) {
		       		var prev = '<button><i class="fa-solid fa-chevron-left"></i></button>';
		        	$("#pagination").append(prev);
		        } else {
		       		var prev = '<button style="font-size: 0;" class="pages">' + (current_page - 1) + '<i class="fa-solid fa-chevron-left"></i></button>';
		        	$("#pagination").append(prev);
		        }
		        
		        if (pages > 5) {
		        	if (current_page <= pages && current_page > 5) {
				        for (var i = (pages - 4); i <= pages; i++) {
				            var page = '<button class="pages">' + i + '</button>';
				            $("#pagination").append(page);
				        }
		        	} else if (current_page > 3) {
				        for (var i = (current_page - 2); i <= (current_page + 2); i++) {
				            var page = '<button class="pages">' + i + '</button>';
				            $("#pagination").append(page);
				        }
		        	} else {
				        for (var i = 1; i <= 5; i++) {
				            var page = '<button class="pages">' + i + '</button>';
				            $("#pagination").append(page);
				        }
		        	}
		        } else {
			        for (var i = 1; i <= pages; i++) {
			            var page = '<button class="pages">' + i + '</button>';
			            $("#pagination").append(page);
			        }
		        }
		        
		        if (current_page == pages) {
		       		var next = '<button><i class="fa-solid fa-chevron-right"></i></button>';
		        	$("#pagination").append(next);
		        } else {
		       		var next = '<button style="font-size: 0;" class="pages">' + (current_page + 1) + '<i class="fa-solid fa-chevron-right"></i></button>';
		        	$("#pagination").append(next);
		        }
		    }
        });
    });

    function search(page) {
    	var role = $("#role").val();
        var type = $("#type").val();
        var keyword = $("#keyword").val();
        var user_black = parseInt('<%= user_black %>');
        
        $.ajax({
            type: "POST",
            url: "user_list",
            data: {
                page: page,
                type: type,
                keyword: keyword,
                role: role,
                user_black: user_black
            },
            success: function(data) {
            	var tbody = $(data).find("tbody").html();
                $('#result').html(tbody);
                role_update();
                search_pagination(pages, page);
            }
        });
        
        function search_pagination(pages, page) {
            $("#pagination").empty();
            var current_page = page || 1;
            
            if (current_page == 1) {
	       		var prev = '<button><i class="fa-solid fa-chevron-left"></i></button>';
	        	$("#pagination").append(prev);
	        } else {
	       		var prev = '<button style="font-size: 0;" onclick="search(' + (current_page - 1) + ')"><i class="fa-solid fa-chevron-left"></i></button>';
	        	$("#pagination").append(prev);
	        }
            
	        if (pages > 5) {
	        	if (current_page <= pages && current_page > 5) {
			        for (var i = (pages - 4); i <= pages; i++) {
			        	var page = '<button onclick="search(' + i + ')">' + i + '</button>';
			            $("#pagination").append(page);
			        }
	        	} else if (current_page > 3) {
			        for (var i = (current_page - 2); i <= (current_page + 2); i++) {
			        	var page = '<button onclick="search(' + i + ')">' + i + '</button>';
			            $("#pagination").append(page);
			        }
	        	} else {
			        for (var i = 1; i <= 5; i++) {
			        	var page = '<button onclick="search(' + i + ')">' + i + '</button>';
			            $("#pagination").append(page);
			        }
	        	}
	        } else {
		        for (var i = 1; i <= pages; i++) {
		        	var page = '<button onclick="search(' + i + ')">' + i + '</button>';
		            $("#pagination").append(page);
		        }
	        }
            
	        if (current_page == pages) {
	       		var next = '<button><i class="fa-solid fa-chevron-right"></i></button>';
	        	$("#pagination").append(next);
	        } else {
	       		var next = '<button style="font-size: 0;" onclick="search(' + (current_page + 1) + ')"><i class="fa-solid fa-chevron-right"></i></button>';
	        	$("#pagination").append(next);
	        }
        }
    }
    
    function role_update() {
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
    }
</script>
</head>
<body>
    <%@ include file="../../../manager/admin_header.jsp" %>
    
    <div class="bodywrap">
    	<div class="user-list-form"> <!-- 페이징 필요 -->
	    	<h1>User List</h1>
	    	<div class="select-search-form">
	    		<select name="type" id="type">
	    			<option>Option</option>
		    		<option value="name">Name</option>
		    		<option value="email">Email</option>
		    		<option value="tel">Tel</option>
		    		<option value="created">Created</option>
		    		<option value="updated">Updated</option>
		    		<option value="fr">False Report</option>
		    	</select>
		    	<input type="text" name="keyword" id="keyword">
		    	<input type="button" id="submit" value="검색" onclick="search()">
	    	</div>
	    	<table>
				<thead>
    				<tr>
    					<th>No</th>
					    <th>Name</th>
      					<th>Email</th>
      					<th class=type-select>
							<select onchange="search()" id="role" name="role">
      							<option>Type</option>
      							<option value="consumer">소비자</option>
      							<option value="seller">판매자</option>
      							<option value="admin">관리자</option>
      						</select>
      					</th>
					    <th>Tel</th>
					    <th>Created</th>
					    <th>Updated</th>
					    <th>False Report</th>
					    <th>Ban</th>
    				</tr>
				</thead>
				<tbody id="result">
					<c:forEach items="${list}" var="vo">
	    				<tr>
	    					<td>${vo.total_no}</td>
					      	<td>${vo.user_name}</td>
					      	<td><a href="user_detail?user_id=${vo.user_id}">${vo.user_id}</a></td>
							<c:choose>
							    <c:when test="${vo.user_role == 'consumer' && vo.selling_number != null}">
							        <td class="user_role" style="color: blue;">${vo.user_role}</td>
							    </c:when>
							    <c:otherwise>
							        <td class="user_role">${vo.user_role}</td>
							    </c:otherwise>
							</c:choose>
					      	<td>${vo.user_tel}</td>
					      	<td>${vo.user_created_at}</td>
					      	<td>${vo.user_updated_at}</td>
					      	<td><a href="report_list?type=email&keyword=${vo.user_id}&checked=false_post">${vo.report_ban_count} 건</a></td>
					      	<c:if test="${vo.user_black == 0 && vo.user_role != 'admin'}">
					      		<td><button class="update_user">등록</button></td>
					      	</c:if>
					      	<c:if test="${vo.user_black == 1}">
					      		<td><button class="update_user">해제</button></td>
					      	</c:if>
					      	<c:if test="${vo.user_role == 'admin'}">
					      		<td></td>
					      	</c:if>
					    </tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="pagination">
				<button><i class="fa-solid fa-chevron-left"></i></button><c:choose><c:when test="${pages <= 5}"><c:forEach var="i" begin="1" end="${pages}"><button class="pages">${i}</button></c:forEach></c:when><c:when test="${pages > 5}"><c:forEach var="i" begin="1" end="5"><button class="pages">${i}</button></c:forEach></c:when></c:choose><button class="pages" style="font-size: 0;">2<i class="fa-solid fa-chevron-right"></i></button>
			</div>
    	</div>
    </div>
    
    <%@ include file="../../../footer.jsp" %>
    
</body>
</html>
