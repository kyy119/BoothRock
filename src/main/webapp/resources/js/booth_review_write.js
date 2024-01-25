jQuery(document).ready(function(){

    $('.fa-star').click(function(){
    
        $('.fa-star').removeClass('bold-text');
        
        $(this).prevAll().addBack().addClass('bold-text');
        
    });
    
    $('.tag-list ul li').click(function(){
    
        $(this).toggleClass('select-tag-border');
        
        $(this).find('.fa-regular').toggleClass('select-tag-text');
        
        $(this).find('.fa-solid').toggleClass('select-tag-text');
        
        var selectedCount = $('.select-tag-border').length;

        if (selectedCount > 3) {
        
            $(this).toggleClass('select-tag-border');
            
            $(this).find('.fa-regular').toggleClass('select-tag-text');
            
            $(this).find('.fa-solid').toggleClass('select-tag-text');
        }
        
    });
     
    
});

	function showFileSelector(event, user_id) {
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
            uploadFileToServer(file,user_id); // user_id를 uploadFileToServer 함수에 전달
        };
        input.click();
    }
}

	// 파일 업로드 함수 수정
	function uploadFileToServer(file, user_id) {    
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
                window.location.href = "/FM/review/booth_review_write.jsp";
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

	
	//로그인해야하는 경우 팝업 confirm창
	function LogInCheck() {
	    var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?');
		    if (result) {
		        window.location.href = '/FM/users/login.jsp';
		    } else {
		      
		    }
	}
	
	

