jQuery(document).ready(function(){
    $('.booth-delete').on('click', function() {
        // 해당 부스의 booth_no 가져오기
        var boothNo = $(this).closest('li').data('booth-no');
		console.log("동작");
        // 서버로 삭제 요청 보내기
        $.ajax({
            type: 'POST',
            url: 'deleteBooth',
            data: { boothNo: boothNo },
            success: function(response) {
                console.log('Booth deleted successfully.');
                // 성공 시 페이지 새로고침 또는 부스 목록 다시 불러오는 등의 동작 수행
                location.reload();
            },
            error: function(error) {
                console.error('Error deleting booth:', error);
            }
        });
    });
    $('.booth-edit').on('click', function() {
        // 해당 부스의 booth_no 가져오기
        var boothNo = $(this).closest('li').data('booth-no');
        console.log("click");
        // 수정 페이지로 이동
        location.href = 'mypage_booth_edit.jsp?boot_no=' + boothNo;
    });
});