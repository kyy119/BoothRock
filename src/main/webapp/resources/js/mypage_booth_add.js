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
        // Ajax 요청 및 서버에 boothData 전송
        $.ajax({
            type: 'POST',
            url: 'add',
            contentType: 'application/json',
            data: JSON.stringify(boothData),
            success: function(response) {
                console.log('Booth inserted successfully.');
                console.log(response);
                // booth_product 테이블에 데이터 삽입
                insertBoothProduct(response);
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
    $('.tabmenu').click(function() {
			var activeTab = $(this).attr('data-tab'); //선택된 탭메뉴 li태그의 data-tab값 
			$('li').css('font-weight', 'normal');//선택되지 않은 메뉴명 원래대로 되돌리기
			$('li').find('span').css({
				'width' : '0px',
			});
			$(this).css('font-weight', 'bold'); //선택된 메뉴명굵기, 막대효과 
			$(this).find('span').css({
				'float' : 'left',
				'height' : '20px',
				'width' : '5px',
				'background-color' : '#876ed5'
			});
			$.ajax({
				url : activeTab, //탭메뉴 li태그의 data-tab
				data : {user_id : userId,
						user_role : userRole
				},
				success : function(x) {
					$('#result').html(x)
				}//success
			})//ajax 
		})//li
		$('#default').click();
});
function updateBoothData() {
    var selectedFestival = $('#fstv_title option:selected').val();
    console.log('Selected Festival:', selectedFestival);
    boothData.fstv_no = selectedFestival;
	boothData.seller_id = userId;
    boothData.booth_name = $('#booth-name').val();
    boothData.booth_category = $('#booth-type').val();
    boothData.booth_image = $('#booth-img').val();
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
            url: 'add-product',
            contentType: 'application/json',
            data: JSON.stringify(item), // 개별 상품 데이터 전송
            success: function(response) {
                console.log('Booth product inserted successfully.' + response);
                if (index === array.length - 1) {
                    loadBoothList();
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
    if (boothData.booth_name.trim() === '' ||
        boothData.booth_category.trim() === '' ||
        boothData.booth_image.trim() === '' ||
        boothData.booth_addr.trim() === '' ||
        boothData.booth_tel.trim() === '' ||
        boothData.booth_hours.trim() === '' ||
        boothData.booth_introduction.trim() === '') {
        return false;
    }

    // items 배열의 각 요소에 대해서도 빈 값 확인
    for (let i = 0; i < boothData.items.length; i++) {
        if (boothData.items[i].product.trim() === '' || boothData.items[i].price.trim() === '') {
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
function loadBoothList() {
    // 부스 목록을 Ajax로 불러오는 요청
    $.ajax({
        type: 'GET',
        url: 'mypage_booth',
        data: { user_id: userId },
        success: function(response) {
            console.log('Booth list loaded successfully.' + response);
            // 부스 목록이 성공적으로 로드되면 해당 목록을 페이지에 반영
            $('#result').html(response);
        },
        error: function(error) {
            console.error('Error loading booth list:', error);
        }
    });
}