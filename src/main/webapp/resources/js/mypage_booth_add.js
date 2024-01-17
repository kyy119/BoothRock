var boothData = {}; 
jQuery(document).ready(function() {
    $('#fstv_title').on('change', function() {
        updateBoothData();
    });

    $('#submitForm').on('click', function() {
        updateBoothData();

        // Ajax 요청 및 서버에 boothData 전송
        $.ajax({
            type: 'POST',
            url: '/add',
            contentType: 'application/json',
            data: JSON.stringify(boothData),
            success: function(response) {
                console.log('Booth inserted successfully.');
            },
            error: function(error) {
            	console.error(boothData.fstvTitle);
            	console.error(boothData.boothName);
            	console.error(boothData.boothType);
            	console.error(boothData.boothImage);
            	console.error(boothData.boothLoc);
            	console.error(boothData.boothTel);
            	console.error(boothData.boothHour);
            	console.error(boothData.boothIntro);
            	console.error(boothData.items);
            	console.error(boothData.userId);
                console.error('Error inserting booth:', error);
            }
        });
    });
    
    updateBoothData();
    
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
function updateBoothData() {
    var selectedFestival = $('#fstv_title option:selected').val();
    console.log('Selected Festival:', selectedFestival);
    boothData.fstvTitle = selectedFestival;
	boothData.userId = userId;
    boothData.boothName = $('#booth-name').val();
    boothData.boothType = $('#booth-type').val();
    boothData.boothImage = $('#booth-img').val();
    boothData.boothLoc = $('#booth-loc').val();
    boothData.boothTel = $('#booth-tel').val();
    boothData.boothHour = $('#booth-hour').val();
    boothData.boothIntro = $('#booth-intro').val();
	boothData.items = [];
    $(".item").each(function(index, element) {
        var itemName = $(element).find("#booth-item").val();
        var itemPrice = $(element).find("#booth-item-price").val();
        boothData.items.push({ name: itemName, price: itemPrice });
    });

}
