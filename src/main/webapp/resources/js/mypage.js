jQuery(document).ready(function() {
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
				data : {user_id : userId,
						user_role : userRole
				},
				success : function(x) {
					$('#result').html(x)
				}//success
			})//ajax 
		})//li
		$('#default').click(); //마이페이지 클릭시 디폴트로 회원정보수정이 보이도록 설정  
});//document ready