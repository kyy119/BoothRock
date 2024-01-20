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
		        	list_pagination(pages, page);
                }
            });
		    function list_pagination(pages, current_page) {
		    	console.log("버튼이 클릭되었습니다.");
		    	console.log(pages);
		    	console.log(current_page);
		        $("#pagination").empty();
		        
		        if (current_page == 1) {
		       		var prev = '<button><i class="fa-solid fa-chevron-left"></i></button>';
		        	$("#pagination").append(prev);
		        } else {
		       		var prev = '<button style="font-size: 0;" class="pages">' + (current_page - 1) + '<i class="fa-solid fa-chevron-left"></i></button>';
		        	$("#pagination").append(prev);
		        }
		        console.log(prev);
		        for (var i = 1; i <= pages; i++) {
		            var page = '<button class="pages">' + i + '</button>';
		            $("#pagination").append(page);
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
        var type = $("#type").val();
        var keyword = $("#keyword").val();
		
        $.ajax({
            type: "POST",
            url: "ban_user_search",
            data: {
                page: page,
                type: type,
                keyword: keyword,
            },
            success: function(data) {
                $("tbody").empty();
                $.each(data.list, function(index, user) {
                	var row = "<tr>" +
                    "<td>" + user.user_name + "</td>" +
                    "<td><a href='user_detail.jsp'>" + user.user_id + "</a></td>" +
                    "<td>" + user.user_role + "</td>" +
                    "<td>" + user.user_tel + "</td>" +
                    "<td>" + user.user_created_at + "</td>" +
                    "<td>" + user.user_updated_at + "</td>";

                	row += "<td>";
                	if (user.user_role === 'consumer') {
                    	row += user.report_ban_count;
                	} else if (user.user_role === 'seller') {
                    	row += user.booth_ban_count;
                	}
                	row += "</td>";

                	row += "</tr>";

                    $("tbody").append(row);
                });
                search_pagination(data.search_pages);
            }
        });
        function search_pagination(pages) {
            $("#pagination").empty();
            for (var i = 1; i <= pages; i++) {
                var page = '<button class="pages" onclick="search(' + i + ')">' + i + '</button>';
                $("#pagination").append(page);
            }
        }
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
		    		<option value="name">Name</option>
		    		<option value="email">Email</option>
		    		<option value="tel">Tel</option>
		    		<option value="created">Created</option>
		    		<option value="updated">Updated</option>
		    		<option value="fp">F / P</option>
		    	</select>
		    	<input type="text" name="keyword" id="keyword">
		    	<input type="button" id="submit" value="검색" onclick="search()">
	    	</div>
	    	<table id="sortTable">
				<thead>
    				<tr>
					    <th>Name</th>
      					<th>Email</th>
      					<th class=type-select>
      						<select>
      							<option>Type</option>
      							<option>소비자</option>
      							<option>판매자</option>
      							<option>관리자</option>
      						</select>
      					</th>
					    <th>Tel</th>
					    <th>Created</th>
					    <th>Updated</th>
					    <th>F / P</th>
    				</tr>
				</thead>
				<tbody id="result">
					<c:forEach items="${ban_user_list}" var="vo">
	    				<tr>
					      	<td>${vo.user_name}</td>
					      	<td><a href="user_detail.jsp">${vo.user_id}</a></td>
					      	<td>${vo.user_role}</td>
					      	<td>${vo.user_tel}</td>
					      	<td>${vo.user_created_at}</td>
					      	<td>${vo.user_updated_at}</td>
					      	<td>
							  <c:choose>
							    <c:when test="${vo.user_role == 'consumer'}">
							      ${vo.report_ban_count}
							    </c:when>
							    <c:when test="${vo.user_role == 'seller'}">
							      ${vo.booth_ban_count}
							    </c:when>
							  </c:choose>
							 </td>
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
