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
                url: "report_list",
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
            url: "report_search",
            data: {
                page: page,
                type: type,
                keyword: keyword,
            },
            success: function(data) {
                $("tbody").empty();
                $.each(data.list, function(index, report) {
                    var row = "<tr>" +
                        "<td>" + report.report_no + "</td>" +
                        "<td><a href='report_detail?report_no=" + report.report_no + "'>" + report.report_title + "</a></td>" +
                        "<td><a href='user_detail.jsp'>" + report.user_id + "</a></td>" +
                        "<td><a href='booth_detail?booth_no=" + report.booth_no + "'>" + report.booth_name + "</a></td>" +
                        "<td>" + report.report_date + "</td>" +
                        "</tr>";

                    $("tbody").append(row);
                });
				console.log(data.search_pages)
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
    	<div class="report-list-form"> <!-- 페이징 필요 -->
	    	<h1>Report List</h1>
	    	<div class="select-search-form">
			    <form action="report_search" id="searchForm">
			    	<select name="type" id="type">
			    		<option value="no">No</option>
					    <option value="title">Title</option>
					    <option value="email">Email</option>
					    <option value="booth">Booth</option>
					    <option value="created">Created</option>
			    	</select>
			    	<input name="keyword" type="text" id="keyword">
			    	<input type="button" id="submit" value="검색" onclick="search()">
		    	</form>
	    	</div>
	    	<table id="sortTable">
				<thead>
    				<tr>
      					<th>No <i class="fa-solid fa-caret-down"></i></th>
					    <th>Title</th>
					    <th>Email</th>
					    <th>Booth</th>
					    <th>Created</th>
    				</tr>
				</thead>
				<tbody id="result">
					<c:forEach items="${report_list}" var="vo">
	    				<tr>
					      	<td>${vo.report_no}</td>
					      	<td><a href="report_detail?report_no=${vo.report_no}">${vo.report_title}</a></td>
					      	<td><a href="user_detail.jsp">${vo.user_id}</a></td>
					      	<td><a href="booth_detail?booth_no=${vo.booth_no}">${vo.booth_name}</a></td>
					      	<td>${vo.report_date}</td>
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
