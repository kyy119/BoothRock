jQuery(document).ready(function() {
	alert("test2");
	$('.jjim-item i.fa-heart').on('click', function () {
        // 현재 클릭된 하트의 부모 li를 숨김
        alert("test");
        $(this).closest('li.jjim-item').remove();
        alert("test2");
    });
});