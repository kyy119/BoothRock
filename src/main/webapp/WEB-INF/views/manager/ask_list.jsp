<%@page import="com.multi.FM.manager.AskVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<AskVO> vo = (ArrayList<AskVO>) request.getAttribute("ask_list"); %>
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
	                url: "ask_list",
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
	    	var ask = $("#ask").val();
	        var type = $("#type").val();
	        var keyword = $("#keyword").val();
			
	        $.ajax({
	            type: "POST",
	            url: "ask_search",
	            data: {
	                page: page,
	                type: type,
	                keyword: keyword,
	                ask: ask
	            },
	            success: function(data) {
	                $("tbody").empty();
	                $.each(data.ask_search, function(index, ask) {
	                	var row = "<tr>" +
	                	"<td>" + ask.ask_no + "</td>" +
	                    "<td><a href='ask_detail?ask_no=" + ask.ask_no + "'>" + ask.ask_title + "</a></td>" +
	                    "<td>" + ask.ask_type + "</td>" +
	                    "<td><a href='user_detail?user_id=" + ask.user_id + "'>" + ask.user_id + "</a></td>" +
						"<td>" + ask.ask_created_at + "</td>";
						
						if (ask.ask_answer != null) {
	                    	row += "<td><i class='fa-solid fa-check'></i></td>";
						} else {
							row += "<td></td>";
						}
						
						row += "</tr>";
						
	                    $("tbody").append(row);
	                });
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
    	<div class="ask-list-form"> <!-- 페이징 필요 -->
	    	<h1>Ask List</h1>
	    	<div class="select-search-form">
	    		<select name="type" id="type">
		    		<option>Option</option>
		    		<option value="title">Title</option>
		    		<option value="email">Email</option>
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
      					<th class="type-select">
      						<select id="ask" name="ask" onchange="search()">
      							<option value="all">Type</option>
      							<option value="fstv">축제 문의</option>
      							<option value="booth">부스 문의</option>
      							<option value="etc">기타 문의</option>
      						</select>
      					</th>
					    <th>Email</th>
					    <th>Created</th>
					    <th>Checked</th>
    				</tr>
				</thead>
				<tbody id="result">
					<c:forEach items="${ask_list}" var="vo">
	    				<tr>
					      	<td>${vo.ask_no}</td>
					      	<td><a href="ask_detail?ask_no=${vo.ask_no}">${vo.ask_title}</a></td>
					      	<td>${vo.ask_type}</td>
					      	<td><a href="user_detail?user_id=${vo.user_id}">${vo.user_id}</a></td>
					      	<td>${vo.ask_created_at}</td>
					      	<c:if test="${vo.ask_answer != null}">
					      		<td><i class="fa-solid fa-check"></i></td>
					      	</c:if>
					      	<c:if test="${vo.ask_answer == null}">
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
