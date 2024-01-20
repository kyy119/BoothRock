<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/user_list.css" type="text/css">
    <script src="resources/js/user_list.js" defer type="text/javascript"></script>
	<script type="text/javascript" src="resources/js/jquery-3.7.1.js"></script>
	<script type="text/javascript">
    $(function(){
        $('.pages').click(function(){
            $.ajax({
                type: "POST",
                url: "ban_user_list",
                data: {
                    page: $(this).text()
                },
                success: function(data){
                    var tbody = $(data).find("tbody").html();
                    $('#result').html(tbody);
                }
            });
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
                updatePagination(data.search_pages);
            }
        });
        function updatePagination(search_pages) {
            $("#pagination").empty();
            for (var i = 1; i <= search_pages; i++) {
                var button = '<button class="pages" onclick="search(' + i + ')">' + i + '</button>';
                $("#pagination").append(button);
            }
        }
    }
</script>
</head>
<body>
    <%@ include file="../../admin_header.jsp" %>
    
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
					<c:forEach items="${user_list}" var="vo">
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
				<c:forEach var="i" begin="1" end="${pages}"><button class="pages">${i}</button></c:forEach>
			</div>
    	</div>
    </div>
    
    <%@ include file="../../footer.jsp" %>
    
</body>
</html>
