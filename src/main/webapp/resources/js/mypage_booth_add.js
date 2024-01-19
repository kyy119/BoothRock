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
                var boothNo = response.booth_no;

                // booth_product 테이블에 데이터 삽입
                insertBoothProduct(boothNo);
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
	alert($(".item").length);
    $(".item").each(function (index, element) {
    	console.log(index + ": " + element);
        var itemName = $(element).find(".booth-item").val();
        var itemPrice = $(element).find(".booth-item-price").val();
        boothData.items.push({ name: itemName, price: itemPrice });
    });
}
function insertBoothProduct(boothNo) {
    // booth_product 테이블에 데이터 저장
    boothData.items.forEach(function(item) {
        item.boothNo = boothNo; // boothNo 값을 booth_product 데이터에 추가
    });

    // 각 상품에 대한 개별적인 Ajax 요청
    boothData.items.forEach(function(item) {
        $.ajax({
            type: 'POST',
            url: '/add-product',
            contentType: 'application/json',
            data: JSON.stringify(item), // 개별 상품 데이터 전송
            success: function(response) {
                console.log('Booth product inserted successfully.');
            },
            error: function(error) {
                console.error('Error inserting booth product:', error);
            }
        });
    });
}
