jQuery(document).ready(function() {

    $("#item-add").click(function(){
		
		var currentItemCount = $(".item").length;
		
		if (currentItemCount < 8) {
	        var newItemForm = $(".item:first").clone();
	        
	        var newFormName = "booth-item" + $(".item").length;
	        var newPriceName = "booth-item-price" + $(".item").length;
	        var newFormId = "booth-item" + $(".item").length;
		    var newPriceId = "booth-item-price" + $(".item").length;
		    var newLabelFor = "booth-item" + $(".item").length;
		    var newPriceLabelFor = "booth-item-price" + $(".item").length;
	
	        newItemForm.find("#booth-item").attr("name", newFormName);
	        newItemForm.find("#booth-item-price").attr("name", newPriceName);
		    newItemForm.find("#booth-item").attr("id", newFormId);
		    newItemForm.find("#booth-item-price").attr("id", newPriceId);
		    newItemForm.find("label[for='booth-item']").attr("for", newLabelFor);
		    newItemForm.find("label[for='booth-item-price']").attr("for", newPriceLabelFor);
	
	        newItemForm.find("input").val("");
			
	        $(".item-form").append("<hr>").append(newItemForm);
	
	        var currentHeight = $(".item-form:first").height();
	        var newHeight = currentHeight + 100;
	        $(".item-add-form").css("height", newHeight + "px");
		} else {
            alert("상품은 최대 8개 등록할 수 있습니다.");
        }
        
    });
});
