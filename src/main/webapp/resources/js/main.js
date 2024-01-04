jQuery(document).ready(function() {

	function adjustImageSize(img) {
 
		var imgWidth = img.width();
		var imgHeight = img.height();
	
		var imgRatio = imgWidth / imgHeight;
	
		if (imgRatio > 1) {
			img.css('width', '480px');
		} else if (imgRatio < 1) {
			img.css('height', '100%');
			img.css('width', 'auto');
		}
	}
	
    setInterval (function() {
    
        $('.slide-list').delay(3000);
        $('.slide-list').animate({marginLeft : -1000});
        $('.slide-list').delay(3000);
        $('.slide-list').animate({marginLeft : -2000});
        $('.slide-list').delay(3000);
        $('.slide-list').animate({marginLeft : 0});
        $('.slide-list').delay(3000);
        
    });
    
    $('.nextbtn').click(function() {
        $('.multi-slide-list').animate({marginLeft : '-=340'});
    });
    $('.prevbtn').click(function() {
        $('.multi-slide-list').animate({marginLeft : '+=340'});
    });
    
    $('.banner-img').each(function() {
        adjustImageSize($(this));
    });
    
});