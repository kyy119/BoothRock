jQuery(document).ready(function() {
	
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
	
	$(".more").click(function(){
		$(this).siblings('.info-cont').slideToggle();
	});
	
    // 이용시간에 공백이 있을 시 시계 아이콘 가리기
    $('div:has(i.fa-clock)').each(function() {
        var playtime = $(this).text().trim();
        if (playtime == '') {
            $(this).hide();
        }
    });
    
    // 이용요금에 공백이 있을 시 '무료' 입력
    $('div:has(i.fa-coins)').each(function() {
        var usetimefestival = $(this).text().trim();
        if (usetimefestival === '') {
            $(this).html('<i class="fa-solid fa-coins" style="color: #fbd037;"></i> 무료');
        }
    });
    
});

