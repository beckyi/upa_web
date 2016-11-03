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

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<!-- <script src="/upa/theme/js/bootstrap.min.js"></script> -->
<!-- <script type="text/javascript" src="/upa/assets/js/material.min.js"></script> -->
<head>
	<meta charset="utf-8"/>
	<title>Daum 지도 시작하기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/subheader.jsp" />
	<h2>지도</h2>
	<div id="map" style="width:500px;height:400px;"></div>
	<!-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8b1213d39c6d1ac9748ce62f7bf32852&libraries=services"></script> -->
	<script>
		/* var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
	    MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
	    OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
	    OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
	    OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
	    OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
	    OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
	    OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
	    SPRITE_MARKER_URL = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
	    SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
	    SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
	    SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격
	
		var markerSize = new daum.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
	    markerOffset = new daum.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
	    overMarkerSize = new daum.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
	    overMarkerOffset = new daum.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
	    spriteImageSize = new daum.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기	 */
		
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
		        if (status === daum.maps.services.Status.OK) {
		            var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
		            
		            var content = '<div class="bAddr">' +
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
		/* var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
	        overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
	        clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin); */
	</script>
	
	<div style="height:300px;"></div>

		 <div class="form-group">
		    <label for="inputNumber" class="col-sm-2 control-label">시작시간</label>
		    <div class="col-sm-3">
		    	<div class="form-control-wrapper">
					<input type="text" id="time" class="form-control empty" data-dtp="dtp-gs7M1" placeholder="ex.12:00">
				</div>
		    </div>
	    </div>
	    
    <div style="height:300px;"></div>
		<h2>파일 서버 업로드</h2>
		<div>
		<h3>첨부파일</h3>
		<form class="board-form" method="post" action="/upa/user/attach" enctype="multipart/form-data">
		 <input multiple="multiple" type="file" name="filename[]" />
		<input type="submit" value="등록">
	</form>
	</div>
	    
	    <div style="height:300px;"></div>
	<form class="img-form" method="post" action="/upa/user/register" enctype="multipart/form-data">
	
	
	<div  style="background=#fff; width:300px; height:300px; border:1px solid #c0c0c0; border-radius: 250px; display:none;"></div>
	<div id="cma_image" style="width:300px; height:300px; border:1px solid #c0c0c0; border-radius: 250px; display:none;"></div>
	<input type="file" name="file" multiple="multiple" id="file accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))">
	<input type="submit" value="이미지등록">
	</form>
		<div style="height:300px;"></div>
	
	<script language="javascript">
	 var count = 1;
	 var addCount;
	 
	//행추가
	function addInputBox() {
	 for(var i=1; i<=count; i++) {
	  if(!document.getElementsByName("test"+i)[0]) {
	   addCount = i;
	   break;
	  }
	  else addCount = count;
	 }
	
	 var addStr = "<tr><td width=40><input type=checkbox name=checkList value="+addCount+" size=40 ></td><td width=140><input type=file name=test"+addCount+" size=40></td></tr>";
	 var table = document.getElementById("dynamic_table");
	 var newRow = table.insertRow();
	 var newCell = newRow.insertCell();
	 newCell.innerHTML = addStr;
	 count++;
	}
	 
	//행삭제
	function subtractInputBox() {
	 var table = document.getElementById("dynamic_table");
	 //var max = document.gForm.checkList.length;
	 //alert(max);
	 var rows = dynamic_table.rows.length;
	 var chk = 0;
	 if(rows > 1){
	  for (var i=0; i<document.gForm.checkList.length; i++) {
	   if (document.gForm.checkList[i].checked == true) {
	    table.deleteRow(i);
	    i--;
	    count--;
	    chk++;
	   }
	  }
	  if(chk <= 0){
	   alert("삭제할 행을 체크해 주세요.");
	  }
	   }else{
	    alert("더이상 삭제할 수 없습니다.");
	   }
	}
	 
	function submitbutton() {
	 var gform = document.gForm;
	 gform.count.value = eval(count);
	 //alert(count);
	 gForm.submit();
	 return;
	}
</script>
	<input type="button" value="행 추가" onclick="javascript:addInputBox();"> : <input type="button" value="행 삭제" onclick="javascript:subtractInputBox();"><br><br>
	<input type="button" value="전송" onclick="javascript:submitbutton();">
	<form name="gForm" action="upload.do" enctype="multipart/form-data" method="post" >
	  <input type="hidden" name="count" >
	   
	<table cellpadding=0 cellspacing=0 id="" border="1">
	<tr>
	 <td width="40">체크</td>
	 <td width="160">내용</td>
	</tr>
	<tr>
	<table cellpadding="0" cellspacing="0" id="dynamic_table" border="1">
		<tr><td width=40><input type=checkbox name=checkList value="+addCount+" size=40 ></td><td width=140><input type=file name=test"+addCount+" size=40></td></tr>
		<tr><td width=40><input type=checkbox name=checkList value="+addCount+" size=40 ></td><td width=140><input type=file name=test"+addCount+" size=40></td></tr>
		<tr><td width=40><input type=checkbox name=checkList value="+addCount+" size=40 ></td><td width=140><input type=file name=test"+addCount+" size=40></td></tr>
	</table>
	</tr>
	</table>
	</form>
	
	<div style="height:300px;"></div>
	
	<!-- IMAGE SLIDER -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	
	<!--페이지-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!--페이지-->

	<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active"> 
			<img src="http://220.67.115.35/UPA/Images/201610310309481.png"  style="width:100%; height: 455px;" alt="First slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 1</h1>
					<p>텍스트 1</p>
				</div>
			</div>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<img src="http://220.67.115.35/UPA/Images/1452976542259s.jpg" style="width:100%; height: 455px;" data-src="" alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 2</h1>
					<p>텍스트 2</p>
				</div>
			</div>
		</div>
		<!--슬라이드2-->
		
		<!--슬라이드3-->
		<div class="item"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg" style="width:100%" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 3</h1>
					<p>텍스트 3</p>
				</div>
			</div>
		</div>
		<!--슬라이드3-->
	</div>
	
	<!--이전, 다음 버튼-->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
</div>
	
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
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
            $target.html('<img src="' + e.target.result + '" border="0" alt="" width="300px" height="300px" style="border-radius: 150px;" />');
        }
        reader.readAsDataURL(html.files[0]);
    }
}
</script>
</html>