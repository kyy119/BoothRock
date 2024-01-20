<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 축제의 부스를 담다 - 부스락</title>
    <link rel="stylesheet" href="resources/css/fstv_map.css" type="text/css">
    <script src="resources/js/fstv_map.js" defer type="text/javascript"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bfc76317e78b81b1a32b1be44269182"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="bodywrap">
	    <div class="fstv-map-form">
		    <div class="fstv-map">
	    		<h1>전국축제지도</h1>
		    	<div id="Map"></div>
		    </div>
	        <div class="fstv-list-form"> <%-- 페이징 필요 --%>
	        	<div class="fstv-list-loc">
					<h2><i class="fa-solid fa-location-dot"></i> 서울</h2>
		        	<div class="sort">
		        		<button id="def-btn" class="bold-text">기본순</button> | <button id="pop-btn">인기순</button>
		        	</div>
	        	</div>
	        	<div class="fstv-list"></div> <!-- 지역별 축제 리스트 들어가는 부분 -->
	        </div>
	    </div>
    </div>
	
	<%@ include file="footer.jsp" %>
	<script>
	
	var region = '서울';
	let list_url = "fstv_maplist";
	
		jQuery(document).ready(function(){
			console.log(region);
			$.ajax({
				url : list_url,
				data : {
		        region : region
				},
				success : function(list) {
					$('.fstv-list').html(list);
				}
			})
			
			$('#area').on('DOMSubtreeModified', function() {
	            // span 태그의 텍스트가 변경되면 실행할 함수
	            var newText = $('#area').text(); // 변경된 텍스트 가져오기
	            // Ajax 실행 함수
	            // executeAjax(newText);
	            console.log(newText);
	        });
			
		})
		
		
		var areas = [];
		/* 1. JSON 파일을 읽어들여 areas 배열을 채워넣는 작업 */
		// 1) getJSON도 ajax 메소드와 같이 async(비동기) 방식으로 동작하는데, 순차실행을 위해 이걸 강제로 sync 방식으로 동작하도록 함.
		$.ajaxSetup({
			async : false 
		}); 
		
		// 2) getJSON 메소드를 이용해 JSON 파일을 파싱함
		$.getJSON("resources/map_position_list.json", function(geojson) {
			var units = geojson.features; // 파일에서 key값이 "features"인 것의 value를 통으로 가져옴(이것은 여러지역에 대한 정보를 모두 담고있음)			
			$.each(units, function(index, unit) { // 1개 지역씩 꺼내서 사용함. val은 그 1개 지역에 대한 정보를 담음
				var coordinates = [];	//좌표 저장할 배열
				var name = ''; 			// 지역 이름
				var lat = 0;			// 마커 위도
				var lng = 0;			// 마커 경도
	
				coordinates = unit.geometry.coordinates;	// 1개 지역의 영역을 구성하는 도형의 모든 좌표 배열을 가져옴 
				name = unit.properties.CTP_ENG_NM; 			// 1개 지역의 이름을 가져옴
				lat = unit.properties.LAT;
				lng = unit.properties.LNG;
	
				var ob = new Object();
				ob.name = name;
				ob.lat = lat;
				ob.lng = lng;
				ob.path = [];
				ob.lng = lng;
				$.each(coordinates[0], function(index, coordinate) { // []로 한번 더 감싸져 있어서 index 0번의 것을 꺼내야 배열을 접근가능.
					ob.path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
				});
	
				areas[index] = ob;
			});//each
		});//getJSON
		

		var MapContainer = document.getElementById('Map'),				// 이미지 지도를 표시할 div  
		MapOption = {
			center: new kakao.maps.LatLng(35.9882085, 127.8579557), 	// 지도의 중심좌표
	        level: 13 													// 지도의 확대 레벨
		};
		
		var map = new kakao.maps.Map(MapContainer, MapOption),
	    	customOverlay = new kakao.maps.CustomOverlay({}),
			customOverlay2 = new kakao.maps.CustomOverlay({});
		
		/* 3. 폴리곤 도형을 지도위에 띄우고 마우스 이벤트 붙이기 */
		for (var i = 0, len = areas.length; i < len; i++) {				// 지역데이터를 폴리곤 표시 
			displayArea(areas[i]);
		}
		
		function displayBack(area) {
			var polygon = new kakao.maps.Polygon({		    						// 다각형을 생성합니다 
		        map: map, 															// 다각형을 표시할 지도 객체
		        path: area.path,
		        strokeWeight: 2,													// 외곽선 굵기
		        strokeColor: '#004c80',												// 외곽선 색상
		        strokeOpacity: 0.8,													// 외곽선 투명도
		        fillColor: '#dc362eff',												// 내부 섹싱
		        fillOpacity: 0.5 													// 내부 색상 투명도
		    });
		}
		
		var selectedMarker = null;
		var selectedCO = null;
		var selectedPol = null;
		
		// 폴리곤, 마커 생성 + 이벤트 등록 함수
		function displayArea(area) {

			var imageSize = new kakao.maps.Size(40, 40); 							// 마커 이미지 크기 조절
			var imageSrc = "resources/img/normalMarker.png", 						// 마커 이미지 경로
				imageSrc2 = "resources/img/clickMarker.png";
			var normalImage = new kakao.maps.MarkerImage(imageSrc, imageSize), 		// 마커 이미지 생성
				clickImage = new kakao.maps.MarkerImage(imageSrc2, imageSize);
			
		    var marker = new kakao.maps.Marker({									// 마커를 생성합니다
		        map: map, 															// 마커를 표시할 지도
		        position: new kakao.maps.LatLng(area.lat, area.lng), 				// 마커를 표시할 위치
		        title : area.name, 													// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : normalImage 												// 마커 이미지 
		    });
			
			marker.normalImage = normalImage;
			
		    var polygon = new kakao.maps.Polygon({		    						// 다각형을 생성합니다 
		        map: map, 															// 다각형을 표시할 지도 객체
		        path: area.path,
		        strokeWeight: 2,													// 외곽선 굵기
		        strokeColor: '#004c80',												// 외곽선 색상
		        strokeOpacity: 0.8,													// 외곽선 투명도
		        fillColor: '#fff',													// 내부 섹싱
		        fillOpacity: 1 														// 내부 색상 투명도
		    });
		    
		    // 마커에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
		    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
		    kakao.maps.event.addListener(marker, 'mouseover', function(mouseEvent) {
		    	// 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면 마커의 이미지를 클릭이미지로 변경
		    	// mouserover된 co가 클릭된 co가 아니면 co의 이미지를 띄움
		    	if (!selectedMarker || selectedMarker !== marker) {	
		            marker.setImage(clickImage);
		            
				    !!selectedPol && selectedPol.setOptions({fillColor: '#fff'});				// 클릭된 폴리곤 객체가 null이 아니면 클릭된 마커의 폴리곤 채움색을 기본색을 변경
			        polygon.setOptions({fillColor: '#99e8c5'});									// 마커에 마우스를 둘 때 변하는 색
			        
			    	customOverlay2.setContent('<div id="area2">' + area.name + '</div>');		// 마커에 마우스를 올렸을 때 오버레이되는 컨텐츠(div)
				    customOverlay2.setPosition(new kakao.maps.LatLng(area.lat, area.lng));
				    customOverlay2.setMap(map);
		        }
		    });
	
		    // 마커에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
		    kakao.maps.event.addListener(marker, 'mouseout', function() {
		    	if (!selectedMarker || selectedMarker !== marker) {
		            marker.setImage(normalImage);
		            !!selectedPol && selectedPol.setOptions({fillColor: '#99e8c5'});			// 선택된 폴리곤이 있으면 마커에서 마우스를 뗐을 때 그 폴리곤을 다시 칠함
		            polygon.setOptions({fillColor: '#fff'});
		            customOverlay2.setMap(null);
		        }
		    }); 
	
		    // 마커에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
		    kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
		    	if (!selectedMarker || selectedMarker !== marker) {
		            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);	// 클릭된 마커 객체가 null이 아니면 클릭된 마커의 이미지를 기본 이미지로 변경
		            marker.setImage(clickImage);												// 현재 클릭된 마커의 이미지는 클릭 이미지로 변경
		            !!selectedPol && selectedPol.setOptions({fillColor: '#fff'});				// 클릭된 폴리곤 객체가 null이 아니면 클릭된 마커의 폴리곤 채움색을 기본색을 변경
			        polygon.setOptions({fillColor: '#99e8c5'});									// 현재 클릭된 마커의 폴리곤 채움색을 설정한 값으로 변경
			        
		        	customOverlay.setContent('<span id="area" class="'+ area.name +'">' + area.name + '</span>');		
			        customOverlay.setPosition(new kakao.maps.LatLng(area.lat, area.lng));	
			        customOverlay.setMap(map);
		        }
		    	//selectedCO = customOverlay;
		    	selectedMarker = marker;
		    	selectedPol = polygon;
		    });
		}
		map.setDraggable(false);	// 지도 드래그 막기
		map.setZoomable(false);		// 지도 확대,축소 막기
	</script>
</body>
</html>
