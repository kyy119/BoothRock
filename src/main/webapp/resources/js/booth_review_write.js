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

function showFileSelector(event) {
	event.preventDefault();
    alert("부스 방문을 인증하기 위해 \n현장에서 결제 완료된 영수증을 준비해주세요.");

    // 확인 버튼을 누르면 파일 선택 창 나타내기
    var input = document.createElement('input');
    input.type = 'file';
    input.accept = 'image/*';
    input.onchange = function (event) {
        var file = event.target.files[0];
        uploadFileToServer(file);
    };
    input.click();
}
    function uploadFileToServer(file) {
    var formData = new FormData();
    formData.append("file", file);

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/FM/review/ocr_auth", true);

    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log("파일 업로드 성공!");
            // 서버 응답이 성공인 경우
            // 여기에서 추가적인 동작을 수행하거나 페이지 이동 등을 할 수 있습니다.
            // 예시로 콘솔에 서버 응답 내용을 출력하는 코드입니다.
            console.log("서버 응답: " + xhr.responseText);
        } else {
            // 서버에서 오류 응답을 받았을 때의 처리
            console.error("파일 업로드 실패");
        }
    };
    xhr.onerror = function () {
        console.error("AJAX 통신 에러");
    };
    xhr.send(formData);
}
