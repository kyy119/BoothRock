jQuery(document).ready(function(){

	let page = 1;

	$("#def-btn").click(function(){
		$("#def-btn").addClass("bold-text");
		$("#pop-btn").removeClass("bold-text");
	});

    $("#pop-btn").click(function(){
    	$("#pop-btn").addClass("bold-text");
        $("#def-btn").removeClass("bold-text");
    });
    
	$(".fa-regular.fa-heart").click(function(){
		$(this).toggleClass("bold-text");
	});
	
	// 축제 리스트 첫 페이지를 위한 ajax, idx 0~9까지의 결과를 가져온다
	$.ajax({
		url : "list",
		data : {
		page : "1"
		},
		success : function(list) {
			$('.fstv-list').html(list)
		}
	})
	
	// ====================================스크롤 페이징 처리파트============================================
	let loading = false; // 로딩 중인지 여부를 나타내는 변수

	$(window).scroll(function() {
	    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100 && !loading) {
	        // 스크롤이 페이지 하단에 도달하고 로딩 중이 아닐 때
	        loading = true; 								// 로딩 상태로 변경
	        page++;											// 페이지 1추가
	
	        $.ajax({										// AJAX를 사용하여 새로운 리스트를 서버에서 가져옴
	            url: 'list',
	            data : {
	            	page : page								// 스크롤할때마다 추가된 page를 controller에 전달
	            },
	            type: 'GET',
	            success: function(data) {					// 새로운 리스트 가져오기 성공 시
	                $('.fstv-list').append(data);			// 가져온 리스트를 추가
	                loading = false;						// 로딩 완료 상태로 변경
	            },
	            error: function() {
	                loading = false;						// 에러 발생 시 로딩 완료 상태로 변경
	            }
	        });
	    }
	});
	// ===============================================================================================
	
});