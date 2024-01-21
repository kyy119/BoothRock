jQuery(document).ready(function() {
		$("#item-add").click(function(){
		
		var currentItemCount = $(".item").length;
		if (currentItemCount < 8) {
	        var newItemForm = $(".item:first").clone();
	        
	        var newFormName = "booth-item" + $(".item").length;
        var newPriceName = "booth-item-price" + $(".item").length;

        newItemForm.find(".booth-item").attr("name", newFormName);
        newItemForm.find(".booth-item-price").attr("name", newPriceName);

        newItemForm.find(".booth-item").val("");
        newItemForm.find(".booth-item-price").val("");
	
	        newItemForm.find("input").val("");
			
	        $(".item-form").append("<hr>").append(newItemForm);
	
	        var currentHeight = $(".item-form:first").height();
	        var newHeight = currentHeight + 100;
	        $(".item-add-form").css("height", newHeight + "px");
	        console.log('추가완.');
		} else {
            alert("상품은 최대 8개 등록할 수 있습니다.");
        }
    });
    $("#item-remove").click(function() {
    
   		var itemForms = $(".item-form .item");
    
    	if (itemForms.length > 1) {
	        var lastItemForm = itemForms.last();
	        var currentHeight = $(".item-form:first").height();
	        var newHeight = currentHeight - 100;
	        
	        lastItemForm.prev("hr").remove(); // hr 요소 제거
	        lastItemForm.remove(); // 마지막으로 추가된 item 제거
	        $(".item-add-form").css("height", newHeight + "px");
	    }
	   
    });
});//document ready