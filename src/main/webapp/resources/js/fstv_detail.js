jQuery(document).ready(function() {
	
	$("#def-btn").click(function(){
		$("#def-btn").addClass("bold-text");
		$("#pop-btn").removeClass("bold-text");
	});
	
	$("#pop-btn").click(function(){	
    	$("#pop-btn").addClass("bold-text");
        $("#def-btn").removeClass("bold-text");
    });
    
    $("#jjim").click(function(){
		$(this).toggleClass("bold-text");
	});
	
	$(".more").click(function(){
		var infoCont = $(this).siblings('.info-cont');
		var infoText = $(this).siblings('.info-text');
		
		var isOpen = infoCont.is(':visible');
		
		infoCont.slideToggle();
		
		if (isOpen) {
		    infoText.css({'overflow': 'hidden', 'height': '120px'});
		} else {
		    infoText.css({'overflow': 'visible', 'height': 'auto'});
		}
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

document.addEventListener('DOMContentLoaded', function () {
    var link = document.querySelector('#home-page-link a');
    if (link) {
        link.innerHTML = '<i class="fa-regular fa-paper-plane"></i> 공식 홈페이지';
    }
});