<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta charset="utf-8"/>
	<title>Daum ���� �����ϱ�</title>
</head>
<body>
	<h2>����</h2>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=�߱޹��� API KEY�� �����ø� �˴ϴ�."></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
	<h2>���� ���� ���ε�</h2>
	<div>
		<h3>÷������</h3>
		<form class="board-form" method="post" action="/upa/user/attach" enctype="multipart/form-data">
		<input type="file" name="file">
		<input type="submit" value="���">
		</form>
	</div>
</body>
</html>