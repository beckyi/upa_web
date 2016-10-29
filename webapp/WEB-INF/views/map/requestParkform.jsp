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
		<h2 style="margin: 0px auto;">������ ����ϱ�</h2>
	
		<div id="maps"></div>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8b1213d39c6d1ac9748ce62f7bf32852&libraries=services"></script>
		<script>
			var container = document.getElementById('maps');
			var options = {
				center: new daum.maps.LatLng(37.381896, 126.929920),
				level: 3
			};
		
			var map = new daum.maps.Map(container, options);
			
			// ���콺 �ٰ� ����� ��ġ�� �̿��� ���� Ȯ��, ��Ҹ� ���´�
			map.setZoomable(false); 
			
			// ���� Ÿ�� ���� ��Ʈ���� �����Ѵ�
			var mapTypeControl = new daum.maps.MapTypeControl();
			
			// ������ ��� ������ ���� Ÿ�� ���� ��Ʈ���� �߰��Ѵ�
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	
			
			// ������ Ȯ�� ��� ��Ʈ���� �����Ѵ�
			var zoomControl = new daum.maps.ZoomControl();

			// ������ ������ Ȯ�� ��� ��Ʈ���� �߰��Ѵ�
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
			// ������ Ŭ�������� Ŭ���� ��ġ�� ��Ŀ�� �߰��ϵ��� ������ Ŭ���̺�Ʈ�� ����մϴ�
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    // Ŭ���� ��ġ�� ��Ŀ�� ǥ���մϴ� 
			    addMarker(mouseEvent.latLng);
			    alert('�������� Ŭ���� ��ġ�� ��ǥ�� ' + mouseEvent.latLng.toString() + ' �Դϴ�.');
			});
			
			/* // ������ ǥ�õ� ��Ŀ ��ü�� ������ ���� �迭�Դϴ�
			var markers = []; */


			// ��Ŀ�� �����ϰ� �������� ǥ���ϴ� �Լ��Դϴ�
			function addMarker(position) {
			    
			    // ��Ŀ�� �����մϴ�
			    var marker = new daum.maps.Marker({
			        position: position // ��Ŀ�� �巡�� �����ϵ��� �����Ѵ�
			    });

			    // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
			    marker.setMap(map);
			    
			    // ������ ��Ŀ�� �迭�� �߰��մϴ�
			    markers.push(marker);
			}

			/* // �迭�� �߰��� ��Ŀ���� ������ ǥ���ϰų� �����ϴ� �Լ��Դϴ�
			function setMarkers(map) {
			    for (var i = 0; i < markers.length; i++) {
			        markers[i].setMap(map);
			    }            
			} */
		</script>
		
		<div>
			<input type="text" id="address" value="">
			<button id="addSearch">�ش� �ּ� ã��</button>
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
			sweetAlert("�˻� �ּҸ� �Է��Ͻ��� �����̽��ϴ�.","Something went wrong", "error");
		} else{
		// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
		var geocoder = new daum.maps.services.Geocoder();

		// �ּҷ� ��ǥ�� �˻��մϴ�
		geocoder.addr2coord($("#address").val(), function(status, result) {
		    // ���������� �˻��� �Ϸ������ 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		        
		        /* // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">�˻� ����</div>'
		        });
		        infowindow.open(map, marker); */

		        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
		        map.setCenter(coords);
		    } else{
		    	sweetAlert("����� �����ϴ�.","Something went wrong", "error");
		    }
		});
		}
		
	});
});
</script>
</html>