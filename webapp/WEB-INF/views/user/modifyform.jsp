<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>UPA MODIFY</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<link href="/upa/assets/css/user.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/upa/theme/css/main.css">
<!-- <link rel="stylesheet" href="/upa/theme/css/responsive.css"> -->

<script type="text/javascript" src="/upa/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="/upa/assets/js/sweetalert.min.js"></script> 
<!-- <script src="/upa/theme/js/vendor/modernizr-2.6.2.min.js"></script> -->

</head>
<body>
	<jsp:include page="/WEB-INF/views/include/subheader.jsp" />
	<div id="back1">
		<div class="container">
			<div id="title1">
				<h3>UPA 회원정보 수정</h3>
			</div>
			<div id ="title1_p">
				<p>회원님,</p>
				<p>정보 수정을 원하신다면 언제든지 바꾸실 수 있으십니다.</p>
			</div>
		</div>
	</div>
	<div class="contentwrap">
	  <article class="container">
	    <div class="page-header">
		  <h3>기본정보 <small>개인정보 수정</small></h3>
	    </div>
	    <form class="form-horizontal" id="modify-form" name="modifyForm" method="post" action="/upa/user/modify" style="margin-bottom: 100px;">
	    <div class="container" style="padding: 29px 0px 5px;">
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">휴대폰번호</label>
			    <div class="col-sm-4">
			    	<input type="text" class="form-control" id="phonenum" name="phonenum" value="${userVo.phonenum }" placeholder="- 없이 적어주세요.">
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">차 번호</label>
			    <div class="col-sm-4">
			    	<input type="text" class="form-control" id="carnum" name="carnum" value="${userVo.carnum }" placeholder="ex.12가1234">
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">이메일</label>
			    <div class="col-sm-5">
			    	<input type="text" class="form-control" id="email" name="email" value="${userVo.email }"placeholder="이메일주소">
			    </div>
		    </div>
	    </div>
	    <div class="page-header">
	 		 <h3>계정 정보 <small>비밀번호 변경을 원하지 않으시다면 그냥 두시면 됩니다.</small></h3>
    	</div>
    	<div class="container" style="padding: 29px 0px 5px;">
	    <div class="form-group">
	    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
	    	<div class="col-sm-5">
	    		<input type="password" class="form-control" id="pass" name="password" value="">
	    		<p class="help-block">영어, 숫자 포함 8자 이상</p>
	    	</div>
	    </div>
      	<div class="form-group">
		    <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
		    <div class="col-sm-5">
		    	<input type="password" class="form-control" id="repassword" name="repassword" value="">
		      <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
		    </div>
		      <font name="passCheck" id="passCheck"></font>
	    </div>
	    </div>
	    <div class="form-group">
	      <input class="btn btn-primary btn-register" type="submit" value="수정하기" id="modi" style="float: right; margin: 23px 31px 0px 0px;">
	    </div>
	    </form>
	  </article>
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
</html>