<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>UPA MAIN</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href='http://fonts.googleapis.com/css?family=Raleway:400,100,300,700,600,500'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700'
	rel='stylesheet' type='text/css'>
<!-- <link rel="stylesheet" href="/upa/theme/css/slicknav.css">-->
<!-- <link rel="stylesheet" href="/upa/theme/css/owl.theme.css">-->
<!--<link rel="stylesheet" href="/upa/theme/css/owl.carousel.css">-->
<!--<link rel="stylesheet" href="/upa/theme/css/owl.transitions.css">-->
<!--<link rel="stylesheet" href="/upa/theme/css/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" href="/upa/resources/webjars/bootstrap-3.3.2-dist/css/bootstrap.min.css"> -->

<!-- <link rel="stylesheet" href="/upa/theme/css/main.css"> -->
<link rel="stylesheet" href="/upa/theme/css/responsive.css">
<link rel="stylesheet" href="/upa/assets/css/ihover.css">
<!-- <script src="/upa/theme/js/vendor/modernizr-2.6.2.min.js"></script> -->

<!-- 지도 -->

</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<!-- Slider Start -->
	<section id="slider">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block">
					<div class="slider-text-area">
						<div class="slider-text">
							<h2>
								Help your Parking Lot<br>
							</h2>
							<p class="sub-slider-text">Duis bibendum diam</p>
							<p class="slider-p">
								그 동안 주차 공간을 찾기 위해 많이 헤메시느라 고생하셨죠..<br>
								시간 낭비, 연료 낭비, 올라가는 짜증 게이지.. 이젠 걱정마세요!<br> 
								netus et malesuada fames ac turpis egestas.
							</p>
							<button type="button" class="btn btn-default edit-button-1">DOWNLOAD</button>
							<a href="user/text" style="cursor:default;">
					    	<button id="regipark" type="button" class="btn btn-default edit-button-3">
							주차장 등록
							</button></a>
						</div>
					</div>
				</div>
			</div>
			<!-- .col-md-12 close -->
		</div>
		<!-- .row close -->
	</div>
	<!-- .container close --> </section>
	<!-- #slider close -->
	

	<!-- Service Start -->
	<section id="service">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block-top">
					<div class="service-header">
						<h1>Utilize Parking Area Function</h1>
						<p style="margin-bottom:15px;">
							Utilize Parking Area : 당신의 주차장을 유용하게 공유해드립니다.
						</p>
					</div>
				</div>
			</div>
			<!-- .col-md-12 close -->
		</div>
		<!-- row close -->
		<div class="row">
			<div class="col-md-12">
				<div class="block-bottom">
					<div class="service-tab">
						<!-- Nav tabs -->
						<ul class="badhon-tab" role="tablist" style="margin-top: 22px;">
							<li class="active">
							<a href="#home" aria-controls="home" role="tab" data-toggle="tab">
							<img id= "nav_icon" src="/upa/assets/images/main/search.png" style="margin-right: 35px;">
									Find a Parking Lot
							</a></li>
							<li><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">
							<img id= "nav_icon" src="/upa/assets/images/main/calendar.png" style="margin-right: 35px;">
									Reserve a parking space
							</a></li>
							<li><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"> 
							<img id= "nav_icon" src="/upa/assets/images/main/cone.png" style="margin-right: 35px;">
									Prevent an illegally parked car
							</a></li>
							<li><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">
							<img id= "nav_icon" src="/upa/assets/images/main/coin.png" style="margin-right: 35px;">
									Earn extra money
							</a></li>
							<li><a href="#umbrella" aria-controls="settings" role="tab"	data-toggle="tab">
							<img id= "nav_icon" src="/upa/assets/images/main/parked-car.png" style="margin-right: 35px;">
									Make better use of a space
							</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content edit-tab-content">
							<div class="tab-pane active edit-tab" id="home">
								<div class="teb-icon-edit">
									<img src="/upa/assets/images/main/find_park.png">
								</div>
								<h1>운전자 근처 주차장을 찾습니다.</h1>
								<p>
									주차 공간이 필요한 운전자에게 근처 등록 되어있는 주차장 정보 제공합니다.<br>
									※ 주차장 정보는 개인 소유 주차장인지 검증 후 등록되므로 문제 없습니다.
								</p>
							</div>
							<div class="tab-pane edit-tab" id="profile">
								<div class="teb-icon-edit">
									<img src="/upa/assets/images/main/reserve.png">
								</div>
								<h1>주차장을 미리 예약합니다.</h1>
								<p>
									검색을 통해 주차장을 검색하고 원하는 시간 떄에 미리 예약합니다.<br>
									검색은 'GPS검색 / 지역명 키워드 검색'을 통해 이루어질 수 있습니다.
								</p>
							</div>
							<div class="tab-pane edit-tab" id="messages">
								<div class="teb-icon-edit">
									<img src="/upa/assets/images/main/prevent_car.png">
								</div>
								<h1>불법 차량을 방지합니다.</h1>
								<p>
									주차관리기기를 제작하여 주차관리를 원격화하여 편리성 제공합니다.<br>
									위 기기는 주차장을 사용할 수 있는 권리가 있을 경우 제어 가능합니다.
								</p>
							</div>
							<div class="tab-pane edit-tab" id="settings">
								<div class="teb-icon-edit">
									<img src="/upa/assets/images/main/pay_car.png">
								</div>
								<h1>저렴한 주차장 요금과 수익</h1>
								<p>
									주차장은 주차장 이용 요금을 지불하여 이루어지며<br>
									주차장 주인은 주차장 정보를 등록함으로써 작은 수익을 볼 수 있습니다.
								</p>
							</div>
							<div class="tab-pane edit-tab" id="umbrella">
								<div class="teb-icon-edit">
									<img src="/upa/assets/images/main/place_pin.png">
								</div>
								<h1>유명무실한 주차장의 공간 활용도 개선</h1>
								<p>
									외출이 잦은 낮 시간때 주차공간이 휑해 보이지 않으세요?<br>
									주차 공간 주인이 사용하지 않는 시간에 대여해줘 공간 활용도를 개선시킵니다. 
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>	<!-- .col-md-12 close -->
		</div>	<!-- row close -->
	</div>	<!-- .container close -->
	</section>	<!-- #service close -->

	<!-- contant-1 start -->
	<section id="contant-1">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="block-left">
					<div class="contant-1-text-area">
						<div class="contant-1-head">
							<h1>
								Utilize Parking Area <br> How to Use?
							</h1>
						</div>
						<div class="contant-1-text">
							<h2>
								저희 시스템을 사용하는 <br> 운전자 시점 프로토타입 입니다.
							</h2>
							<p>
								운전자가 사용할 경우 크게 2가지 경우로 나뉘어집니다.<br>
								영상과 같이 주차장을 '주차할 경우 / 퇴실할 경우' 입니다.<br>
								짤막한 영상이므로 편히 봐주시길 바랍니다.^^
							</p>
							<!-- <button type="button" class="btn btn-default edit-button-2">LEARN
								MORE</button> -->
						</div>
					</div>
				</div>
			</div>
			<!-- .col-md-6 close -->
			<div class="col-md-6">
				<div class="block-right">
					<div class="block-right-img">
						<div class="fb_box">
							<div id="happy">
							<p align="middle">
							<iframe width="600" height="400" src="https://www.youtube.com/embed/uuWr2J6bfPA" frameborder="0" allowfullscreen style="margin-top:65px;"></iframe>
							</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .col-md-6 close -->
		</div>
		<!-- .row close -->
	</div>
	<!-- .container close --> </section>
	<!-- #contant-1 close -->

	<!-- Map Start -->
	<section id="gallery" style="height:1005px;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block-top">
					<div class="gallery-area">
						<h1>Search Parking Lot</h1>
						<p>
							주차장 정보를 검색해보세요. 당신의 근처에 있는 주차장을 책임지고 제공하겠습니다.
						</p>
					</div>
				</div>
			</div>
			<!-- .col-md-12 -->
		</div>
		</div>
		<div id="maps"></div>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8b1213d39c6d1ac9748ce62f7bf32852"></script>
		<script>
			var container = document.getElementById('maps');
			var options = {
				/* center: new daum.maps.LatLng(37.381896, 126.929920), */
				center: new daum.maps.LatLng(37.533025, 126.951791),
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

			// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
			daum.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
				alert('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
			});	
			
			/* // 지도에 마커를 생성하고 표시한다
			var marker = new daum.maps.Marker({
			    position: new daum.maps.LatLng(37.381896, 126.929920), // 마커의 좌표
			    draggable : true, // 마커를 드래그 가능하도록 설정한다
			    map: map // 마커를 표시할 지도 객체
			}); */
			
			/* // 마커 위에 표시할 인포윈도우를 생성한다
			var infowindow = new daum.maps.InfoWindow({
			    content : '<div style="padding:5px;">인포윈도우 :D</div>' // 인포윈도우에 표시할 내용
			});

			// 인포윈도우를 지도에 표시한다
			infowindow.open(map, marker); */
			
			// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
			var positions = [
			    {
			        content: '<div>집앞 주차장1</div>', 
			        latlng: new daum.maps.LatLng(37.533025, 126.951791)
			    },
			    {
			        content: '<div>집앞 주차장2</div>', 
			        latlng: new daum.maps.LatLng(37.533403, 126.952365)
			    },
			    {
			        content: '<div>집앞 주차장3</div>', 
			        latlng: new daum.maps.LatLng(37.532466, 126.951835)
			    },
			    {
			        content: '<div>집앞 주차장4</div>',
			        latlng: new daum.maps.LatLng(37.532626, 126.950145)
			    }
			];

			for (var i = 0; i < positions.length; i ++) {
			    // 마커를 생성합니다
			    var marker = new daum.maps.Marker({
			        position: positions[i].latlng, // 마커의 위치
			        map: map // 마커를 표시할 지도
			    });

			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new daum.maps.InfoWindow({
			        content: positions[i].content // 인포윈도우에 표시할 내용
			    });

			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			}

			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
			
			// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
			daum.maps.event.addListener(marker, 'click', function() {
				console.log('click');
			    $('div#rpModal').modal();	//주차장 정보 창 띄우기
			});

		</script>
		<div class="container">
		<!-- .row close -->
		<div class="row">
			<div class="col-md-12">
				<div class="block-bottom">
					<div class="gallery-list" id="owl-demo">
						<div class="gallery-items item">
							<div class="gallery-img">
								
							</div>
							<div class="gallery-items-text">
								<p>
									Duis bibendum diam non erat facilaisis <br> tincidunt.
									Fusce leo neque, lacinia at <br> tempor vitae, porta at
									arcu.
								</p>
							</div>
						</div>
						
						<!-- <div class="gallery-items item">
							<div class="gallery-img">
								<img src="img/mobile-phon-2.png" alt="img">
							</div>
							<div class="gallery-items-text">
								<p>
									Duis bibendum diam non erat facilaisis <br> tincidunt.
									Fusce leo neque, lacinia at <br> tempor vitae, porta at
									arcu.
								</p>
							</div>
						</div> -->
					</div>
				</div>
			</div>
			<!-- .col-md-12 close -->
		</div>
		<!-- .row close -->
	</div>
	<!-- .container close --> </section>
	<!-- #gallery close -->


	<!-- Contant-2 Start
        =============================================================== -->

	<section id="contant-2">
	<div class="container">
		<div class="row">
			<div class="col-md-6" style="margin-top: 19px;">
				<div class="block-left">
					<div class="contant-2-img">
						<div class="row">
						    <!-- normal -->
						    <div class="ih-item square effect6 bottom_to_top">
						    	<c:choose>
								<c:when test='${empty sessionScope.authUser }'>
							    	<a href="" data-toggle="modal" data-target="#myModal" style="cursor:default;">
								</c:when>
								<c:otherwise>
									<a href="/upa/map/requestparkform" style="cursor:default;">
								</c:otherwise>
								</c:choose>
						        <div class="img"><img src="assets/images/parking/parkingex.jpg" alt="img"></div>
						        <div class="info" style="Padding-top:40px;">
						          <h3 style="color:#fff;font-size: 40px;">Register Parking Lot</h3>
						          <p style="font-size:20px;margin-top:25px;">주차장을 공유해주세요. 당신을 기다리고 있습니다.</p>
						        </div></a></div>
						    <!-- end normal -->
						 
						  </div>
					</div>
				</div>
			</div>
			<!-- .col-md-6 close -->

			<div class="col-md-5" style="float: right;">
				<div class="block-right">
					<div class="contant-2-text-area">
						<div class="contant-2-header">
							<h1>
								주차장을 공유해주세요.
							</h1>
						</div>
						<div class="contant-2-text">
							<h3 style="color: #8C9494;">
								유명무실한 주차장 <br> 더 이상 그러지 말아요.
								</h3>
								<p>
								운전자로써 주차장을 찾아 헤맨적 있으세요?<br>
								당신이 사용하지 않는 시간에 주차장을 공유해주세요.<br>
								당신에게도 주차장을 제공받을 수 있는 기회가 옵니다.
								</p>
								<c:choose>
								<c:when test='${empty sessionScope.authUser }'>
							    	<a href="" data-toggle="modal" data-target="#myModal" style="cursor:default;">
							    	<button id="regipark" type="button" class="btn btn-default edit-button-3">
									주차장 등록
									</button></a>
								</c:when>
								<c:otherwise>
								<a href="/upa/map/requestparkform"><button id="regipark" type="button" class="btn btn-default edit-button-3">
								주차장 등록
								</button></a>
								</c:otherwise>
								</c:choose>
						</div>
					</div>
				</div>
			</div>	<!-- .col-md-6 close -->
		</div>	<!-- .row close -->
	</div>	<!-- .container close -->
	</section>	<!-- #contant-2 close -->

	<!-- testimonial Start -->

	<!-- <section id="testimonial">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block">
					<div class="testimonial-area">
						<div class="tm-header">
							<h2>What people say about us</h2>
						</div>
						<div class="tm-contant">
							<div class="tm-contant-items" id="slide-testimonial">
								<div class="tm-contant-list item">
									<div class="tm-img">
										<img src="img/pepole-img.png" alt="img">
									</div>
									<div class="tm-text">
										<p>
											" It’s official – I love this app, I couldn’t be without it
											now." <span>- Ron Burgundy</span>
										</p>
									</div>
								</div>
								<div class="tm-contant-list item">
									<div class="tm-img">
										<img src="img/pepole-img.png" alt="img">
									</div>
									<div class="tm-text">
										<p>
											" It’s official – I love this app, I couldn’t be without it
											now." <span>- Ron Burgundy</span>
										</p>
									</div>
								</div>
								<div class="tm-contant-list item">
									<div class="tm-img">
										<img src="img/pepole-img.png" alt="img">
									</div>
									<div class="tm-text">
										<p>
											" It’s official – I love this app, I couldn’t be without it
											now." <span>- Ron Burgundy</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			.col-md-12 close
		</div>
		.row close
	</div>
	.container close </section> -->
	<!-- #testimonial close -->


	<!-- Submit Start -->
	<section id="submit-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block">
					<div class="submit-contant">
						<div class="submit-header">
							<i class="fa fa-envelope-o"></i>
							<h3>Subscribe our Newsletter</h3>
						</div>
						<div class="submit-area">
							<div class="submit-bottom">
								<form action="">
									<input type="text" placeholder="your email address"> 
									<input type="submit" value="submit">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .col-md-12 -->
		</div>
		<!-- .row close -->
	</div>
	<!-- .container close --> </section>
	<!-- #submit close -->


	<!-- footer Start -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- #footer -->

	<script src="/upa/theme/js/bootstrap.min.js"></script>
	<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- 	<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script> -->
	<!-- <script src="/upa/theme/js/plugins.js"></script>
	<script src="/upa/theme/js/owl.carousel.min.js"></script>
	<script src="/upa/theme/js/main.js"></script> -->
	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<!-- 
	<script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X');ga('send','pageview');
        </script> -->
        
        <!-- 모달 팝업 -->
	<div class="modal fade" id="rpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog" style="width: 1500px; margin: 60px auto;">
	    <div class="modal-content">
	      <div class="modal-header" style="padding-left: 23px;">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="myModalLabel">[신청] UPA 주차장 정보</h3>
	      </div>
	      <div class="modal-body">
			 <section class="login-form">
				<form method="post" action="" role="login">
					<div>
						<h5>안녕하세요. 주차장을 공유해주셔서 감사합니다.</h5>
					</div>
					<div class="col-sm-6">
					
					<div class="col-sm-6">
						<input type="email" id="id" name="id" placeholder="ID" required class="form-control input-lg" style="margin-bottom:10px;"/>
						<input type="password" id="password" name="password" placeholder="Password" required class="form-control input-lg" style="margin-bottom:10px;"/>
						<button type="button" name="login" id="btn_Login" class="btn btn-lg btn-block btn-info">Login</button>
					</div>
				</form>
			  </section>
	      </div>
	      <div class="modal-footer" style="text-align: center;">
			<div>
				<a href="#" style="margin-left: 6px; float: left;">아이디/비밀번호 찾기</a>
				<a href="/upa/user/joinform" style="margin-right: 10px; float: right;">회원가입</a>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>