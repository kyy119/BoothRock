jQuery(document).ready(function(){

	let page = 1;

	$("#def-btn").click(function(){
		$("#def-btn").addClass("bold-text");
		$("#pop-btn").removeClass("bold-text");
	});
	
    $("#pop-btn").click(function(){						// 인기순 버튼을 누를때
    	$("#pop-btn").addClass("bold-text");			// 인기순 버튼 볼드처리
        $("#def-btn").removeClass("bold-text");			// 기본순 버튼 볼드처리 해제
        $.ajax({										// 동시에 ajax
        	url : "fstv_jjim",							// fstv_jjim 어노테이션으로 이동
        	data : {
        	page : "1"									// 페이지값 1지정 후 idx계산해서 첫페이지 출력
        	},
        	success : function(list) {
        		$('.fstv-list').empty();				// 기존 fstv-list에 있던 내용들 지우고
        		$('.fstv-list').html(list);				// 인기순 정렬을 불러온다
        		page = 1;								// 기본순으로 늘어나있던 페이지를 다시 1로 돌려주고 스크롤할때 새로 불러와준다
        	}
        })
    });
    
	$(".fa-regular.fa-heart").click(function(){
		$(this).toggleClass("bold-text");
	});
	
	// 축제 리스트 첫 페이지를 위한 ajax, idx 0~9까지의 결과를 가져온다
	$.ajax({
		url : "fstv_list",
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
	            url: 'fstv_list',
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