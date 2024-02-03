jQuery(document).ready(function() {
	
	let org = 0;
    let cnt = 0;

    // 버튼 상태 업데이트 함수
    // 함수가 실행될때마다 <, > 버튼의 활성화/비활성화를 결정시킨다
    function updateButtonStates() {
	    if (org >= (cnt - 1)) {
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
	
	$.ajax({
		url : "fstv/bannerlist",
		success : function(list) {
			$('#banner').html(list)
			$('.banner-img').on('load', function() {
                // adjustImageSize($(this));
            });
		}
	})
	
	// 곧 끝나는 축제 불러오는 ajax
	$.ajax({
		url : "fstv/endlist",
		success : function(list) {
			$('#endlist').html(list)
		}
	})
	
	// 요즘 뜨고 있는 부스 ajax > 리뷰 개수로 리스트업
	$.ajax({
		url : "fstv/fstv_boothup",
		success : function(list) {
			$('#boothup').html(list)
		}
	})
    
    $.ajax({
    	url : "fstv/listcnt",
    	type : "GET",
    	dataType : 'json',
    	success : function(x){
    		cnt = x.count - 3;
    		updateButtonStates();
    	}
    })
    
	// 배너 슬라이드 및 버튼 구현
	let currentIndex = 0;
	const totalSlides = 3;
	function showSlide(index) {
	    const marginLeft = -index * 1050;
	    $('.slide-list').animate({ marginLeft }, 500);
	    
	    for (let i = 0; i < totalSlides; i++) {
	        if (i !== index) {
	            $(`#img${i + 1}`).removeClass('current-img');
        	}
    	}
	   	$(`#img${index + 1}`).addClass('current-img');
	}

	function prevSlide() {
	    currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
	    showSlide(currentIndex);
	}
	
	function nextSlide() {
	    currentIndex = (currentIndex + 1) % totalSlides;
	    showSlide(currentIndex);
	}
	
	$('.banner-prev-btn').on('click', prevSlide);
	$('.banner-next-btn').on('click', nextSlide);
	
	setInterval(nextSlide, 4000);
   
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