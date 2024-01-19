jQuery(document).ready(function() {
	//
	$('.ask-title').on('click',function() {	
		$('#whole').hide();
		let detail_no = '#detail_'+$(this).data('ask-no'); 		
		$(detail_no).show();
	});
	$('.back').on('click',function() {
		$('#whole').show();
		$('[id^="detail_"]').hide();
	});
		
});
