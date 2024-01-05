jQuery(document).ready(function(){

    $("#fa-solid fa-heart").on("click", function(){
        $(this).closest("li").remove();
        
    });
});

// 반응형 제이쿼리일뿐입니다 바로 찜 데이터에서 지워버리기!