<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <link rel="stylesheet" href="./css/material.min.css" /> -->

<link rel="stylesheet" href="/upa/assets/css/bootstrap-material-datetimepicker.css" />
<link rel="stylesheet" href="/upa/assets/css/material.min.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="/upa/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="/upa/assets/js/bootstrap-material-datetimepicker.js"></script>

<!-- <script src="/upa/theme/js/bootstrap.min.js"></script> -->
<!-- <script type="text/javascript" src="/upa/assets/js/material.min.js"></script> -->
<head>
	<meta charset="utf-8"/>
	<title>Daum ���� �����ϱ�</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/subheader.jsp" />
	<h2>����</h2>
	<div id="map" style="width:500px;height:400px;"></div>
	<!-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8b1213d39c6d1ac9748ce62f7bf32852&libraries=services"></script> -->
	<script>
		/* var MARKER_WIDTH = 33, // �⺻, Ŭ�� ��Ŀ�� �ʺ�
	    MARKER_HEIGHT = 36, // �⺻, Ŭ�� ��Ŀ�� ����
	    OFFSET_X = 12, // �⺻, Ŭ�� ��Ŀ�� ���� X��ǥ
	    OFFSET_Y = MARKER_HEIGHT, // �⺻, Ŭ�� ��Ŀ�� ���� Y��ǥ
	    OVER_MARKER_WIDTH = 40, // ���� ��Ŀ�� �ʺ�
	    OVER_MARKER_HEIGHT = 42, // ���� ��Ŀ�� ����
	    OVER_OFFSET_X = 13, // ���� ��Ŀ�� ���� X��ǥ
	    OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // ���� ��Ŀ�� ���� Y��ǥ
	    SPRITE_MARKER_URL = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // ��������Ʈ ��Ŀ �̹��� URL
	    SPRITE_WIDTH = 126, // ��������Ʈ �̹��� �ʺ�
	    SPRITE_HEIGHT = 146, // ��������Ʈ �̹��� ����
	    SPRITE_GAP = 10; // ��������Ʈ �̹������� ��Ŀ�� ����
	
		var markerSize = new daum.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // �⺻, Ŭ�� ��Ŀ�� ũ��
	    markerOffset = new daum.maps.Point(OFFSET_X, OFFSET_Y), // �⺻, Ŭ�� ��Ŀ�� ������ǥ
	    overMarkerSize = new daum.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // ���� ��Ŀ�� ũ��
	    overMarkerOffset = new daum.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // ���� ��Ŀ�� ���� ��ǥ
	    spriteImageSize = new daum.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // ��������Ʈ �̹����� ũ��	 */
		
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
		var geocoder = new daum.maps.services.Geocoder();

		var marker = new daum.maps.Marker(), // Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
		infowindow = new daum.maps.InfoWindow({zindex:1}); // Ŭ���� ��ġ�� ���� �ּҸ� ǥ���� �����������Դϴ�

		// ���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// ������ Ŭ������ �� Ŭ�� ��ġ ��ǥ�� ���� �ּ������� ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
		        if (status === daum.maps.services.Status.OK) {
		            var detailAddr = !!result[0].roadAddress.name ? '<div>���θ��ּ� : ' + result[0].roadAddress.name + '</div>' : '';
		            detailAddr += '<div>���� �ּ� : ' + result[0].jibunAddress.name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">������ �ּ�����</span>' + 
		                            detailAddr + 
		                        '</div>';

		            // ��Ŀ�� Ŭ���� ��ġ�� ǥ���մϴ� 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);

		            // ���������쿡 Ŭ���� ��ġ�� ���� ������ �� �ּ������� ǥ���մϴ�
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		        }   
		    });
		});

		// �߽� ��ǥ�� Ȯ�� ������ ������� �� ���� �߽� ��ǥ�� ���� �ּ� ������ ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
		daum.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
		    // ��ǥ�� ������ �ּ� ������ ��û�մϴ�
		    geocoder.coord2addr(coords, callback);         
		}

		function searchDetailAddrFromCoords(coords, callback) {
		    // ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
		    geocoder.coord2detailaddr(coords, callback);
		}

		// ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
		function displayCenterInfo(status, result) {
		    if (status === daum.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
		        infoDiv.innerHTML = result[0].fullName;
		    }    
		}
		/* var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
	        overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
	        clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin); */
	</script>
	<h2>���� ���� ���ε�</h2>
	<div>
		<h3>÷������</h3>
		<form class="board-form" method="post" action="/upa/user/attach" enctype="multipart/form-data">
		<input type="file" name="file">
		<input type="submit" value="���">
		</form>
	</div>

		 <div class="form-group">
		    <label for="inputNumber" class="col-sm-2 control-label">���۽ð�</label>
		    <div class="col-sm-3">
		    	<div class="form-control-wrapper">
					<input type="text" id="time" class="form-control empty" data-dtp="dtp-gs7M1" placeholder="ex.12:00">
				</div>
		    </div>
	    </div>
	<div>
		<img>
	</div>    
	<div id="cma_image" style="width:95%; max-width:100%; border:1px solid #c0c0c0;display:none;"></div>
	<input type="file" name="file" id="file accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))">
	
</body>
<script>
$(document).ready(function(){
	$('#time').bootstrapMaterialDatePicker
	({
		date: false,
		shortTime: true,
		format: 'HH:mm'
	});
	$.material.init();
});	
</script>
<script>
function getThumbnailPrivew(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // ������� ������
            $target.html('<img src="' + e.target.result + '" border="0" alt="" width="300px" height="300px" />');
        }
        reader.readAsDataURL(html.files[0]);
    }
}
</script>
</html>