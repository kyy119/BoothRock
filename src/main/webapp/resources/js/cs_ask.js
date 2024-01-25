jQuery(document).ready(function() {
    $(".ask-submit").click(function() {
        // 폼 데이터를 가져오기
        var title = $(".ask-title").val();
        var type = $("#ask-type").val();
        var content = $(".ask-content").val();

        // 데이터가 비어있는지 확인
        if (!title || !content) {
            alert("제목과 내용을 모두 입력해주세요.");
            return;
        }

        // 데이터를 JSON 형식으로 만들기
        var data = {
            user_id: userId,
            ask_title: title,
            ask_type: type,
            ask_content: content
        };

        // Ajax 요청 보내기
        $.ajax({
            type: 'POST',
            url: 'insertAsk', // 실제 컨트롤러의 URL로 수정해야 합니다.
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function(response) {
                console.log('문의가 성공적으로 제출되었습니다.');
                alert("제출 완료! 마이페이지 내 문의 내역을 확인하세요.");
                location.href= "mypage.jsp";
                // 성공했을 때 처리할 내용 추가
                //mypage 이동후 default값 주기?
            },
            error: function(error) {
                console.error('문의 제출 중 오류 발생:', error);
                console.error(data);
                // 오류 발생 시 처리할 내용 추가
            }
        });
    });
});//document ready
