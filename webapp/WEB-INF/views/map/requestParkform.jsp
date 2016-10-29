<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/upa/theme/css/main.css">
<link rel="stylesheet" href="/upa/theme/css/responsive.css">
<link href="/upa/assets/css/user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/upa/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="/upa/assets/js/sweetalert.min.js"></script> 

<title>UPA REQUEST PARKING LOT</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/subheader.jsp" />
	<div class="container">
		<h2 style="margin: 0px auto;">주자장 등록하기</h2>
	
		<div id="maps"></div>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8b1213d39c6d1ac9748ce62f7bf32852&libraries=services"></script>
		<script>
			var container = document.getElementById('maps');
			var options = {
				center: new daum.maps.LatLng(37.381896, 126.929920),
				level: 3
			};
		
			var map = new daum.maps.Map(container, options);
			
			// 마우스 휠과 모바일 터치를 이용한 지도 확대, 축소를 막는다
			map.setZoomable(false); 
			
			// 지도 타입 변경 컨트롤을 생성한다
			var mapTypeControl = new daum.maps.MapTypeControl();
			
			// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	
			
			// 지도에 확대 축소 컨트롤을 생성한다
			var zoomControl = new daum.maps.ZoomControl();

			// 지도의 우측에 확대 축소 컨트롤을 추가한다
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
			// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    // 클릭한 위치에 마커를 표시합니다 
			    addMarker(mouseEvent.latLng);
			    alert('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
			});
			
			/* // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
			var markers = []; */


			// 마커를 생성하고 지도위에 표시하는 함수입니다
			function addMarker(position) {
			    
			    // 마커를 생성합니다
			    var marker = new daum.maps.Marker({
			        position: position // 마커를 드래그 가능하도록 설정한다
			    });

			    // 마커가 지도 위에 표시되도록 설정합니다
			    marker.setMap(map);
			    
			    // 생성된 마커를 배열에 추가합니다
			    markers.push(marker);
			}

			/* // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
			function setMarkers(map) {
			    for (var i = 0; i < markers.length; i++) {
			        markers[i].setMap(map);
			    }            
			} */
		</script>
		
		<div>
			<input type="text" id="address" value="">
			<button id="addSearch">해당 주소 찾기</button>
		</div>
		
		<div class="input-group clockpicker">
			<input type="text" class="form-control" value="09:30">
			<span class="input-group-addon">
				<span class="glyphicon glyphicon-time"></span>
			</span>
		</div>
		
		</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
<script>
$(function() {
	$("#addSearch").click(function(){
		console.log($("#address").val());
		
		if($("#address").val() == ""){
			sweetAlert("검색 주소를 입력하시지 않으셨습니다.","Something went wrong", "error");
		} else{
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addr2coord($("#address").val(), function(status, result) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		        
		        /* // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">검색 지역</div>'
		        });
		        infowindow.open(map, marker); */

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } else{
		    	sweetAlert("결과가 없습니다.","Something went wrong", "error");
		    }
		});
		}
		
	});
});
</script>
</html>