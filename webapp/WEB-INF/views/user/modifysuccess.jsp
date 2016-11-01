<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>UPA MODIFY SUCCESS</title>
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
				<h1>UPA 회원정보 수정  완료</h1>
			</div>
			<div id ="title1_p">
				<p>회원님, 수정되었습니다.</p>
				<p>정보 수정을 원하신다면 언제든지 바꾸실 수 있으십니다.</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div id="contents">
			<div id="join-succ">
				<div id="goLogin">
				<ul style="padding-left:30px;">
					<li id="line"><strong style="color:#a94242;">수정되었습니다.</strong></li>
					<li id="line">회원님 회원정보 수정이 성공적으로 완료되었습니다.</li>
				</ul>
				</div>	
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>

<script src="/upa/theme/js/bootstrap.min.js"></script>
<!-- <script src="/upa/theme/js/owl.carousel.min.js"></script>
<script src="/upa/theme/js/plugins.js"></script>
<script src="/upa/theme/js/main.js"></script> -->
</html>