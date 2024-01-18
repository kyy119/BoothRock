<%@page import="java.util.List"%>
<%@page import="com.multi.FM.fstv.FestivalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/mypage_jjim.css"
	type="text/css">
<!-- <script src="resources/js/mypage_jjim.js" defer type="text/javascript"></script> -->
<script type="text/javascript">
	$('.jjim-item i.fa-heart').on('click',function() {
				var fstv_no = $(this).closest('li.jjim-item').find('a').attr('href').split('=')[1]; //현재 누른 축제의 fstv_no
				var currentRow = $(this).closest('li.jjim-item'); // 현재 행 저장
				$.ajax({
					type : "POST",
					url : "mypage_jjim_delete",
					data : {
						fstv_no : fstv_no,
						user_id : userId
					},
					success : function(result) { //삭제 성공시 ""반환, 실패시 "fail"반환
						if (result == "") {
							alert("삭제 되었습니다.");
						} else {
							alert("삭제가 실패했습니다");
						}
						currentRow.remove(); 	//현재 행 삭제 
						if ($('.jjim-item').length === 0) { // 모든 찜목록이 삭제 될 시 "찜한 축제가 없습니다" 문구 보여짐  
							$('#no-jjim-bydelete').show();
						}
					}//success
				})//ajax
			});//하트 click
</script>

<%
  List<FestivalVO> VO = (List<FestivalVO>) request.getAttribute("list");
%>
<h1>찜 목록</h1>
<br>
<hr class="shadow">
<br>
<%
  if (VO.size() > 0) {
%>
<ul class="jjim-list">
	<%
	  for (FestivalVO list : VO) {
	%>
	<li class="jjim-item"><i class="fa-solid fa-heart"></i> <a
		href="fstv_detail?fstv_no=<%=list.getFstv_no()%>"> <img
			src=<%=list.getFstv_image()%> alt="resource/img/no-image.jpg">
			<span class="fstv-title"><%=list.getFstv_title()%></span><br> <span
			class="fstv-loc"><%=list.getFstv_eventplace()%></span><br> <span
			class="fstv-date"><%=list.getFstv_startdate()%> ~ <%=list.getFstv_enddate()%></span>
	</a></li>
	<%
	  }
	%>
</ul>
<%
  } else {
%>
<div id="no-jjim">찜한 축제가 없습니다.</div>	 <!-- 처음 페이지 로드시 찜한 축제가 없을 경우 -->
<%}%>
<div id="no-jjim-bydelete">찜한 축제가 없습니다.</div> <!-- 찜을 모두 삭제해 찜한 축제가 없을 경우 -->