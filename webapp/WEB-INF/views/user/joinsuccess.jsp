<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>UPA MODIFY</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/upa/theme/css/main.css">

<link rel="stylesheet" href="/upa/theme/css/responsive.css">
<link href="/upa/assets/css/user.css" rel="stylesheet" type="text/css">
<link href="/upa/assets/css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/upa/assets/css/sweetalert.css">
<script type="text/javascript" src="/upa/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="/upa/theme/js/bootstrap.min.js"></script>
<script src="/upa/assets/js/sweetalert.min.js"></script>
<!-- <script src="/upa/theme/js/vendor/modernizr-2.6.2.min.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/subheader.jsp" />
	<div id="back1">
		<div class="container">
			<div id="title1">
				<h3>UPA 회원가입 완료</h3>
			</div>
			<div id ="title1_p">
				<p>회원님, 회원가입을 축하드립니다.</p>
				<p>저희의 회원이 되어주셔서 감사합니다. 더 나은 UPA가 되도록 노력하겠습니다.</p>
			</div>
		</div>
	</div>	
	<div class="container">
		<div id="contents">
			<div id="join-succ">
				<div id="goLogin">
				<ul style="padding-left:30px;">
					<li id="line"><strong style="color:#a94242;">환영합니다.</strong></li>
					<li id="line">회원님 회원가입이 성공적으로 완료되었습니다.</li>
				</ul>
				</div>	
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
<script>
$(function() {
	
		$('#pass').keydown(function() {
			$('font[name=passCheck]').html('');
			$('#repassword').val('');
		});
		
		$('#repassword').keyup(function() {
			if ($('#pass').val() != $('#repassword').val()) {
				$('font[name=passCheck]').text('');
				$('font[name=passCheck]').html("암호틀림");
			} else {
				$('font[name=passCheck]').text('');
				$('font[name=passCheck]').html("암호맞음");
			}
		});
		
		$("#modify-form").submit(function(){
			console.log("form check");
			
			//휴대폰
			var regPhone = /^((01[0|1|6|7|8|9])[1-9]+[0-9]{7,8})|(010[1-9][0-9]{8})$/;
			if($("#phonenum").val() == ""){
				$("#phonenum").focus();
				sweetAlert("휴대폰 번호는\n 필수 입력 항목입니다.","Something went wrong", "error");
				return false;
			} else { 	//휴대폰 유효성 검사
				if(!regPhone.test($("#phonenum").val())) {  
				    $("#phonenum").focus();
					sweetAlert("휴대폰 번호의 입력된 내용이 \n잘못된 형식입니다.","Something went wrong", "error");
				    return false;  
				}
			}
			
			//차 번호
			var regCar = /^\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}$/;
			if($("#carnum").val() == ""){
				$("#carnum").focus();
				sweetAlert("차 번호는 필수 입력 항목입니다.","Something went wrong", "error");
				return false;
			} else { 	//차량번호 유효성 검사
				if(!regCar.test($("#carnum").val())) {  
				    $("#carnum").focus();
					sweetAlert("차량 번호의 입력된 내용이 \n잘못된 형식입니다.","Something went wrong", "error");
				    return false;  
				}
			}
			
			//이메일
			var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			if($("#email").val() == ""){
				$("#email").focus(); 
				sweetAlert("이메일 \n입력하시지 않으셨습니다.","Something went wrong", "error");
				return false;
			} else {  //이메일 유효성 검사
			   	if(!regEmail.test($("#email").val())) { 
				    $("#email").focus(); 
			   		sweetAlert("이메일 주소가\n 유효하지 않습니다.","Something went wrong", "error");
				    return false; 
				}
			}
			
			//패스워드 일치 여부
			if($("#pass").val() != $("#repassword").val()){
				$("#pass").focus();
				sweetAlert("비밀번호가 일치하지 않습니다.","Something went wrong", "error");
				return false;
			}

			return true;
		});
});
</script>
<script src="/upa/theme/js/bootstrap.min.js"></script>
<!-- <script src="/upa/theme/js/owl.carousel.min.js"></script>
<script src="/upa/theme/js/plugins.js"></script>
<script src="/upa/theme/js/main.js"></script> -->
</html>