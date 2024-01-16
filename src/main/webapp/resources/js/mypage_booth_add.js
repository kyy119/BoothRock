jQuery(document).ready(function() {
        // 이벤트 핸들러: select 요소가 클릭될 때
    $("#fstv_title").on("click", function() {
        // Ajax 요청
        $.ajax({
            type: "GET",
            url: "/Mybooth/getFestivals", // MyBoothController의 getFestivals 메소드와 매핑된 URL
            success: function(data) {
            	console.log("Ajax request success: ", data);
                // 기존의 옵션 제거
                $("#fstv_title").empty();

                // 새로운 축제 목록으로 옵션 업데이트
                $.each(data, function(index, festival) {
                    $("#fstv_title").append('<option value="' + festival.fstv_no + '">' + festival.fstv_title + '</option>');
                });
            },
            error: function(xhr, status, error) {
                console.error("Error fetching festivals: " + error);
            }
        });
    });
    
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
