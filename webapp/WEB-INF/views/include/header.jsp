<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/upa/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="/upa/theme/js/vendor/modernizr-2.6.2.min.js"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="/upa/resources/webjars/bootstrap-3.3.2-dist/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="/upa/theme/css/main.css">
<link rel="stylesheet" href="/upa/theme/css/responsive.css">
<link rel="stylesheet" href="/upa/assets/css/main.css">
<title>Insert title here</title>
</head>
<body>
	<!-- header Menu -->
	<section id="header">
	<div class="container upa">
		<div class="row">
			<div class="col-md-7">
				<div class="block-left">
					<nav class="navbar navbar-default" role="navigation">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<div class="nav-logo">
								<a href="/upa/main"><img src="/upa/assets/images/main/upa_logo.png" alt="logo"></a>
							</div>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav move">
								<li class="active"><a href="/upa/main">Home <span class="sr-only">(current)</span></a></li>
								<li><a href="#">Features</a></li>
								<li><a href="#">Parking Lot</a></li>
								<li><a href="#">Gallery</a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid --> </nav>
				</div>
			</div>
			<!-- .col-md-6 -->

			<div class="col-md-5">
				<div class="block-right">
					<div class="contact-area userArea">
						<ul>
							<li><a href="#" data-toggle="modal" data-target="#myModal"><img id= "loginc" src="/upa/assets/images/user/login.png"><li><i class="login"></i>Login</a></li>
							<li><a href="/upa/user/joinform"><img id= "signc" src="/upa/assets/images/user/signup.png"><i class="signup"></i>Sign up</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- .col-md-6 close -->
		</div>
		<!-- .row close -->
	</div>
	<!-- .container close --> </section>
	<!-- #heder close -->
	
	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">Login</h4>
	      </div>
	      <div class="modal-body">
			 <section class="login-form">
				<form method="post" action="" role="login">
					<div>
						<img src="/upa/assets/images/main/upa_logo.png" alt="" id="login_logo"/>
						<h5>어서오세요. 방문해주셔서 감사합니다.</h5>
					</div>			
					<input type="email" id="id" name="id" placeholder="ID" required class="form-control input-lg" style="margin-bottom:10px;"/>
					<input type="password" id="password" name="password" placeholder="Password" required class="form-control input-lg" style="margin-bottom:10px;"/>
					<button type="button" name="login" id="btn_Login" class="btn btn-lg btn-block btn-info">Login</button>
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
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
<!-- <script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>ie10-viewport-bug-workaround.js -->
<!-- <script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script> -->
<script>
$(function() {	
		 $("#btn_Login").on("click", function(){ 	
			console.log('click');
			if($("#id").val() == ""){
				alert("아이디를 입력해주십시오.");
				$("#id").focus();
				return false;
			} 
			
			if($("#password").val() == ""){
				alert("비밀번호를 입력해주십시오.");
				$("#password").focus();
				return false;
				}
			
			var id = $("#id").val();
			var password = $("#password").val();
		
			$.ajax({	
				url: "checkLogin",
				type: "POST",
				data: {"id":id, "password":password},
				dataType: "text",
				success: function(result){	//비동기식으로 진행되어 결과와 상관 없이 submit되므로 계속 refres됨(따로 동기식으로 변경해야함)
					console.log(result);
					if(result == "false"){
						console.log(result);
						alert("유효하지 않는 로그인입니다. 다시 시도해주세요.")
						return false;
					}
					
					 if(result == "true"){
						location.href='/upa/main';
					} 
				},
				
				error: function(jsXHR, status, e){
					console.error("error:"+status+":"+e);
				}
			});
		});
	});
</script>
</html>