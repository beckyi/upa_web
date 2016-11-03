<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/upa/assets/css/material.min.css" />
<link rel="stylesheet" href="/upa/theme/css/main.css">
<link rel="stylesheet" href="/upa/theme/css/responsive.css">
<link rel="stylesheet" href="/upa/assets/css/bootstrap-material-datetimepicker.css" />
<link href="/upa/assets/css/user.css" rel="stylesheet" type="text/css">


<script type="text/javascript" src="/upa/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="/upa/assets/js/sweetalert.min.js"></script> 
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="/upa/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="/upa/assets/js/bootstrap-material-datetimepicker.js"></script>

<title>UPA REQUEST PARKING LOT</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/subheader.jsp" />
	<!-- <div id="back1">
		<div class="container">
			<h2 style="margin: 0px auto 50px;">������ ����ϱ�</h2>
		</div>
	</div> -->
	<div id="back1">
		<div class="container">
			<div id="title1">
				<h1>UPA ������ ��� ��û</h1>
			</div>
			<div id ="title1_p">
				<p>�ȳ��ϼ���, �켱 �������� �������ּż� ������ ������ �帳�ϴ�.</p>
				<p>�������� �������ֽø�, <em id="emphasis">UPA</em>���� ȸ������ ������ Ȯ�� ������ ���� ����ϰ� �˴ϴ�.</p>
			</div>
		</div>
	</div>

	<div class="container">
		 <div class="page-header">
		  <h3>�⺻���� <small>������ ���� ����</small></h3>
	    </div>
	    <form class="form-horizontal" id="request-form" name="requestForm" method="post" action="/upa/map/insert" style="margin-bottom: margin-bottom: 80px;">
	    <div class="container" style="padding: 29px 0px 5px;">
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">������ �̸�</label>
			    <div class="col-sm-4">
			    	<input type="text" class="form-control" id="name" name="name" value="" placeholder="��ҿ� �������� �����ּ���.">
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">���</label>
			    <div class="col-sm-3">
			    	<input type="text" class="form-control" id="fee" name="fee" value="" placeholder="���ڸ� �Է�">
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">���۽ð�</label>
			    <div class="col-sm-3">
			    	<div class="form-control-wrapper">
						<input type="text" name="starttime" id="starttime" class="form-control empty" data-dtp="dtp-gs7M1" placeholder="ex.12:00">
					</div>
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">�����ð�</label>
			    <div class="col-sm-3">
			    	<div class="form-control-wrapper">
						<input type="text" id="endtime" name="endtime" class="form-control empty" data-dtp="dtp-gs7M1" placeholder="ex.12:00">
					</div>
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">���ǻ���</label>
			    <div class="col-sm-8">
			    	<input type="text" class="form-control" id="note" name="note" value="" placeholder="����� �����ڿ��� ����� ���� �� �����ø� �����ּ���.">
			    </div>
		    </div>
	    </div>
		<!-- <div class="input-group clockpicker">
			<input type="text" class="form-control" value="09:30">
			<span class="input-group-addon">
				<span class="glyphicon glyphicon-time"></span>
			</span>
		</div> -->
		
		<div class="page-header">
		  <h3>������ ��ġ <small>������ ��ġ�� ǥ��</small></h3>
	    </div>
	    
	    <div style="width: 680px; margin: 25px 213px 30px;">
			<p id="txt3">�ش� �ּ� ã��: &nbsp;</p>
			<div>
				<input type="text" id="address" value="" placeholder="������ �Ǵ� ���ּ�">
				<input type="button" id="addressSearch" value="�ּ� ã��">
			</div>
			<p id="searchbottom">�� ������ �Ǵ� �� �ּҸ� �Է��ϼž� �մϴ�. ex) �����(x), ���ȱ� (o), ������з� 53 (o)</p>
			<font name="positionT" id="positionT"></font>
			<font name="addressT" id="addressT"></font>
		</div>
		<div id="map" style="width:80%;height:450px; margin:5px auto;"></div>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8b1213d39c6d1ac9748ce62f7bf32852&libraries=services"></script>
		<script>
			var container = document.getElementById('map');
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
			
			// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
			var geocoder = new daum.maps.services.Geocoder();

			var marker = new daum.maps.Marker(), // Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
			infowindow = new daum.maps.InfoWindow({zindex:1}); // Ŭ���� ��ġ�� ���� �ּҸ� ǥ���� �����������Դϴ�

			// ���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);

			// ������ Ŭ������ �� Ŭ�� ��ġ ��ǥ�� ���� �ּ������� ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {
				var positionT = mouseEvent.latLng.toString();
				$('font[name=positionT]').html(positionT);
				/* alert('�������� Ŭ���� ��ġ�� ��ǥ�� ' + mouseEvent.latLng.toString() + ' �Դϴ�.'); */
			    searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
			        if (status === daum.maps.services.Status.OK) {
			            var detailAddr = !!result[0].roadAddress.name ? '<div>���θ��ּ� : ' + result[0].roadAddress.name + '</div>' : '';
			            detailAddr += '<div>���� �ּ� : ' + result[0].jibunAddress.name + '</div>';
			            
			            $('font[name=addressT]').html(result[0].jibunAddress.name);
			            
			            var content = '<div class="bAddr" style="width: 283px;">' +
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
			
			/* // ������ Ŭ�������� Ŭ���� ��ġ�� ��Ŀ�� �߰��ϵ��� ������ Ŭ���̺�Ʈ�� ����մϴ�
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    // Ŭ���� ��ġ�� ��Ŀ�� ǥ���մϴ� 
			    alert('�������� Ŭ���� ��ġ�� ��ǥ�� ' + mouseEvent.latLng.toString() + ' �Դϴ�.');
			    addMarker(mouseEvent.latLng);
			});
			
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
			} */

			/* // �迭�� �߰��� ��Ŀ���� ������ ǥ���ϰų� �����ϴ� �Լ��Դϴ�
			function setMarkers(map) {
			    for (var i = 0; i < markers.length; i++) {
			        markers[i].setMap(map);
			    }            
			} */
		</script>
		  <!-- �̹��� ���� -->
	     <div class="page-header" style="margin-top: 85px;">
		  	<h3>�̹��� ���� <small>������ �̹��� 3���� �ʿ��մϴ�.</small></h3>
    	 </div>
	     <div class="container" style="padding: 29px 0px 5px;">
		 <!--  <div class="fileinput-button">
		     <input multiple="multiple" type="file" name="filename[]" />
		   </div> -->
		    
		    <table class="table table-hover" style="width:70%; margin:5px auto; text-align: center;">
		    	<THEAD>
					<TR>
					<TH style="text-align: center; width: 145px;">#</TH>
					<TH>���� (���ϸ�)</TH>
					</TR>
				</THEAD>
				<TBODY>
				<TR>
				<TD>1</TD>
				<TD><input type=file size=40 name="image" id="file1"></TD>
				</TR>
				<TR>
				<TD>2</TD>
				<TD><input type=file size=40 name="image2" id="file2"></TD>
				</TR>
				<TR>
				<TD>3</TD>
				<TD><input type=file size=40 name="image3" id="file3"></TD>
				</TR>
				</TBODY>
		    </table>
		    
		  <!--   <table cellpadding="0" cellspacing="0" id="dynamic_table" border="1" style="width: 40%; margin: 0px auto; text-align:center; height: 120px;">
				<tr><td width="80px" style="background:#428bca; color:white;">�̹��� 1</td><td style="padding-left: 10px;" width="140"><input type=file size=40 name="image" id="file1"></td></tr>
				<tr><td width="80px" style="background:#428bca; color:white;">�̹��� 2</td><td style="padding-left: 10px;"><input type=file size=40 name="image2" id="file2"></td></tr>
				<tr><td width="80px" style="background:#428bca; color:white;">�̹��� 3</td><td style="padding-left: 10px;"><input type=file size=40 name="image3" id="file3"></td></tr>
			</table> -->
		    
		    <div id="cma_image" style="width:100%; max-width:100%; text-align: center; display:none;"></div>
	    </div>
		<div style="width: 400px; margin: 90px auto;">
			<input class="btn btn-primary btn-register" type="button" value="����ϱ�" id="regis">
			<!-- <input class="btn btn-primary btn-register" type="button" value="���" id="cancel" src="javascript:history.go(-1);" > -->
			<a href="javascript:history.go(-1);" id="cancel">���</a>
		</div>
		</form>
		</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
<!-- �ּ� �˻���ư -->
<script>
$(function() {
	
	$("#positionT").hide();
	$("#addressT").hide();
	
	$("#addressSearch").click(function(){
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
	
	$("#regis").on("click",function(){
		console.log('click');
		var name = $("#name").val();
		var fee = $("#fee").val();
		var starttime = $("#starttime").val();
		var endtime = $("#endtime").val();
		var note = $("#note").val();
		var positionT = $("#positionT").text();
		var address = $("#addressT").text();
		
		/*��ǥ ���� �ڸ���*/
		var positionTA = positionT.substring(1,positionT.length-1);
		afterStr = positionTA.split(', ');
		
		var latitude = afterStr[0];
		var longitude = afterStr[1];
		
		console.log(latitude);
		console.log(longitude);
		
		if(name == ""){
			$("#name").focus();
			sweetAlert("������ �̸��� �Է����ּ���.","Something went wrong", "error");
			return false;
		}
		
		regmoney = /^[1-9][0-9]*$/;
		if(fee == ""){
			$("#fee").focus();
			sweetAlert("����� �Է����ּ���.","Something went wrong", "error");
			return false;
		} else{
			if(!regmoney.test($("#fee").val())) { 
			      $("#fee").focus(); 
			   		 sweetAlert("��� �Է���\n�߸��Ǿ����ϴ�.","Something went wrong", "error");
		 	     return false; 
				}
		}
		
		var regtimeRegExp = /^([1-9]|[01][0-9]|2[0-3]):([0-5][0-9])$/;
		if(starttime == ""){
			$("#starttime").focus();
			sweetAlert("���� �ð��� �Է����ּ���.","Something went wrong", "error");
			return false;
		} else{
			if(!regtimeRegExp.test($("#starttime").val())) { 
		      $("#starttime").focus(); 
		   		 sweetAlert("���۽ð� �Է���\n�߸��Ǿ����ϴ�.","Something went wrong", "error");
	 	     return false; 
			}
		}
		
		if(endtime == ""){
			$("#endtime").focus();
			sweetAlert("�� �ð��� �Է����ּ���.","Something went wrong", "error");
			return false;
		} else{
			if(!regtimeRegExp.test($("#endtime").val())) { 
		      $("#endtime").focus(); 
		   		 sweetAlert("�� �ð� �Է���\n�߸��Ǿ����ϴ�.","Something went wrong", "error");
	 	     return false; 
			}
		}
		
		if($("#starttime").val() == $("#endtime").val()){
			$("#endtime").focus();
			sweetAlert("�ð��� ��ġ�ϸ� �ȵ˴ϴ�.","Something went wrong", "error");
			return false;
		}
		
		if(positionT ==""){
			sweetAlert("������ ��ġ�� �������� Ŭ�����ּ���.","Something went wrong", "error");
			return false;
		}
		
		if(address == ""){
			sweetAlert("������ ��ġ�� �������� Ŭ�����ּ���.","Something went wrong", "error");
			return false;
		}
		
		if($("#file1")[0].files[0] == undefined){
			sweetAlert("������ �̹����� ÷�����ּ���.","Something went wrong", "error");
			return false;
		}
		
		if($("#file2")[0].files[0] == undefined){
			sweetAlert("������ �̹����� ÷�����ּ���.","Something went wrong", "error");
			return false;
		}
		
		if($("#file3")[0].files[0] == undefined){
			sweetAlert("������ �̹����� ÷�����ּ���.","Something went wrong", "error");
			return false;
		}
		
		var data = new FormData();
		
		 data.append("name",name);
		 data.append("fee",fee);
		 data.append("starttime",starttime);
		 data.append("note",note);
		 data.append("latitude",latitude);
		 data.append("longitude",longitude);
		 data.append("address",address);
		 data.append("file1",$("input[name=image]")[0].files[0]);
		 data.append("file2",$("input[name=image2]")[0].files[0]);
		 data.append("file3",$("input[name=image3]")[0].files[0]);
		
		$.ajax( {
			url : "insert",
			type: "POST",
			data: data,	//����
			data : data,
			dataType:"text",
	 	 	enctype: "multipart/form-data", 
			processData: false,
		    contentType: false,
			success: function(result){	//�޾ƿ�
				alert('����?');
				if(result == "false"){
					console.log(result);
					location.href='/upa/map/parksuccess';
					return false;
				}
				
				 if(result == "true"){
					 alert("����");
				} 
			},
			error: function( jqXHR, status, error ){
				console.error( status + " : " + error );
			}
		});
		
	});
});
</script>
<!-- �ð��Է� -->
<script>
$(document).ready(function(){
	$('#starttime').bootstrapMaterialDatePicker
	({
		date: false,
		shortTime: true,
		format: 'HH:mm'
	});
	
	$('#endtime').bootstrapMaterialDatePicker
	({
		date: false,
		shortTime: true,
		format: 'HH:mm'
	});
});
</script>
</html>