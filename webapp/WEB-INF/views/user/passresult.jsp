<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UPA SUCCESS</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/upa/theme/css/main.css">
<link rel="stylesheet" href="/upa/theme/css/responsive.css">
<link href="/upa/assets/css/user.css" rel="stylesheet" type="text/css">
<link href="/upa/assets/css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/upa/assets/css/sweetalert.css">
<script type="text/javascript" src="/upa/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="/upa/theme/js/bootstrap.min.js"></script>
<script src="/upa/assets/js/sweetalert.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/include/subheader.jsp" />
	<div id="back1">
	<div class="container">
		<div id="title1">
			<h3>UPA 회원 인증 성공</h3>
		</div>
		<div id ="title1_p">
			<p><em id="emphasis">회원임을 인증되었습니다.</em></p>
			<p>새로운 삶의 가치를 창조하는 UPA는 더 나은 서비스로 고객님께 다가서겠습니다.</p>
		</div>
	</div>
	</div>
		<div class="container">
		<div id="contents">
			<div id="join-succ">
				<div id="goLogin">
					<ul>
						<li id="line">회원님의 비밀번호는 이메일로 전송되었습니다.</li>
						<li id="line">임시 비밀번호로 전송되었으므로 차후 변경하시기 바랍니다.</li>
					</ul>
				</div>	
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
<script src="/upa/theme/js/bootstrap.min.js"></script>
</html>