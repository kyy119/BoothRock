jQuery(document).ready(function(){

    $('.fa-star').click(function(){
    
        $('.fa-star').removeClass('bold-text');
        
        $(this).prevAll().addBack().addClass('bold-text');
        
    });
    
    $('.tag-list ul li').click(function(){
    
        $(this).toggleClass('select-tag-border');
        
        $(this).find('.fa-regular').toggleClass('select-tag-text');
        
        $(this).find('.fa-solid').toggleClass('select-tag-text');
        
        var selectedCount = $('.select-tag-border').length;

        if (selectedCount > 3) {
        
            $(this).toggleClass('select-tag-border');
            
            $(this).find('.fa-regular').toggleClass('select-tag-text');
            
            $(this).find('.fa-solid').toggleClass('select-tag-text');
        }
        
    });
});
