var boothData = {}; 
jQuery(document).ready(function() {
    $('#fstv_title').on('change', function() {
        updateBoothData();
    });

    $('#submitForm').on('click', function() {
        updateBoothData();
		if (!isValidFormData()) {
        console.log('Some fields are empty. Form submission aborted.');
       	alert("빈칸 없이 입력하세요");
        return;
    	}
    	if(!isNanFormData()){
        	alert("상품 가격은 숫자로 입력해주세요.");
        	return;
        }
        uploadAndSaveBoothImage(function() {
            console.log("booth name : " + boothData.booth_name);
            console.log("booth image : " + boothData.booth_image);
            
            // Ajax 요청 및 서버에 boothData 전송
            $.ajax({
                type: 'POST',
                url: 'mypage/add',
                contentType: 'application/json',
                data: JSON.stringify(boothData),
                success: function(response) {
                    console.log('Booth inserted successfully.');
                    console.log(response);
                    // booth_product 테이블에 데이터 삽입
                    insertBoothProduct(response);
                },
                error: function(error) {
                    console.error('Error inserting booth:', error);
                }
            });
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
    boothData.fstv_no = selectedFestival;
	boothData.seller_id = userId;
    boothData.booth_name = $('#booth-name').val();
    boothData.booth_category = $('#booth-type').val();
    boothData.booth_addr = $('#booth-loc').val();
    boothData.booth_tel = $('#booth-tel').val();
    boothData.booth_hours = $('#booth-hour').val();
    boothData.booth_introduction = $('#booth-intro').val();
	boothData.items = [];
    $(".item").each(function (index, element) {
        var itemName = $(element).find(".booth-item").val();
        var itemPrice = $(element).find(".booth-item-price").val();
        boothData.items.push({	product: itemName, price: itemPrice });
    });
}
function insertBoothProduct(boothNo) {
    // booth_product 테이블에 데이터 저장
    boothData.items.forEach(function(item) {
        item.booth_no = boothNo; // boothNo 값을 booth_product 데이터에 추가
    });

    // 각 상품에 대한 개별적인 Ajax 요청
    boothData.items.forEach(function(item, index, array) {
        $.ajax({
            type: 'POST',
            url: 'mypage/add-product',
            contentType: 'application/json',
            data: JSON.stringify(item), // 개별 상품 데이터 전송
            success: function(response) {
                console.log('Booth product inserted successfully.' + response);
                if (index === array.length - 1) {
                    $('#boothManage').click(); // 모든 상품 데이터 전송 완료시 부스목록 버튼 활성화
                }
            },
            error: function(error) {
                console.error('Error inserting booth product:', error);
            }
        });
    });
}
function isValidFormData() {
    // 각 필드의 값을 확인하고 빈 값이 있으면 false 반환
    if (
        !boothData.booth_name ||
        !boothData.booth_category ||
        !boothData.booth_addr ||
        !boothData.booth_tel ||
        !boothData.booth_hours ||
        !boothData.booth_introduction
    ) {
        return false;
    }

    // items 배열의 각 요소에 대해서도 빈 값 확인
    for (let i = 0; i < boothData.items.length; i++) {
        if (!boothData.items[i].product || !boothData.items[i].price) {
            return false;
        }
    }

    // 모든 필드가 비어있지 않으면 true 반환
    return true;
}



function isNanFormData(){
	for (let i = 0; i < boothData.items.length; i++) {
	        // 추가: 상품 가격이 숫자가 아닌 경우 false 반환
	        if (isNaN(boothData.items[i].price.trim())) {
	            return false;
	        }
	    }
	 return true;
}
function uploadAndSaveBoothImage(callback) {
    var formData = new FormData();
    formData.append('file', $('#booth-img')[0].files[0]);

    // 이미지 업로드 Ajax 요청
    $.ajax({
        type: 'POST',
        url: 'mypage/image.do',
        data: formData,
        contentType: false,
        processData: false,
        success: function (imageUrl) {
            console.log('이미지 업로드 성공.');
            console.log(imageUrl);
            // 이미지 URL을 boothData에 설정
            boothData.booth_image = imageUrl;
            console.log("booth image : " + boothData.booth_image);

            // 이미지 업로드 완료 후에 callback 호출
            callback();
        },
        error: function (error) {
            console.error('이미지 업로드 오류:', error);
        }
    });
}
