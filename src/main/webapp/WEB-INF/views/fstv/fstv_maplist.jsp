<%@page import="com.multi.FM.fstv.FestivalVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function handleFestivalDateStatus(fstv_no, start_date, end_date) {
	    var $li = $('#no-' + fstv_no);
	    if (start_date > current_date) {
	        $li.addClass('fstv-will');				// 축제 예정
	    } else if (end_date < current_date) {
	        $li.addClass('fstv-end');				// 축제 종료
	    } else {
	        $li.addClass('fstv-cur');				// 둘 다 해당하지 않는 경우
	    }
	}
	function convert_to_date(date_string) {
	    var parts = date_string.split('.');
	    return new Date(parts[0], parts[1] - 1, parts[2]);
	}
</script>
<ul>
	<c:forEach items="${list}" var="vo">
		<li id="no-${vo.fstv_no}" class="">
		<script>
			var current_date = new Date();
			var start_date = convert_to_date('${vo.fstv_startdate}');
			var end_date = convert_to_date('${vo.fstv_enddate}');
			
			handleFestivalDateStatus(${vo.fstv_no}, start_date, end_date);
		</script>
			<a href="fstv/fstv_detail?fstv_no=${vo.fstv_no}">
				<img src="${vo.fstv_image}" alt="resources/img/no-image.jpg">
				<div class="fstv-title">${vo.fstv_title}</div>
				<div class="fstv-loc">${vo.fstv_banneraddr}</div>
				<div class="fstv-date">${vo.fstv_startdate}~${vo.fstv_enddate}</div>
			</a>
		</li>
	</c:forEach>
</ul>
