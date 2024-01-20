<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul>
	<c:forEach items="${bannerlist}" var="vo">
	<li>
		<a href="fstv/fstv_detail?fstv_no=${vo.fstv_no}"><img class="banner-img" src="${vo.fstv_image}" alt="이미지1"></a>
		<span>${vo.fstv_title}
			<p>${vo.fstv_startdate} ~ ${vo.fstv_enddate}</p>
			<p>${vo.fstv_banneraddr}</p>
		</span>
	</li>
	</c:forEach>
</ul>