jQuery(document).ready(function() {

    $('.side-navi > li').hover(function(){
    
		$(this).find('span').addClass('show-stick');
		
    }, function() {
    
        $(this).find('span').removeClass('show-stick');
        
    });
});