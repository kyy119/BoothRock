jQuery(document).ready(function() {

	$('.fa-solid').click(function(){
        $(this).toggleClass('fa-caret-right fa-caret-down');
        $(this).parent().siblings('p').slideToggle();
    });
    
});