jQuery(document).ready(function() {
		$("#item-add").click(function(){
		
		var currentItemCount = $(".item-form").length;

    if (currentItemCount < 8) {
        var newItemForm = $(".item-form:first").clone();

        var newFormName = "booth-item" + currentItemCount;
        var newPriceName = "booth-item-price" + currentItemCount;

        newItemForm.find(".booth-item").attr("name", newFormName).attr("placeholder", "상품명");
        newItemForm.find(".booth-item-price").attr("name", newPriceName).attr("placeholder", "가격 입력(숫자만 입력해주세요)");

        newItemForm.find(".booth-item").val("");
        newItemForm.find(".booth-item-price").val("");

         $(".item-form:last").after(newItemForm).after("<hr>");

        var currentHeight = $(".item-form:first").height();
        var newHeight = currentHeight + 100;
        $(".item-add-form").css("height", newHeight + "px");
        console.log('추가완.');
    } else {
        alert("상품은 최대 8개 등록할 수 있습니다.");
    }
    });
    $("#item-remove").click(function() {
    
   		var itemForms = $(".item-form");

    if (itemForms.length > 1) {
        var lastItemForm = itemForms.last();
        var currentHeight = $(".item-form:first").height();
        var newHeight = currentHeight - 100;

        lastItemForm.prev("hr").remove(); // hr 요소 제거
        lastItemForm.remove(); // 마지막으로 추가된 item 제거
        $(".item-add-form").css("height", newHeight + "px");
    }
	   
    });
    $("#updateSubmit").click(function() {
            // 부스 정보를 가져와서 JSON 형태로 만듭니다.
            var boothData = {
            	booth_no: $("#booth-no").val(),
                booth_name: $("#booth-name").val(),
                booth_category: $("#booth-type").val(),
                booth_image: $("#booth-img").val(),
                booth_addr: $("#booth-loc").val(),
                booth_tel: $("#booth-tel").val(),
                booth_hours: $("#booth-hour").val(),
                booth_introduction: $("#booth-intro").val(),
                items: []
            };
            $(".item").each(function (index, element) {
                var itemName = $(element).find(".booth-item").val();
                var itemPrice = $(element).find(".booth-item-price").val();
                boothData.items.push({ product: itemName, price: itemPrice });
            });
			console.log(boothData.booth_name);
            // AJAX를 사용하여 서버에 업데이트 요청을 보냅니다.
            $.ajax({
                type: "POST",
                url: "mypage/updateBooth",
                contentType: "application/json",
                data: JSON.stringify(boothData),
                success: function(response) {
                    // 업데이트 성공 시 처리할 내용을 여기에 추가하세요.
                    console.log(response);
                    alert("부스 정보가 업데이트되었습니다.");
                   	deleteBoothProduct(response);
                   	insertBP(response, boothData.items);
                   	$('#boothManage').click();
                    //window.location.reload(); // 페이지 새로고침
                },
                error: function(error) {
            	console.error(boothData.booth_no);
            	console.error(boothData.booth_name);
            	console.error(boothData.booth_category);
            	console.error(boothData.booth_image);
            	console.error(boothData.booth_addr);
            	console.error(boothData.booth_tel);
            	console.error(boothData.booth_hours);
            	console.error(boothData.booth_introduction);
            	console.error(boothData.items);
                    // 업데이트 실패 시 처리할 내용을 여기에 추가하세요.
                    console.error(error);
                    alert("부스 정보 업데이트에 실패했습니다.");
                }
            });
        });
});
function deleteBoothProduct(boothNo){
	$.ajax({
        type: "POST",
        url: "mypage/deleteBoothProduct",
        data: { boothNo: boothNo },
        success: function(response) {
            // 삭제 성공 시 처리할 내용을 추가하세요.
            console.log(response);
        },
        error: function(error) {
            // 삭제 실패 시 처리할 내용을 추가하세요.
            console.error(error);
        }
    });
}
function insertBP(boothNo, items){
$.ajax({
        type: "POST",
        url: "mypage/updateBoothProduct",
        contentType: "application/json",
        data: JSON.stringify({ boothNo: boothNo, items: items }),
        success: function(response) {
            // 추가 성공 시 처리할 내용을 추가하세요.
            console.log(response);
        },
        error: function(error) {
            // 추가 실패 시 처리할 내용을 추가하세요.
            console.error(error);
        }
    });
}
