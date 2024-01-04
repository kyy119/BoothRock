jQuery(document).ready(function(){

	$("#def-btn").click(function(){
		$("#def-btn").addClass("bold-text");

		$("#pop-btn").removeClass("bold-text");
	});

    $("#pop-btn").click(function(){

    	$("#pop-btn").addClass("bold-text");
                
        $("#def-btn").removeClass("bold-text");
    });
    
	$(".fa-regular.fa-heart").click(function(){
	
		$(this).toggleClass("bold-text");
		
	});
	
});