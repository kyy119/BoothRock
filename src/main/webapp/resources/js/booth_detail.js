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
	    url: "/FM/booth/booth_product",
	    contentType: "application/json;charset=UTF-8",
	    data: { booth_no: boothNo },
	    success: function(response) {
	    $('.boothProduct').html(response);
    }
});

	// 부스상세에서 리뷰 불러오기
	$.ajax({
	    url: "/FM/review/booth_detail_review",
	    contentType: "application/json;charset=UTF-8",
	    data: { booth_no: boothNo },
	    success: function(response) {
	    $('.boothDetailReview').html(response);
    }
    
});

// 신고하기에서 부스정보 불러오기 
	$.ajax({
	    url: "/FM/report/booth_detail_report",
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
		        window.location.href = '/FM/users/login.jsp';
		    } else {
		      
		    }
	}


	//신고하기 버튼 클릭 시 로그인 여부와 중복신고여부 체크
	function duplicateReportCheck(user_id,booth_no) {
	    console.log("duplicateReportCheck 함수 호출 user_id:", user_id,"booth_no:", booth_no);
	
		if (user_id === null || user_id === "null") {
			LogInCheck();
		}else {
			window.location.href = '/FM/report/duplicate_report_check?booth_no=' + booth_no;
		}
	}
	
	//중복 신고로 확인되었을 경우 alert 
	function duplicateReportCheckAlert(duplicateTrue) {
        alert(duplicateTrue);
        history.back();
    }
    
    
   function showFileSelector(event, user_id, booth_no) {
    event.preventDefault();

    if (user_id === null || user_id === "null") {
        LogInCheck();
    } else {
        alert("부스 방문을 인증하기 위해 \n현장에서 결제 완료된 영수증을 준비해주세요.");
	console.log("User ID before file selection: " + user_id);
        // 확인 버튼을 누르면 파일 선택 창 나타내기
        var input = document.createElement('input');
        input.type = 'file';
        input.accept = 'image/*';
        input.onchange = function (event) {
            var file = event.target.files[0];
            uploadFileToServer(file,user_id, booth_no); // user_id를 uploadFileToServer 함수에 전달
        };
        input.click();
    }
}

	// 파일 업로드 함수 수정
	function uploadFileToServer(file, user_id, booth_no) {    
    var formData = new FormData();
    formData.append("file", file);
    formData.append("user_id", user_id);

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/FM/review/ocr_auth", true);

    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log("파일 업로드 성공!");
            var responseText = xhr.responseText;
            console.log("서버 응답: " + responseText);

            if (responseText === "success") {
                alert("영수증 인증 성공!\n리뷰작성화면으로 이동합니다.");
                window.location.href = "/FM/review/go_booth_review_write?booth_no=" + booth_no;
            } else if (responseText === "duplicate") {
                alert("해당 영수증으로는 이미 리뷰를 작성하셨습니다.");
                // 중복 시에 대한 처리 추가
            } else {
                alert("서버 응답 에러");
                // 기타 오류에 대한 처리 추가
            }
        } else {
            alert("파일 업로드 실패");
            console.log("에러 내용: " + xhr.responseText);
        }
    };

    xhr.onerror = function () {
        console.log("AJAX 통신 에러");
    };

    xhr.send(formData);
}

function goToBoothDetail(booth_no) {
        var url = '/FM/booth/booth_detail?booth_no=' + booth_no;
        window.location.href = url;
    }