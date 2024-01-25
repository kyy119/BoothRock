<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.FM.manager.ReportVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<ReportVO> vo = (ArrayList<ReportVO>) request.getAttribute("report_list"); %>
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
	        var urlParams = new URLSearchParams(window.location.search);
	        var type = urlParams.get("type");
	        var keyword = urlParams.get("keyword");
	        var keyword = urlParams.get("checked");
	
	        if (type && keyword && checked) {
	            $("#type").val(type);
	            $("#keyword").val(keyword);
	            $("#checked").val();
	            search(1);
	        }
		});
		
	    $(function(){
		    var pages = <%= request.getAttribute("pages") %>;
		    $(document).on('click', '.pages', function(){
	        	var page = $(this).text();
	        	
	            $.ajax({
	                type: "POST",
	                url: "report_list",
	                data: {
	                    page: page
	                },
	                success: function(data){
	                    var tbody = $(data).find("tbody").html();
	                    $('#result').html(tbody);
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
	        var type = $("#type").val();
	        var keyword = $("#keyword").val();
	        var checked = $("#checked").val();
			
	        $.ajax({
	            type: "POST",
	            url: "report_list",
	            data: {
	                page: page,
	                type: type,
	                keyword: keyword,
	                checked: checked
	            },
	            success: function(data) {
                    var tbody = $(data).find("tbody").html();
                    $('#result').html(tbody);
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
	</script>
</head>
<body>
    <%@ include file="../../../manager/admin_header.jsp" %>
    
    <div class="bodywrap">
    	<div class="report-list-form"> <!-- 페이징 필요 -->
	    	<h1>Report List</h1>
	    	<div class="select-search-form">
		    	<select name="type" id="type">
		    		<option>Option</option>
				    <option value="title">Title</option>
				    <option value="email">Email</option>
				    <option value="booth">Booth</option>
				    <option value="booth_no" style="display: none;">Booth_no</option>
				    <option value="created">Created</option>
		    	</select>
		    	<input name="keyword" type="text" id="keyword">
		    	<input type="button" id="submit" value="검색" onclick="search()">
	    	</div>
	    	<table>
				<thead>
    				<tr>
      					<th>No</th>
					    <th>Title</th>
					    <th>Email</th>
					    <th>Booth</th>
					    <th>Created</th>
					    <th class=type-select>
					    	<select onchange="search()" id="checked" name="checked">
      							<option>Checked</option>
      							<option value="completed">completed</option>
      							<option value="false_post">false_post</option>
      							<option value="incomplete">incomplete</option>
      						</select>
					    </th>
    				</tr>
				</thead>
				<tbody id="result">
					<c:forEach items="${list}" var="vo">
	    				<tr>
					      	<td>${vo.report_no}</td>
					      	<td><a href="report_detail?report_no=${vo.report_no}">${vo.report_title}</a></td>
					      	<td><a href="user_detail?user_id=${vo.user_id}">${vo.user_id}</a></td>
					      	<td><a href="../booth/booth_detail?booth_no=${vo.booth_no}">${vo.booth_name}</a></td>
					      	<td>${vo.report_date}</td>
					      	<c:if test="${vo.report_check == 1 && vo.report_lie == 0}">
						      	<td><i class="fa-solid fa-check"></i></td>
					      	</c:if>
					      	<c:if test="${vo.report_check == 1 && vo.report_lie == 1}">
						      	<td><i class="fa-solid fa-xmark"></i></td>
					      	</c:if>
					      	<c:if test="${vo.report_check == 0 || vo.report_check == null}">
						      	<td></td>
					      	</c:if>
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
