jQuery(document).ready(function() {

	$(function() {
	
		$('.tabmenu>li>a').click(function() {
		
			$(this).parent().addClass("active").siblings().removeClass("active");
            
        return false;
        
        });
    });
	
	// 부스 번호 불러오기
	function getBoothNo() {
	    const urlParams = new URLSearchParams(window.location.search);
	    const boothNo = urlParams.get('booth_no');
	    return boothNo;
	}

	var boothNo = getBoothNo(); // 변수 이름 수정

	// 부스 가격정보 불러오기
	$.ajax({
	    url: "booth_product",
	    contentType: "application/json;charset=UTF-8",
	    data: { booth_no: boothNo },
	    success: function(response) {
	    $('.boothProduct').html(response);
    }
});
	
	
	
	
	
	
});


	