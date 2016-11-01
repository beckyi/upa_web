<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>UPA JOIN</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/upa/theme/css/main.css">
<link rel="stylesheet" href="/upa/theme/css/responsive.css">
<link href="/upa/assets/css/user.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" type="text/css" href="/upa/assets/css/sweetalert.css"> -->
<script type="text/javascript" src="/upa/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="/upa/assets/js/sweetalert.min.js"></script> 
<!-- <script src="/upa/theme/js/vendor/modernizr-2.6.2.min.js"></script> -->

</head>
<body>
	<jsp:include page="/WEB-INF/views/include/subheader.jsp" />
	<div id="back1">
		<div class="container">
			<div id="title1">
				<h1>UPA 신규 회원가입</h1>
			</div>
			<div id ="title1_p">
				<p>안녕하세요, 고객님의 회원가입을 환영합니다.</p>
				<p>회원에 가입하시면, <em id="emphasis">UPA</em> 홈페이지를 하나의 아이디와 비밀번호로 이용하실 수 있습니다.</p>
			</div>
		</div>
	</div>
	<div class="contentwrap">
	  <article class="container">
	    <div class="page-header">
		  <h3>기본정보 <small>개인정보입력</small></h3>
	    </div>
	    <form class="form-horizontal" id="join-form" name="joinForm" method="post" action="/upa/user/join" style="margin-bottom: 100px;">
	    <div class="container" style="padding: 29px 0px 5px;">
		    <div class="form-group">
			    <label for="inputName" class="col-sm-2 control-label">이름</label>
			    <div class="col-sm-3">
			    	<input type="text" class="form-control" id="name" name="name" placeholder="이름">
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">휴대폰번호</label>
			    <div class="col-sm-4">
			    	<input type="text" class="form-control" id="phonenum" name="phonenum" placeholder="- 없이 적어주세요.">
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">차 번호</label>
			    <div class="col-sm-4">
			    	<input type="text" class="form-control" id="carnum" name="carnum" placeholder="ex.12가1234">
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputNumber" class="col-sm-2 control-label">이메일</label>
			    <div class="col-sm-5">
			    	<input type="text" class="form-control" id="email" name="email" placeholder="이메일주소">
			    </div>
		    </div>
	    </div>
	    <div class="page-header">
	 		 <h3>필수 정보 <small>UPA 계정 생성</small></h3>
    	</div>
    	<div class="container" style="padding: 29px 0px 5px;">
	    <div class="form-group">
		    <label for="inputEmail" class="col-sm-2 control-label">아이디</label>
		    <div class="col-sm-4">
		    	<input type="text" class="form-control" id="usrid" name="id" placeholder="아이디">
		    </div>
		    <div class="col-sm-2">
		      <input type="button" class="btn banner" id="btn-checkEmail" value="ID 중복확인"/>
			  <font  id="emailCheck" style="color: red; position: absolute; top: 5px;"></font>
	      	</div>
	    </div>
	    <div class="form-group">
	    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
	    	<div class="col-sm-5">
	    		<input type="password" class="form-control" id="pass" name="password" value="" placeholder="비밀번호">
	    		<p class="help-block">영어, 숫자 포함 8자 이상</p>
	    	</div>
	    </div>
      	<div class="form-group">
		    <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
		    <div class="col-sm-5">
		    	<input type="password" class="form-control" id="repassword" name="repassword" value="" placeholder="비밀번호 확인">
		      <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
		    </div>
		      <font name="passCheck" id="passCheck"></font>
	    </div>
	    </div>
	    <div class="brdwrap scl_box" tabindex="0">
			<div class="agree_tbox ch_view">
				<div>
				<EM>개인정보의 수집 및 이용목적</EM> 
				<P>회사는 서비스 제공을 위하여 필요한 최소한의 범위 내에서 다음 각 항목과 같은 목적으로 개인정보를 수집하고 있습니다.</P><br>
				<TABLE>
				<CAPTION>개인정보의 수집 및 이용목적</CAPTION>
				<COLGROUP>
				<COL width=300>
				<COL width=340>
				<COL></COLGROUP>
				<THEAD>
				<TR>
				<TH scope=col>개인정보 수집항목</TH>
				<TH scope=col>수집 목적</TH>
				<TH scope=col>보유 및 이용기간</TH></TR></THEAD>
				<TBODY>
				<TR>
				<TD>
				<P>성명, ID, 비밀번호, 생년월일, 성별, 이동전화 번호, &nbsp;</P>
				<P>I-PIN정보, 이메일&nbsp;&nbsp;</P></TD>
				<TD>회원제 서비스에 따른 본인 식별을 위해 사용 </TD>
				<TD class=other rowSpan=5>
				<P>회원탈퇴 시까지&nbsp;</P>
				<P>(기타 선택항목: 서비스 이용시까지)</P></TD></TR>
				<TR>
				<TD>광고성 정보 수신 동의 여부(이메일/우편/문자[SMS],전화)</TD>
				<TD>
				<UL>
				<LI>- 공지, 불만처리 등을 위한 원활한 의사소통의 전달</LI>
				<LI>- 새로운 서비스 및 상품이나 이벤트 정보 제공</LI>
				<LI>- 제휴 행사 및 서비스 홍보를 위한 TM자료 활용 </LI></UL></TD></TR>
				<TR>
				<TD>주소</TD>
				<TD>DM, 경품 및 쇼핑물품 배송지 확보</TD></TR>
				<TR>
				<TD>기타 선택항목(직장명,직장주소,부서명,생일)</TD>
				<TD>회원별 맞춤 서비스를 제공하기 위한 선택 입력</TD></TR></TBODY></TABLE>
				<P>그 밖에 인권침해 및 사생활 침해가 우려되는 개인정보는 일체 수집하지 않습니다.</P>
				<P>※ upa 어플의 간편 로그인 회원의 경우 최초 회원 가입 시 핸드폰 번호와 기기번호를 수집하며 프로모션 응모 및 모바일 커머스 이용 시 추가적인 정보가 <br>수집됩니다.</P>
				<P>&nbsp;</P>
				</div>
			</div>
		</div>
	      <div class="form-group">
		    <label for="inputAgree" class="col-sm-2 control-label">약관 동의</label>
	    	<div class="col-sm-6 checkbox">
		      	<label>
		        	<input id="agree" type="checkbox"> <a href="/agreement"> 이용약관</a>에 동의합니다.
		    	</label>
	    	</div>
    	  </div>
	    <div class="form-group">
	      <input class="btn btn-primary btn-register" type="submit" value="가입하기" id="regi" style="float: right; margin: 23px 31px 0px 0px;">
	    </div>
	    </form>
	  </article>
	</div>
	
	<!-- <div class="container">
		<div id="block">
			<h4 id="tlt2_p0">입력 사항</h4>
			<div id="signup">
				<form id="join-form" name="joinForm" method="post" action="/upa/user/join">
					<div id="brdwrap2">
						<h5 id="tit">기본사항</h5>
						<div class="tblwrap">
							<table class="tbl_wtype1">
								<tbody>
									<tr>
										<th scope="row"><strong class="reqd" title="필수항목">*</strong>이름</th>
										<td><input id="name" name="name" type="text" value=""></td>
									</tr>
									<tr>
										<th scope="row"><strong class="reqd" title="필수항목">*</strong>휴대폰</th>
										<td><input id="phonenum" name="phonenum" type="text" value="" placeholder="'-' 제외하고 숫자만 입력"></td>
									</tr>
									<tr>
										<th scope="row" style="padding-left:35px">차 번호</th>
										<td><input id="carnum" name="carnum" type="text" value="" placeholder="ex. 12가1234"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				<div id="brdwrap2">
					<h5 id="tit">필수입력</h5>
					<div class="tblwrap">
						<p class="reqd_box"><strong class="reqd">*</strong> 필수 입력사항</p>
					 	<table class="tbl_wtype1">
							<tbody>
								<tr>
									<th scope="row"><label>아이디<strong class="reqd" title="필수항목">*</strong></label></th>
									<td>
										<input type="text" id="id" name="id" value=""/>
										<input type="button" class="btn banner" id="btn-checkEmail" value="ID 중복확인"/>
										<font id="msg_email"></font>
										<font  id="emailCheck"></font>
									</td>
								</tr>
								<tr>
									<th scope="row"><label>비밀번호 <strong class="reqd" title="필수항목">*</strong></label></th>
									<td>
										<input id="password" name="password" type="password" value="" placeholder="' 영어 / 숫자 '로만 기입">
									</td>
								</tr>
								<tr>
									<th scope="row"><label>비밀번호 재확인<strong class="reqd" title="필수항목">*</strong></label></th>
									<td>
										<input id="repassword" name="repassword" type="password" value="">
										<font name="passCheck" id="passCheck"></font>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					</div>
					<div id="brdwrap2">
						<h5 id="tit">개인정보 수집, 이용 동의</h5>
						<div class="brdwrap scl_box" tabindex="0">
							<div class="agree_tbox ch_view">
								<div>
								<EM>개인정보의 수집 및 이용목적</EM> 
								<P>회사는 서비스 제공을 위하여 필요한 최소한의 범위 내에서 다음 각 항목과 같은 목적으로 개인정보를 수집하고 있습니다.</P><br>
								<TABLE>
								<CAPTION>개인정보의 수집 및 이용목적</CAPTION>
								<COLGROUP>
								<COL width=300>
								<COL width=340>
								<COL></COLGROUP>
								<THEAD>
								<TR>
								<TH scope=col>개인정보 수집항목</TH>
								<TH scope=col>수집 목적</TH>
								<TH scope=col>보유 및 이용기간</TH></TR></THEAD>
								<TBODY>
								<TR>
								<TD>
								<P>성명, ID, 비밀번호, 생년월일, 성별, 이동전화 번호, &nbsp;</P>
								<P>I-PIN정보, 이메일&nbsp;&nbsp;</P></TD>
								<TD>회원제 서비스에 따른 본인 식별을 위해 사용 </TD>
								<TD class=other rowSpan=5>
								<P>회원탈퇴 시까지&nbsp;</P>
								<P>(기타 선택항목: 서비스 이용시까지)</P></TD></TR>
								<TR>
								<TD>광고성 정보 수신 동의 여부(이메일/우편/문자[SMS],전화)</TD>
								<TD>
								<UL>
								<LI>- 공지, 불만처리 등을 위한 원활한 의사소통의 전달</LI>
								<LI>- 새로운 서비스 및 상품이나 이벤트 정보 제공</LI>
								<LI>- 제휴 행사 및 서비스 홍보를 위한 TM자료 활용 </LI></UL></TD></TR>
								<TR>
								<TD>주소</TD>
								<TD>DM, 경품 및 쇼핑물품 배송지 확보</TD></TR>
								<TR>
								<TD>기타 선택항목(직장명,직장주소,부서명,생일)</TD>
								<TD>회원별 맞춤 서비스를 제공하기 위한 선택 입력</TD></TR></TBODY></TABLE>
								<P>그 밖에 인권침해 및 사생활 침해가 우려되는 개인정보는 일체 수집하지 않습니다.</P>
								<P>※ upa 어플의 간편 로그인 회원의 경우 최초 회원 가입 시 핸드폰 번호와 기기번호를 수집하며 프로모션 응모 및 모바일 커머스 이용 시 추가적인 정보가 <br>수집됩니다.</P>
								<P>&nbsp;</P>
								</div>
							</div>
						</div>
						<fieldset id="agreeF">
							<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
							<label>서비스 약관에 동의합니다. (필수)</label>
						</fieldset>
					</div>
					<input class="btn btn-primary btn-register" type="submit" value="가입하기" style="float: right; margin: 23px 31px 0px 0px;">
				</form>
			</div>
		</div>
	</div> -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
<script>
$(function() {
		var flag_validation = false;
		
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
		
		$("#join-form").submit(function(){
			console.log("form check");
			//이름 체크
			if($("#name").val() == ""){
			$("#name").focus();
			sweetAlert("이름은 필수 입력 항목입니다.","Something went wrong", "error");
			return false;
			}
			
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
			
			//아이디
			if($("#usrid").val() == ""){
				$("#usrid").focus();
				sweetAlert("아이디 필수 입력 항목입니다.","Something went wrong", "error");
				return false;
			} 
			
			//중복검사
			if(flag_validation == false){
				$("#btn-checkEmail").focus();
				sweetAlert("중복검사를 해주세요.","Something went wrong", "error");
				return false;
			}
		
			//패스워드
			regPassword = /^[a-zA-Z0-9]{8,20}$/;
			if($("#pass").val() == ""){
				$("#pass").focus();
				sweetAlert("비밀번호는\n 필수 입력 항목입니다.","Something went wrong", "error");
				return false;
			} else{
				if(!regPassword.test($("#pass").val())) { 
			      $("#pass").focus(); 
  		   		 sweetAlert("비밀번호의 입력된 내용이\n잘못된 형식입니다.","Something went wrong", "error");
		 	     return false; 
				}
			}
			
			//재 패스워드
			if($("#repassword").val() == ""){
				$("#repassword").focus();
				sweetAlert("비밀번호 재입력은 \n필수 입력 항목입니다.","Something went wrong", "error");
				return false;
				}
			
			//패스워드 일치 여부
			if($("#pass").val() != $("#repassword").val()){
				$("#pass").focus();
				sweetAlert("비밀번호가 일치하지 않습니다.","Something went wrong", "error");
				return false;
			}
		
			//약관동의
			if($("#agree").is(':checked') == false ) {
		         sweetAlert("약관 동의가 필요합니다.","Something went wrong", "error");
		         return false;
		     }

		return true;
		});
		
		$("#usrid").change(function(){
			$("#emailCheck").text('');
			$("#emailCheck").val('');
			$("#btn-checkEmail").show();
		});
		
		$("#regi").click(function(){	
			console.log($("#name"));
		});
		
		//아이디 유효성 검사
		$("#btn-checkEmail").click(function(){			
			var id = $("#usrid").val();

			if($("#usrid").val() == ""){
				$("#usrid").focus();
				sweetAlert("아이디를 입력하시지 않으셨습니다.","Something went wrong", "error");
				return false;
			}
			
			$.ajax({
				url: "CheckEmail",
				type: "POST",
				data: {"id":id},
				dataType: "json",
				success: function(response){
					console.log(response);
					if(response.result == "fail"){
						console.error("error:"+response.message);
						return ;
					}
					
					if(response.data == true){
						$("#usrid").val("").focus();
						sweetAlert("이미 존재하는 아이디입니다.\n다른 아이디를 사용해 주세요.","Something went wrong", "error");
						return;
					}
					
					//console.log("사용할 수 있음!");
					flag_validation = true;
					$("#emailCheck").html("[사용 가능]");
					$("#btn-checkEmail").hide();
				},
				
				error: function(jsXHR, status, e){
					console.error("error:"+status+":"+e);
				}
			});
		});
});
</script>
<script src="/upa/theme/js/owl.carousel.min.js"></script>
<script src="/upa/theme/js/bootstrap.min.js"></script>
<script src="/upa/theme/js/plugins.js"></script>
<script src="/upa/theme/js/main.js"></script>
</html>