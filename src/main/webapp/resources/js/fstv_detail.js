jQuery(document).ready(function() {

	$("#def-btn").click(function(){
		$("#def-btn").addClass("bold-text");
		$("#pop-btn").removeClass("bold-text");
		$.ajax({
	    	url : "fstv_detail_boothin",
	    	data : {
	    		fstv_no : fstvNo
	    	},
	    	success : function(a){
	    		$('.booth-list').empty();
	    		$('.booth-list').html(a);
	    	}
	    })
	});
	
	$("#pop-btn").click(function(){	
    	$("#pop-btn").addClass("bold-text");
        $("#def-btn").removeClass("bold-text");
		$.ajax({
	    	url : "fstv_detail_boothstar",
	    	data : {
	    		fstv_no : fstvNo
	    	},
	    	success : function(a){
	    		$('.booth-list').empty();
	    		$('.booth-list').html(a);
	    	}
	    })        
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
    
    adjustHeights(); // 페이지 로드시 높이 조정 함수 호출

    // 창 크기가 변경될 때 높이 조정 함수 호출
    $(window).resize(function () {
        adjustHeights();
    });

    function adjustHeights() {
        var containerHeight = $('.fstv-container').height();
        var infoHeight = $('.fstv-info').height();

        if (infoHeight < 350) {
            $('.fstv-container').css('height', '350px');
        } else {
            $('.fstv-container').css('height', infoHeight + 'px');
            $('.fstv-img img').css('height', infoHeight + 'px');
        }

    }
    
    var searchParams = new URLSearchParams(window.location.search);
	var fstvNo = searchParams.get('fstv_no');
    
    // 부스 불러오는 ajax
    $.ajax({
    	url : "fstv_detail_boothin",
    	data : {
    		fstv_no : fstvNo
    	},
    	success : function(a){
    		$('.booth-list').html(a);
    	}
    })
    
    var newChildren = $('#home-page-link').contents().filter(function () {
                return this.nodeType !== 3; // 3은 텍스트 노드의 nodeType입니다.
            }).clone();

            // #home-page-link의 자식을 모두 비우고, 새로운 자식을 추가
            $('#home-page-link').empty().append(newChildren);
    
});

document.addEventListener('DOMContentLoaded', function () {
    var links = document.querySelectorAll('#home-page-link a');

    if (links.length > 0) {
        links[0].innerHTML = '<i class="fa-regular fa-paper-plane"></i> 공식 홈페이지';
    }

    if (links.length > 1) {
        links[1].innerHTML = '<i class="fa-brands fa-instagram"></i> 인스타그램';
    }
});