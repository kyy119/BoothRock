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

// 신고하기에서 부스정보 불러오기 
	$.ajax({
	    url: "booth_detail_report",
	    contentType: "application/json;charset=UTF-8",
	    data: { booth_no: boothNo },
	    success: function(response) {
	    $('.booth_detail_report').html(response);
    }
});

});

	//로그인해야하는 경우 팝업 confirm창
	function LogInCheck() {
	    var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?');
		    if (result) {
		        window.location.href = 'login.jsp';
		    } else {
		      
		    }
	}


	//신고하기 버튼 클릭 시 로그인 여부와 중복신고여부 체크
	function duplicateReportCheck(user_id,booth_no) {
	    console.log("duplicateReportCheck 함수 호출 user_id:", user_id,"booth_no:", booth_no);
	
		if (user_id == null) {
			LogInCheck();
		}else {
			window.location.href = 'duplicate_report_check?booth_no=' + booth_no;
		}
	}
	
	//중복 신고로 확인되었을 경우 alert 
	function duplicateReportCheckAlert(duplicateTrue) {
        alert(duplicateTrue);
        history.back();
    }
	