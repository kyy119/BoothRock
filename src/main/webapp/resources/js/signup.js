jQuery(document).ready(function() {

	$('#seller-check').change(function() {
	
		if ($(this).is(':checked')) {
	      $('.signup-form').css({
	        height: '530px'
	      });
	      $('.input-form').css({
	        height: '430px'
	      });      
	    } else {
	      $('.signup-form').css({
	        height: '450px'
	      });
	      $('.input-form').css({
	        height: '350px'
	      });
	    }
	    
		$('.seller-number').slideToggle();
	});
});