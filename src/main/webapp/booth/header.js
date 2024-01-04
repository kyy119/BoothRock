jQuery(document).ready(function() {

    $('.navi>li').mouseover(function() {
    
        $(this).find('.sub-menu').stop().slideDown(500);
        
    }).mouseout(function() {
    
        $(this).find('.sub-menu').stop().slideUp(500);
        
    });
});