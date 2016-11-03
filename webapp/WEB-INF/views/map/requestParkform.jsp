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
			<h2 style="margin: 0px auto 50px;">주자장 등록하기</h2>
		</div>
	</div> -->
	<div id="back1">
		<div class="container">
			<div id="title1">
				<h1>UPA 주차장 등록 신청</h1>
			</div>
			<div id ="title1_p">
				<p>안녕하세요, 우선 주차장을 공유해주셔서 감사의 말씀을 드립니다.</p>
				<p>주차장을 공유해주시면, <em id="emphasis">UPA</em>에서 회원님의 주차장 확인 절차를 거쳐 등록하게 됩니다.</p>
			</div>
		</div>
	</div>

	<div class="container">
		 <div class="page-header">
		  <h3>기본정보 <small>주차장 정보 기입</small></h3>
	    </div>
	    <form class="form-horizontal" id="request-form" name="requestForm" method="post" action="/upa/map/insert" style="margin-bottom: margin-bottom: 80px;">
	    <div class="container" style="padding: 29px 0px 5px;">
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">주차장 이름</label>
			    <div class="col-sm-4">
			    	<input type="text" class="form-control" id="name" name="name" value="" placeholder="장소와 관련지어 지어주세요.">
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">요금</label>
			    <div class="col-sm-3">
			    	<input type="text" class="form-control" id="fee" name="fee" value="" placeholder="숫자만 입력">
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">시작시간</label>
			    <div class="col-sm-3">
			    	<div class="form-control-wrapper">
						<input type="text" name="starttime" id="starttime" class="form-control empty" data-dtp="dtp-gs7M1" placeholder="ex.12:00">
					</div>
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">마감시간</label>
			    <div class="col-sm-3">
			    	<div class="form-control-wrapper">
						<input type="text" id="endtime" name="endtime" class="form-control empty" data-dtp="dtp-gs7M1" placeholder="ex.12:00">
					</div>
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">주의사항</label>
			    <div class="col-sm-8">
			    	<input type="text" class="form-control" id="note" name="note" value="" placeholder="사용할 운전자에게 남기고 싶은 말 있으시면 남겨주세요.">
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
		  <h3>주차장 위치 <small>주차장 위치를 표시</small></h3>
	    </div>
	    
	    <div style="width: 680px; margin: 25px 213px 30px;">
			<p id="txt3">해당 주소 찾기: &nbsp;</p>
			<div>
				<input type="text" id="address" value="" placeholder="지역명 또는 상세주소">
				<input type="button" id="addressSearch" value="주소 찾기">
			</div>
			<p id="searchbottom">※ 지역명 또는 상세 주소를 입력하셔야 합니다. ex) 성결대(x), 만안구 (o), 성결대학로 53 (o)</p>
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
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();

			var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
			infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);

			// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {
				var positionT = mouseEvent.latLng.toString();
				$('font[name=positionT]').html(positionT);
				/* alert('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.'); */
			    searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
			        if (status === daum.maps.services.Status.OK) {
			            var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
			            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
			            
			            $('font[name=addressT]').html(result[0].jibunAddress.name);
			            
			            var content = '<div class="bAddr" style="width: 283px;">' +
			                            '<span class="title">법정동 주소정보</span>' + 
			                            detailAddr + 
			                        '</div>';
						
			            // 마커를 클릭한 위치에 표시합니다 
			            marker.setPosition(mouseEvent.latLng);
			            marker.setMap(map);

			            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
			            infowindow.setContent(content);
			            infowindow.open(map, marker);
			        }   
			    });
			});

			// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
			daum.maps.event.addListener(map, 'idle', function() {
			    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			});

			function searchAddrFromCoords(coords, callback) {
			    // 좌표로 행정동 주소 정보를 요청합니다
			    geocoder.coord2addr(coords, callback);         
			}

			function searchDetailAddrFromCoords(coords, callback) {
			    // 좌표로 법정동 상세 주소 정보를 요청합니다
			    geocoder.coord2detailaddr(coords, callback);
			}

			// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			function displayCenterInfo(status, result) {
			    if (status === daum.maps.services.Status.OK) {
			        var infoDiv = document.getElementById('centerAddr');
			        infoDiv.innerHTML = result[0].fullName;
			    }    
			}
			
			/* // 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    // 클릭한 위치에 마커를 표시합니다 
			    alert('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
			    addMarker(mouseEvent.latLng);
			});
			
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
			} */

			/* // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
			function setMarkers(map) {
			    for (var i = 0; i < markers.length; i++) {
			        markers[i].setMap(map);
			    }            
			} */
		</script>
		  <!-- 이미지 삽입 -->
	     <div class="page-header" style="margin-top: 85px;">
		  	<h3>이미지 삽입 <small>주차장 이미지 3장이 필요합니다.</small></h3>
    	 </div>
	     <div class="container" style="padding: 29px 0px 5px;">
		 <!--  <div class="fileinput-button">
		     <input multiple="multiple" type="file" name="filename[]" />
		   </div> -->
		    
		    <table class="table table-hover" style="width:70%; margin:5px auto; text-align: center;">
		    	<THEAD>
					<TR>
					<TH style="text-align: center; width: 145px;">#</TH>
					<TH>삽입 (파일명)</TH>
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
				<tr><td width="80px" style="background:#428bca; color:white;">이미지 1</td><td style="padding-left: 10px;" width="140"><input type=file size=40 name="image" id="file1"></td></tr>
				<tr><td width="80px" style="background:#428bca; color:white;">이미지 2</td><td style="padding-left: 10px;"><input type=file size=40 name="image2" id="file2"></td></tr>
				<tr><td width="80px" style="background:#428bca; color:white;">이미지 3</td><td style="padding-left: 10px;"><input type=file size=40 name="image3" id="file3"></td></tr>
			</table> -->
		    
		    <div id="cma_image" style="width:100%; max-width:100%; text-align: center; display:none;"></div>
	    </div>
		<div style="width: 400px; margin: 90px auto;">
			<input class="btn btn-primary btn-register" type="button" value="등록하기" id="regis">
			<!-- <input class="btn btn-primary btn-register" type="button" value="취소" id="cancel" src="javascript:history.go(-1);" > -->
			<a href="javascript:history.go(-1);" id="cancel">취소</a>
		</div>
		</form>
		</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
<!-- 주소 검색버튼 -->
<script>
$(function() {
	
	$("#positionT").hide();
	$("#addressT").hide();
	
	$("#addressSearch").click(function(){
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
	
	$("#regis").on("click",function(){
		console.log('click');
		var name = $("#name").val();
		var fee = $("#fee").val();
		var starttime = $("#starttime").val();
		var endtime = $("#endtime").val();
		var note = $("#note").val();
		var positionT = $("#positionT").text();
		var address = $("#addressT").text();
		
		/*좌표 글자 자르기*/
		var positionTA = positionT.substring(1,positionT.length-1);
		afterStr = positionTA.split(', ');
		
		var latitude = afterStr[0];
		var longitude = afterStr[1];
		
		console.log(latitude);
		console.log(longitude);
		
		if(name == ""){
			$("#name").focus();
			sweetAlert("주차장 이름을 입력해주세요.","Something went wrong", "error");
			return false;
		}
		
		regmoney = /^[1-9][0-9]*$/;
		if(fee == ""){
			$("#fee").focus();
			sweetAlert("요금을 입력해주세요.","Something went wrong", "error");
			return false;
		} else{
			if(!regmoney.test($("#fee").val())) { 
			      $("#fee").focus(); 
			   		 sweetAlert("요금 입력이\n잘못되었습니다.","Something went wrong", "error");
		 	     return false; 
				}
		}
		
		var regtimeRegExp = /^([1-9]|[01][0-9]|2[0-3]):([0-5][0-9])$/;
		if(starttime == ""){
			$("#starttime").focus();
			sweetAlert("시작 시간을 입력해주세요.","Something went wrong", "error");
			return false;
		} else{
			if(!regtimeRegExp.test($("#starttime").val())) { 
		      $("#starttime").focus(); 
		   		 sweetAlert("시작시간 입력이\n잘못되었습니다.","Something went wrong", "error");
	 	     return false; 
			}
		}
		
		if(endtime == ""){
			$("#endtime").focus();
			sweetAlert("끝 시간을 입력해주세요.","Something went wrong", "error");
			return false;
		} else{
			if(!regtimeRegExp.test($("#endtime").val())) { 
		      $("#endtime").focus(); 
		   		 sweetAlert("끝 시간 입력이\n잘못되었습니다.","Something went wrong", "error");
	 	     return false; 
			}
		}
		
		if($("#starttime").val() == $("#endtime").val()){
			$("#endtime").focus();
			sweetAlert("시간이 일치하면 안됩니다.","Something went wrong", "error");
			return false;
		}
		
		if(positionT ==""){
			sweetAlert("주차장 위치를 지도에서 클릭해주세요.","Something went wrong", "error");
			return false;
		}
		
		if(address == ""){
			sweetAlert("주차장 위치를 지도에서 클릭해주세요.","Something went wrong", "error");
			return false;
		}
		
		if($("#file1")[0].files[0] == undefined){
			sweetAlert("주차장 이미지를 첨부해주세요.","Something went wrong", "error");
			return false;
		}
		
		if($("#file2")[0].files[0] == undefined){
			sweetAlert("주차장 이미지를 첨부해주세요.","Something went wrong", "error");
			return false;
		}
		
		if($("#file3")[0].files[0] == undefined){
			sweetAlert("주차장 이미지를 첨부해주세요.","Something went wrong", "error");
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
			data: data,	//보냄
			data : data,
			dataType:"text",
	 	 	enctype: "multipart/form-data", 
			processData: false,
		    contentType: false,
			success: function(result){	//받아옴
				alert('성공?');
				if(result == "false"){
					console.log(result);
					location.href='/upa/map/parksuccess';
					return false;
				}
				
				 if(result == "true"){
					 alert("성공");
				} 
			},
			error: function( jqXHR, status, error ){
				console.error( status + " : " + error );
			}
		});
		
	});
});
</script>
<!-- 시간입력 -->
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