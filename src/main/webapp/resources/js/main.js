jQuery(document).ready(function() {
	
	let org = 0;
    let cnt = 0;

    // 버튼 상태 업데이트 함수
    // 함수가 실행될때마다 <, > 버튼의 활성화/비활성화를 결정시킨다
    function updateButtonStates() {
	    if (org >= cnt) {
	        $('.next-btn').prop('disabled', true); // nextbtn 비활성화
	    } else {
	        $('.next-btn').prop('disabled', false); // nextbtn 활성화
	    }
	
	    if (org == 0) {
	        $('.prev-btn').prop('disabled', true); // prevbtn 비활성화
	    } else {
	        $('.prev-btn').prop('disabled', false); // prevbtn 활성화
	    }
	}
	
	// 이미지 사이즈 조절 함수
	function adjustImageSize(img) {
 
		var imgWidth = img.width();
		var imgHeight = img.height();
	
		var imgRatio = imgWidth / imgHeight;
	
		if (imgRatio > 1) {
			img.css('width', '480px');
		} else if (imgRatio < 1) {
			img.css('height', '500px');
			img.css('width', 'auto');
		}
	}
	
	$.ajax({
		url : "bannerlist",
		success : function(list) {
			$('#banner').html(list)
			$('.banner-img').on('load', function() {
                adjustImageSize($(this));
            });
		}
	})
	
	$.ajax({
		url : "endlist",
		success : function(list) {
			$('#endlist').html(list)
		}
	})
    
    $.ajax({
    	url : "listcnt",
    	type : "GET",
    	dataType : 'json',
    	success : function(x){
    		cnt = x.count - 3
    		updateButtonStates();
    	}
    })
   
    setInterval (function() {
        $('.slide-list').delay(3000);
        $('.slide-list').animate({marginLeft : -1000});
        $('.slide-list').delay(3000);
        $('.slide-list').animate({marginLeft : -2000});
        $('.slide-list').delay(3000);
        $('.slide-list').animate({marginLeft : 0});
        $('.slide-list').delay(3000);
    });

    $('.next-btn').click(function() {
    	org++;
    	updateButtonStates();
        $('.multi-slide-list').animate({marginLeft : '-=340'});
    });
    
    $('.prev-btn').click(function() {
    	org--;
    	updateButtonStates();
        $('.multi-slide-list').animate({marginLeft : '+=340'});
    });
    
	

});