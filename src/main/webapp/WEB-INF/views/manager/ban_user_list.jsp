<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	});
	
    $(function(){
	    var pages = <%= request.getAttribute("pages") %>;
	    $(document).on('click', '.pages', function(){
        	var page = $(this).text();
        	
        	$.ajax({
                type: "POST",
                url: "ban_user_list",
                data: {
                    page: page
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
		        	if (current_page > 3) {
				        for (var i = (current_page - 2); i <= (current_page + 2); i++) {
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

        $.ajax({
            type: "POST",
            url: "ban_user_search",
            data: {
            	page: page,
                type: type,
                keyword: keyword,
                role: role
            },
            success: function(data) {
                $("tbody").empty();
                $.each(data.ban_user_search, function(index, user) {
                	var row = "<tr>" +
                    "<td>" + user.total_no + "</td>" +
                    "<td>" + user.user_name + "</td>" +
                    "<td><a href='user_detail?user_id=" + user.user_id + "'>" + user.user_id + "</a></td>" +
                    "<td class='user_role'>" + user.user_role + "</td>" +
                    "<td>" + user.user_tel + "</td>" +
                    "<td>" + user.user_created_at + "</td>" +
                    "<td>" + user.user_updated_at + "</td>" +
                    "<td>" + user.report_ban_count + " 건</td>" +
                    "<td>" + user.booth_ban_count + " 건</td>";

                    $("tbody").append(row);
                });
                role_update();
                search_pagination(data.search_pages, page);
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
            
            for (var i = 1; i <= pages; i++) {
                var page = '<button onclick="search(' + i + ')">' + i + '</button>';
                $("#pagination").append(page);
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
	    	<h1>Ban User List</h1>
	    	<div class="select-search-form">
	    		<select name="type" id="type">
		    		<option>Option</option>
		    		<option value="name">Name</option>
		    		<option value="email">Email</option>
		    		<option value="tel">Tel</option>
		    		<option value="created">Created</option>
		    		<option value="updated">Updated</option>
		    		<option value="fr">F / R</option>
		    		<option value="fp">F / P</option>
		    	</select>
		    	<input type="text" name="keyword" id="keyword">
		    	<input type="button" id="submit" value="검색" onclick="search()">
	    	</div>
	    	<table id="sortTable">
				<thead>
    				<tr>
					    <th>No</th>
					    <th>Name</th>
      					<th>Email</th>
      					<th class=type-select>
      						<select onchange="search()" id="role" name="role">
      							<option value="all">Type</option>
      							<option value="consumer">소비자</option>
      							<option value="seller">판매자</option>
      							<option value="admin">관리자</option>
      						</select>
      					</th>
					    <th>Tel</th>
					    <th>Created</th>
					    <th>Updated</th>
					    <th>F / R</th>
					    <th>F / P</th>
    				</tr>
				</thead>
				<tbody id="result">
					<c:forEach items="${ban_user_list}" var="vo">
	    				<tr>
					      	<td>${vo.total_no}</td>
					      	<td>${vo.user_name}</td>
					      	<td><a href="user_detail?user_id=${vo.user_id}">${vo.user_id}</a></td>
					      	<td class="user_role">${vo.user_role}</td>
					      	<td>${vo.user_tel}</td>
					      	<td>${vo.user_created_at}</td>
					      	<td>${vo.user_updated_at}</td>
					      	<td>${vo.report_ban_count} 건</td>
							<td>${vo.booth_ban_count} 건</td>
					    </tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="pagination">
				<button><i class="fa-solid fa-chevron-left"></i></button><c:forEach var="i" begin="1" end="${pages}"><button class="pages">${i}</button></c:forEach><button class="pages" style="font-size: 0;">2<i class="fa-solid fa-chevron-right"></i></button>
			</div>
    	</div>
    </div>
    
    <%@ include file="../../../footer.jsp" %>
    
</body>
</html>
