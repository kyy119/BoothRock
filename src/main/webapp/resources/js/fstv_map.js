jQuery(document).ready(function(){
	
	let list_url = "fstv_maplist";
	let region = "서울";
	
	$("#def-btn").click(function(){
		list_url = "fstv_maplist";
		$("#def-btn").addClass("bold-text");
		$("#pop-btn").removeClass("bold-text");
		$.ajax({
        	url : list_url,								// 기본순(fstv_list)으로 지정된 url 어노테이션으로 이동
        	data : {
        	region : region
        	},
        	success : function(list) {
        		$('.fstv-list').empty();				// 기존 fstv-list에 있던 내용들 지우고
        		$('.fstv-list').html(list);				// 기본순 정렬을 불러온다
        	}
        })
	});
	
    $("#pop-btn").click(function(){						// 인기순 버튼을 누를때
    	list_url = "fstv_maplistJ";
    	$("#pop-btn").addClass("bold-text");
        $("#def-btn").removeClass("bold-text");
        $.ajax({										// 동시에 ajax
        	url : list_url,								// 인기순(fstv_jjim)으로 지정된 url 어노테이션으로 이동
        	data : {
        	region : region
        	},
        	success : function(list) {
        		console.log(list_url);
        		$('.fstv-list').empty();				// 기존 fstv-list에 있던 내용들 지우고
        		$('.fstv-list').html(list);				// 인기순 정렬을 불러온다
        	}
        })
    });
    
	$(".fa-regular.fa-heart").click(function(){
		$(this).toggleClass("bold-text");
	});
	
	// 지도 스크롤
	var originalPosition = $(".fstv-map").offset().top;
	
	$(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    var newPosition = Math.max(originalPosition, position + 40);
	    $(".fstv-map").stop().animate({"top": newPosition + "px"}, 800);
	});
	
	// 축제 리스트 첫 페이지를 위한 ajax, idx 0~9까지의 결과를 가져온다
	$.ajax({
		url : list_url,
		data : {
        region : region
		},
		success : function(list) {
			console.log(region)
			$('.fstv-list').html(list);
			console.log(list);
		}
	})
});