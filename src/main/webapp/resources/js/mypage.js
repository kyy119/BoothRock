jQuery(document).ready(function() {
		$('.tabmenu').click(function() {
			var activeTab = $(this).attr('data-tab'); //선택된 탭메뉴 li태그의 data-tab값 
			$('li > span').css('background-color', '#fff');
			
			$(this).find('span').css({
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