jQuery(document).ready(function() {
$('.boothDetailReview').removeAttr("style");

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

	// 부스상세에서 리뷰 불러오기
	$.ajax({
	    url: "booth_detail_review",
	    contentType: "application/json;charset=UTF-8",
	    data: { booth_no: boothNo },
	    success: function(response) {
	    $('.boothDetailReview').html(response);
    }
});



	//신고하기 버튼 클릭 시 로그인 여부 체크
	function loginCheck(loginError) {
    window.onload = function() {
       var result = confirm(loginError + '\n\n로그인하러 가시겠습니까?');
        if (result) {
            window.location.href = 'login.jsp';
        	} else {
            	history.back();
        	}
	    }  
	};



	//중복 신고여부 체크
	function duplicateReportCheck(DuplicateTrue) {
	    alert(DuplicateTrue);
	    history.back();
	}

	
	
	
});


	