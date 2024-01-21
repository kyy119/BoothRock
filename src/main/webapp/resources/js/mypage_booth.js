jQuery(document).ready(function(){
    $('.booth-delete').on('click', function() {
        // 해당 부스의 booth_no 가져오기
        var boothNo = $(this).closest('li').data('booth-no');
		console.log("동작");
        // 서버로 삭제 요청 보내기
        $.ajax({
            type: 'POST',
            url: 'mypage/deleteBooth',
            data: { boothNo: boothNo },
            success: function(response) {
                console.log('Booth deleted successfully.');
                // 성공 시 페이지 새로고침 또는 부스 목록 다시 불러오는 등의 동작 수행
                $('#boothManage').click();
            },
            error: function(error) {
                console.error('Error deleting booth:', error);
            }
        });
    });
    
    $('#booth_add').on('click', function() { //등록하기 누를 시 result태그 변경으로 페이지 변환
    	 console.log("add click");
    	 $.ajax({
            type: 'GET',
            url: 'mypage/mypage_booth_add',
            success: function(response) {
				$("#result").html(response);
            },
            error: function(error) {
                console.error('Error deleting booth:', error);
            }
        });
    });
    $('.booth-edit').on('click', function() { //등록하기 누를 시 result태그 변경으로 페이지 변환
    	console.log("edit click");
    	var boothNo = $(this).closest('li').data('booth-no');
    	 $.ajax({
            type: 'GET',
            url: 'mypage/mypage_booth_edit',
            data : {boothNo: boothNo},
            success: function(response) {
				$("#result").html(response);
            },
            error: function(error) {
                console.error('Error deleting booth:', error);
            }
        });
    });
});