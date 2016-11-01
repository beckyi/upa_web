<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/upa/theme/css/main.css">

<link rel="stylesheet" href="/upa/theme/css/responsive.css">
<link href="/upa/assets/css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/upa/assets/css/sweetalert.css">
<script type="text/javascript" src="/upa/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="/upa/theme/js/bootstrap.min.js"></script>
<script src="/upa/assets/js/sweetalert.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/include/subheader.jsp" />
	<div class="container">
		<div id="title1">
			<h3>UPA 회원정보 찾기</h3>
		</div>
		<div id="title1_p">
			<p>회원가입 시 입력하셨던 고객님의 소중한 개인정보 인증을 통해 알려드리고 있습니다.</p>
			<p>
				<em id="emphasis">UPA</em> 회원이실 경우, 각 해당란에 모두 기입해주십시오.
			</p>
		</div>
		<div id="contents">
			<div class="both left">
				<div class="popwrap">
					<h4 class="pop_tlt1" style="padding-top: 21px;">아이디 찾기</h4>
				</div>
				<form id="id-form" name="idForm" method="post"
					action="/upa/user/idFind">
					<table class="tbl_wtype1 smaller">
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td><input id="name" name="name" type="text" value=""></td>
							</tr>
							<tr>
								<th scope="row">휴대폰</th>
								<td><input id="phone" name="phonenum" type="text" value=""	placeholder="'-'제외하고 숫자만 입력"></td>
							</tr>
						</tbody>
					</table>
					<input class="btn btn-find" id="findid" type="submit" value="아이디찾기">
				</form>
			</div>
			<div class="both right">
				<div class="popwrap">
					<h4 class="pop_tlt1" style="padding-top: 21px;">비밀번호 찾기</h4>
				</div>
				<form id="password-form" name="passForm" method="post">
					<table class="tbl_wtype1 smaller">
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td><input id="id1" name="id" type="text" value=""></td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td><input id="name1" name="name" type="text" value="">
								</td>
							</tr>
							<tr>
								<th scope="row">휴대폰</th>
								<td><input id="phone1" name="phonenum" type="text" value="" placeholder="'-'제외하고 숫자만 입력"></td>
							</tr>
						</tbody>
					</table>
					<input class="btn btn-find" type="button" id="btn_pass"
						value="비밀번호찾기">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
<script>
	$(function() {
		//입력 사항   일치 여부)
		var tmp = '${result }';

		if (tmp != '') { //받은 값이 없으므로 공백으로 받아짐

			sweetAlert("입력하신 내용과 일치하는 계정이 없습니다. 다시 입력하여 시도하시거나 회원가입해주세요.",
					"Something went wrong!", "error");
		}
		
		//입력하지 않았을 경우(아이디 찾기 폼)
		$("#findid").on("click",function() {
			//이름 체크
			if ($("#name").val() == "") {
				sweetAlert("이름은 필수 입력 항목입니다.", "Something went wrong!", "error");
				$("#name").focus();
				return false;
			}
			//휴대폰
			var regPhone = /^((01[0|1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
			if ($("#phone").val() == "") {
				sweetAlert("휴대폰 번호는 필수 입력 항목입니다.",
						"Something went wrong!", "error");
				$("#phone").focus();
				return false;
			} else { //휴대폰 유효성 검사
				if (!regPhone.test($("#phone").val())) {
					sweetAlert("휴대폰 번호 입력된 내용이 잘못된 형식입니다.","Something went wrong!", "error");
					$("#phone").focus();
					return false;
				}
			}

			return true;

		});

		//입력하지 않았을 경우(비밀번호 찾기 폼)
		/* $("#password-form").submit(function(){ */
		$("#btn_pass").on("click",function() {
			//이메일 체크
			if ($("#id1").val() == "") {
				sweetAlert("아이디를 입력하시지 않으셨습니다.","Something went wrong!", "error");
				$("#id1").focus();
				return false;
			} else { //휴대폰 유효성 검사
				if (!regEmail.test($("#id1").val())) {
					sweetAlert("입력된 아이디 형식이 유효하지 않습니다.","Something went wrong!", "error");
					$("#id1").focus();
					return false;
				}
			}
			//이름 체크
			if ($("#name1").val() == "") {
				sweetAlert("이름은 필수 입력 항목입니다.",
						"Something went wrong!", "error");
				$("#name1").focus();
				return false;
			}
			//휴대폰
			var regPhone = /^((01[0|1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
			if ($("#phone1").val() == "") {
				sweetAlert("휴대폰 번호는 필수 입력 항목입니다.", "Something went wrong!", "error");
				$("#phone1").focus();
				return false;
			} else { //휴대폰 유효성 검사
				if (!regPhone.test($("#phone1").val())) {
					sweetAlert("휴대폰 번호 입력된 내용이 잘못된 형식입니다.", "Something went wrong!", "error");
					$("#phone1").focus();
					return false;
				}
			}
			var id = $("#id1").val();
			var name = $("#name1").val();
			var phonenum = $("#phone1").val();
	
			//Script 객체
			var userVo = {
				"id" : id,
				"name" : name,
				"phonenum" : phonenum
			};
	
			$.ajax({
				url : "checkPass",
				type : "POST",
				data : JSON.stringify(userVo),
				dataType : "json",
				contentType : "application/json",
				success : function(result) {
					console.log(result);
					if (result == false) {
						console.log(result);
						sweetAlert("입력된 아이디 형식이 유효하지 않습니다.", "Something went wrong!", "error");
						return false;
					}
	
					if (result == true) {
						location.href = 'passresult';
					}
				},
	
				error : function(jsXHR, status, e) {
					console.error("error:" + status + ":" + e);
				}
			});
	
			return true;
		});
	});
</script>
</html>