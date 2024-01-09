<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모든 축제의 부스를 담다 - 부스락</title>

<link rel="stylesheet" href="resources/css/mypage_side.css"
	type="text/css">
<script type="text/javascript" src="resources/js/jquery-1.12.3.js"></script>
<script type="text/javascript">
	$(function() {
		$('.tabmenu').click(function() {
			var activeTab = $(this).attr('data-tab'); //선택된 탭메뉴 li태그의 data-tab값 
			$('li').css('font-weight', 'normal');//선택되지 않은 메뉴명 원래대로 되돌리기
			$('li').find('span').css({
				'width' : '0px',
			});
			$(this).css('font-weight', 'bold'); //선택된 메뉴명굵기, 막대효과 
			$(this).find('span').css({
				'float' : 'left',
				'height' : '20px',
				'width' : '5px',
				'background-color' : '#876ed5'
			});
			$.ajax({
				url : activeTab, //탭메뉴 li태그의 data-tab
				data : {},
				success : function(x) {
					$('#result').html(x)
				}//success
			})//ajax 
		})//li
		$('#default').click(); //마이페이지 클릭시 디폴트로 회원정보수정이 보이도록 설정    
	})//document.ready()
</script>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="bodywrap">
		<nav class="side-menu">
			<h2>마이페이지</h2>
			<ul class="side-navi">
				<li data-tab="mypage_edit" class="tabmenu" id="default"><span></span><a>회원정보수정</a></li>
				<li data-tab="mypage_jjimlist" class="tabmenu"><span></span><a>찜 목록</a></li>
				<li data-tab="mypage_review" class="tabmenu"><span></span><a>내 리뷰보기</a></li>
				<li data-tab="mypage_ask" class="tabmenu"><span></span><a>내 문의내역</a></li>
				<li data-tab="mypage_booth" class="tabmenu"><span></span><a>내 부스관리</a></li>
			</ul>
		</nav>

		<div class="mypage-form" id="result"></div>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>
