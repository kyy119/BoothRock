jQuery(document).ready(function(){
	
	// 지도 스크롤
	var originalPosition = $(".fstv-map").offset().top;
	
	$(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    var newPosition = Math.max(originalPosition, position + 40);
	    $(".fstv-map").stop().animate({"top": newPosition + "px"}, 800);
	});
	
	// 축제 리스트 첫 페이지를 위한 ajax
	$.ajax({
		url : list_url,
		data : {
        region : region
		},
		success : function(list) {
			$('.fstv-list').html(list);
		}
	})
});