<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fstv_map.css" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/js/fstv_map.js" defer type="text/javascript"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f555a223b0daef77d257c80c6f4e9ab0"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
	    <div class="fstv-map-form">
		    <div class="fstv-map">
	    		<h1><i class="fa-regular fa-map"></i> 전국축제지도</h1>
		    	<div id="Map"></div>
		    </div>
	        <div class="fstv-list-form"> <%-- 페이징 필요 --%>
	        	<div class="fstv-list-loc">
					<h2 class="changed-header"><i class="fa-solid fa-location-dot"></i> 서울</h2>
		        	<div class="sort"></div>
	        	</div>
	        	<div class="fstv-list"></div> <!-- 지역별 축제 리스트 들어가는 부분 -->
	        </div>
	    </div>
    </div>
	
	<%@ include file="footer.jsp" %>
	<script>
	
		var region = '서울';
		let list_url = "fstv/fstv_maplist";
		
		jQuery(document).ready(function(){
			console.log(region);
			$.ajax({
				url : list_url,
				data : {
		        region : region
				},
				success : function(list) {
					$('.fstv-list').html(list);
					append_date();
				}
			})
			
		})
		
		var areas = [];
		// JSON 파일을 읽어들여 areas 배열을 채워넣는 작업
		// getJSON도 ajax 메소드와 같이 async(비동기) 방식으로 동작하는데, 순차실행을 위해 이걸 강제로 sync 방식으로 동작하도록 함.
		$.ajaxSetup({
			async : false 
		}); 
		
		$.getJSON("resources/map_position_list.json", function(geojson) {	// getJSON 메소드를 이용해 JSON 파일을 파싱함
			var units = geojson.features; 									// 파일에서 key값이 "features"인 것의 value를 통으로 가져옴(이것은 여러지역에 대한 정보를 모두 담고있음)			
			$.each(units, function(index, unit) { 							// 1개 지역씩 꺼내서 사용함. val은 그 1개 지역에 대한 정보를 담음
				var coordinates = [];										// 좌표 저장할 배열
				var name = ''; 												// 지역 이름
				var lat = 0;												// 마커 위도
				var lng = 0;												// 마커 경도
	
				coordinates = unit.geometry.coordinates;					// 1개 지역의 영역을 구성하는 도형의 모든 좌표 배열을 가져옴 
				name = unit.properties.CTP_ENG_NM; 							// 1개 지역의 이름을 가져옴
				lat = unit.properties.LAT;
				lng = unit.properties.LNG;
	
				var ob = new Object();
				ob.name = name;
				ob.lat = lat;
				ob.lng = lng;
				ob.path = [];
				ob.lng = lng;
				$.each(coordinates[0], function(index, coordinate) {		 // []로 한번 더 감싸져 있어서 index 0번의 것을 꺼내야 배열을 접근가능.
					ob.path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
				});
	
				areas[index] = ob;
			});//each
		});//getJSON
		
		var MapContainer = document.getElementById('Map'),					// 이미지 지도를 표시할 div  
		MapOption = {
			center: new kakao.maps.LatLng(35.9882085, 127.8579557), 		// 지도의 중심좌표
	        level: 12.7
		};
		
		var map = new kakao.maps.Map(MapContainer, MapOption),
	    	customOverlay = new kakao.maps.CustomOverlay({}),
			customOverlay2 = new kakao.maps.CustomOverlay({});
		
		for (var i = 0, len = areas.length; i < len; i++) {					// 폴리곤 도형을 지도위에 띄우고 마우스 이벤트 붙이기
			displayArea(areas[i]);
		}
		
		var selectedMarker = null;
		var selectedCO = null;
		var selectedPol = null;
		
		customOverlay.setContent('<span id="area">서울</span>');		
        customOverlay.setPosition(new kakao.maps.LatLng(37.570087, 126.962789));
        customOverlay.setMap(map);

		function displayArea(area) {												// 폴리곤, 마커 생성 + 이벤트 등록 함수

			var imageSize = new kakao.maps.Size(40, 40); 							// 마커 이미지 크기 조절
			var imageSrc = "resources/img/normalMarker.png", 						// 마커 이미지 경로
				imageSrc2 = "resources/img/clickMarker.png";
			var normalImage = new kakao.maps.MarkerImage(imageSrc, imageSize), 		// 마커 이미지 생성
				clickImage = new kakao.maps.MarkerImage(imageSrc2, imageSize);
			
		    var marker = new kakao.maps.Marker({									// 마커 생성
		        map: map,
		        position: new kakao.maps.LatLng(area.lat, area.lng), 				// 마커 표시 위치
		        title : area.name,
		        image : normalImage 												// 마커 이미지 
		    });
			
			marker.normalImage = normalImage;
			
		    var polygon = new kakao.maps.Polygon({		    						// 폴리곤 생성
		        map: map,
		        path: area.path,													// 폴리곤 경로
		        strokeWeight: 2,													// 외곽선 굵기
		        strokeColor: '#fff',												// 외곽선 색상
		        strokeOpacity: 0.8,													// 외곽선 투명도
		        fillColor: '#e9e3f7',													// 내부 섹싱
		        fillOpacity: 1 														// 내부 색상 투명도
		    });
		    
		    kakao.maps.event.addListener(marker, 'mouseover', function(mouseEvent) {			// 마커에 mouseover 이벤트 등록 mouseover시 폴리곤의 채움색 변경 + 커스텀 오버레이 표시

		    	if (!selectedMarker || selectedMarker !== marker) {								// 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면 마커의 이미지를 클릭이미지로 변경
		            marker.setImage(clickImage);
		            
				    !!selectedPol && selectedPol.setOptions({fillColor: '#e9e3f7'});				// 클릭된 폴리곤 객체가 null이 아니면 클릭된 마커의 폴리곤 채움색을 기본색을 변경
			        polygon.setOptions({fillColor: '#fddd9b'});									// 마커에 마우스를 둘 때 변하는 색
			        
			    	customOverlay2.setContent('<div id="area2">' + area.name + '</div>');		// 마커에 마우스를 올렸을 때 오버레이되는 컨텐츠(div)
				    customOverlay2.setPosition(new kakao.maps.LatLng(area.lat, area.lng));
				    customOverlay2.setMap(map);
		        }
		    });
	
		    kakao.maps.event.addListener(marker, 'mouseout', function() {						// 마커에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
		    	if (!selectedMarker || selectedMarker !== marker) {
		            marker.setImage(normalImage);
		            !!selectedPol && selectedPol.setOptions({fillColor: '#fddd9b'});			// 선택된 폴리곤이 있으면 마커에서 마우스를 뗐을 때 그 폴리곤을 다시 칠함
		            polygon.setOptions({fillColor: '#e9e3f7'});
		            customOverlay2.setMap(null);
		        }
		    }); 
	
		    kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {				// 마커에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
		    	if (!selectedMarker || selectedMarker !== marker) {
		            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);	// 클릭된 마커 객체가 null이 아니면 클릭된 마커의 이미지를 기본 이미지로 변경
		            marker.setImage(clickImage);												// 현재 클릭된 마커의 이미지는 클릭 이미지로 변경
		            !!selectedPol && selectedPol.setOptions({fillColor: '#e9e3f7'});				// 클릭된 폴리곤 객체가 null이 아니면 클릭된 마커의 폴리곤 채움색을 기본색을 변경
			        polygon.setOptions({fillColor: '#fddd9b'});									// 현재 클릭된 마커의 폴리곤 채움색을 설정한 값으로 변경
			        
		        	customOverlay.setContent('<span id="area">' + area.name + '</span>');		
			        customOverlay.setPosition(new kakao.maps.LatLng(area.lat, area.lng));	
			        customOverlay.setMap(map);
			        
			        region = document.getElementById('area').innerText;							// 지도에서 선택한 지역명을 데이터로 가져옴
			        updateHeaderTextValue(region);												// 선택한 지역명으로 우측 title 변경 함수
			        
			        if(region === '충남'){
			        	region = '충청남도';
			        }else if(region === '충북'){
			        	region = '충청북도';
			        }else if(region === '전남'){
			        	region = '전라남도';
			        }else if(region === '전북'){
			        	region = '전라북도';
			        }else if(region === '경북'){
			        	region = '경상북도';
			        }else if(region === '경남'){
			        	region = '경상남도';
			        }else if(region === '부산'){
			        	region = '부산광역시';
			        }else if(region === '대구'){
			        	region = '대구광역시';
			        }else if(region === '세종'){
			        	region = '세종특별자치시';
			        }else if(region === '울산'){
			        	region = '울산광역시';
			        }else if(region === '서울'){
			        	region = '서울특별시';
			        }else if(region === '광주'){
			        	region = '광주광역시';
			        }
			        
			        $.ajax({
						url : list_url,
						data : {
				        region : region
						},
						success : function(list) {
							$('.fstv-list').html(list);
							append_date();
						}
					})
					
		        }
		    	selectedMarker = marker;
		    	selectedPol = polygon;
		    });
		}
		map.setDraggable(false);	// 지도 드래그 막기
		map.setZoomable(false);		// 지도 확대,축소 막기
		
		function updateHeaderTextValue(newText) {
			var currentValue = $('.changed-header').find('i.fa-location-dot').parent();
		    currentValue.html('<i class="fa-solid fa-location-dot"></i> ' + newText);
		}
		
		function append_date() {
		    $('li.fstv-end').append('<div class="fstv-end-text">축제종료</div>');
		    $('li.fstv-will').append('<div class="fstv-will-text">개최예정</div>');
		}
		
	    $('#Map').css('background', 'none');
	    $('#Map > div:nth-child(1) > div > div:nth-child(2)').css('display', 'none');
	    $('#Map > div:nth-child(1) > div > div:nth-child(6) > div > img').on('click', function() {
    		$(this).parent().addClass('img-before');
    		$(this).parent().siblings().removeClass('img-before');
		});

	    
	    
	</script>
</body>
</html>
