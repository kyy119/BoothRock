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

	function showFileSelector(event, user_id , booth_no) {
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
            uploadFileToServer(file,user_id,booth_no); // user_id를 uploadFileToServer 함수에 전달
        };
        input.click();
    }
}

	// 파일 업로드 함수
	function uploadFileToServer(file, user_id, booth_no) {    
    var formData = new FormData();
    formData.append("file", file);
    formData.append("user_id", user_id);
    formData.append("booth_no", booth_no);

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/FM/review/ocr_auth", true);

    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log("파일 업로드 성공!");
            var responseText = xhr.responseText;
            console.log("서버 응답: " + responseText);

            if(responseText ==="not_equal_sell_no"){
            	alert("해당 부스의 영수증이 아닙니다.\n영수증을 확인해 주세요.");  
            } else if (responseText === "duplicate") {
                alert("해당 영수증으로는 이미 리뷰를 작성하셨습니다.");
            }else if (responseText === "success") {
                alert("영수증 인증 성공!\n리뷰작성화면으로 이동합니다.");
                window.location.href = "/FM/review/go_booth_review_write?booth_no=" + booth_no;
            } else {
                alert("서버 응답 에러");
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
	
	function submitReview() {
    const starRating = document.querySelector('.star-point');
    const boldStars = starRating.querySelectorAll('.fa-star.bold-text');
    const selectedRating = boldStars.length;

    const selectedTags = document.querySelectorAll('.tag-list ul li i.fa-solid');
    const selectedTagNames = Array.from(selectedTags).map(tag => tag.innerText.trim());


    // BoothReviewVO와 같은 구조의 객체 생성하여 전송
    const reviewData = {
        booth_no: booth_no,
        review_starpoint: selectedRating,
        user_id: user_id,
        keyword1: selectedTagNames[0] || null,
        keyword2: selectedTagNames[1] || null,
        keyword3: selectedTagNames[2] || null,
    };

    sendReviewDataToServer(reviewData);
}

function sendReviewDataToServer(reviewData) {
    fetch('/FM/review/insert_review', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(reviewData),
    })
    .then(response => {
    if (response.ok) {
        // HTTP 상태 코드가 200인 경우
        return response.json();
    } else {
        // HTTP 상태 코드가 200이 아닌 경우
        throw new Error('서버 응답 에러: ' + response.statusText);
    }
    })
    .then(data => {
        console.log('서버 응답:', data);
        alert('리뷰 작성이 완료되었습니다.');

        if (data !== null && data.booth_no !== undefined) {
            const booth_no = data.booth_no;
            window.location.href = `/FM/review/booth_review?booth_no=${booth_no}`;
        } else {
            console.error('서버 응답 에러');
        }

    })

    .catch(error => {
        console.error('에러 발생:', error.message);
        alert('서버 응답 에러');
    })
}

function goToBoothDetail(booth_no) {
        var url = '/FM/booth/booth_detail?booth_no=' + booth_no;
        window.location.href = url;
    }
