	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css" />
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/login.css" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=285177e645b698276895abf188247b00&libraries=services"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
/* .help-block 을 일단 보이지 않게 설정 */
#myForm .help-block {
	display: none;
}
/* glyphicon 을 일단 보이지 않게 설정 */
#myForm .glyphicon {
	display: none;
}
</style>


<style>
@import url('https://fonts.google.com/css?family=Raleway&display=swap');

#body {
   display: flex;
   over-flow-x:hidden;
   justify-content: center;
   align-items: center;
   height: 1000px;
   width:100%;
   background: #2b4163;
   font-family: 'Raleway', sans-serif;
}

h1 {
	font-size: 2rem;
	color: #fff;
	position: relative;
}

h1::before {
	content: attr(data-text);
	color: yellow;
	position: absolute;
	left: 0;
	z-index: 2;
	overflow: hidden;
	width: 100%;
	/* 추가 */
	animation: loading 2s ease infinite;
}

h1::after {
	content: "";
	width: 100%;
	height: 3px;
	background: yellow;
	position: absolute;
	left: 0;
	bottom: -0px;
	animation: loadingLine 2s ease infinite;
}

@keyframes loading {
	from {width: 0%;
	}to {width: 100%;
	}
}
@keyframes loadingLine {
		from {width:0%;
		}to {width: 100%;
	}

}

body {
	margin: auto;
	text-align: center;
	background: #f5f6f7;
	
}

.form-control {
	width: 60%;
}

.form-controlE {
	width: 40%;
	margin-bottom: 0px;
}

.form-controlEB {
	width: 45%;
	background: #2e6cb5;
	color: #fff;
	height: 30px;
	border: none;
	border-radius: 6px 6px 6px 6px;
	outline: none;
}

#form-controlAB {
	outline: none;
	border: none;
	border-radius: 6px 6px 6px 6px;
	width: 100px;
	height: 30px;
	margin: 4px;
	background: #2e6cb5;
	color: #fff;
	text-align: left;
	margin-right: 250px;
}

#btnInsert {
	outline: none;
	border: none;
	border-radius: 6px 6px 6px 6px;
	width: 100px;
	height: 30px;
	margin: 4px;
	background: #2e6cb5;
	color: #fff;
	font-size: 15px;
}

#btnCancle {
	outline: none;
	border: none;
	border-radius: 6px 6px 6px 6px;
	width: 100px;
	height: 30px;
	margin: 4px;
	background: #2e6cb5;
	color: #fff;
	font-size: 15px;
}
</style>
<title>Login Insert</title>
</head>
<body>
	<form name="frm" action="/login/insert" method="post" id="myForm"
		enctype="multipart/form-data">
		<!--로딩-->
		<div id="body">
			<h1 data-text="LOADING">LOADING</h1>
		</div>

		<!--이미지-->
		<div>
			<img src="../display?fileName=im2.jpg" id="image"
				style="border-radius: 50%;width:100px;max-height::100px;object-fit:cover" /> <input type="file"
				name="file">
		</div>
		
		<hr style="border: solid 1px #2e6cb5;">
		<!--아이디-->
		<div id=id_row>
			<input type="hidden" id=idchk value=-1>
			<h5 style="text-align: left; margin-left: 100px;">아이디</h5>
			<input class="form-control" type="text" placeholder="ID" name="id"	id="regId" value="" maxlength="13" required>
			<div id="idOk" class="idid" style="color: blue;">사용 가능한 아이디
				입니다.</div>
			<div id="idErr" class="idid" style="color: red;">이미 사용중이거나 탈퇴한
				아이디 입니다.</div>
			<div id="idRegErr" class="idid" style="color: red;">영어 소문자,숫자 5-12자리만 사용이 가능합니다.</div>	
		</div>


		<!--비밀번호-->
		<div>
			<h5 style="text-align: left; margin-left: 100px;">비밀번호</h5>
			<input class="form-control" type="password" name="pass" value="" id="pass" placeholder="PassWord" maxlength="16" />
			<div id="pwdRegErr" class="help-block" style="color: red;">8~16자 영문 대 소문자,숫자,특수문자를 사용하세요.</div>
		</div>
		<div>
			<h5 style="text-align: left; margin-left: 100px;">비밀번호 확인</h5>
			<input class="form-control" type="password" name="repass" value="" id="repass" placeholder="PassWord" maxlength="16" />
			<div id="rePwdErr" class="help-block" style="color: red;">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</div>
		</div>


		<!--이름-->
		<div>
			<h5 style="text-align: left; margin-left: 100px;">이름</h5>
			<input class="form-control" type="text" placeholder="Name"
				name="name" value="" required>
		</div>

		<!--닉네임-->
		<div>
			<h5 style="text-align: left; margin-left: 100px;">닉네임</h5>
			<input class="form-control" type="text" placeholder="NickName"
				value="" name="nickname" required maxlength="8" >
		</div>

		<!--휴대전화-->
		<div>
			<h5 style="text-align: left; margin-left: 100px;" >휴대전화 ('-' 없이	번호만 입력해주세요)</h5>
			<input class="form-control" type="text" placeholder="TEL" value="" maxlength="11"
				name="phone" required>
		</div>


		<!--이메일 인증 -->
		<div id="email_row">
			<h5 style="text-align: left; margin-left: 100px;">이메일</h5>
			<input type="hidden" id=idchk value=-1> <input
				class="form-controlE" type="text" name="email" id="email"
				placeholder="email" value="${emali}"> <input
				class="form-controlEB" type="button" id="sendMessage"
				value="인증번호 받기" style="margin-bottom: 10px;">
			<div id="emailErr" class="help-block" style="color: red;">올바른
				이메일 형식이 아닙니다. 다시 입력해 주세요.</div>
			<div id="emailOk" class="Eemail" style="color: blue;">사용 가능한
				이메일 입니다.</div>
			<div id="emailErrr" class="Eemail" style="color: red;">사용중인 이메일
				입니다.</div>
		</div>
		<div id="chkEmail" style="display: none">
			<div>
				<input type="hidden" id=dice> <input class="form-controlE"
					type="text" name="email_injeung" placeholder="인증번호를 입력하세요.">
				<button
					style="width: 99.9px; outline: none; background: #2e6cb5; color: #fff; height: 30px; border: none; border-radius: 6px 6px 6px 6px; margin-bottom: 0px; margin-bottom: 10px;"
					name="email_injeung_btn">확인</button>
				<input class="form-control" type="hidden" id="injeung" value=0>
			</div>
		</div>

		<!--자기소개-->
		<div>
			<h5 style="text-align: left; margin-left: 100px;">자기소개</h5>
			<div>
				<textarea name="introduce" value="${introduce}"
					placeholder="자기를 소개하는 글을 쓰세요"
					style="resize: none; width: 330px; height: 100px;"></textarea>
			</div>
		</div>

		<!--우편번호 찾기-->
		<div>
			<input type="button" id="form-controlAB" onclick="openAddress();"
				value="우편번호 찾기" style="">
		</div>
		<div>
			<div>
				<input type="hidden" name="post" class="box" id="users_zipCode"
					placeholder="우편번호" required>
			</div>
		</div>
		<div>
			<div>
				<input class="form-control" type="text" name="roadAddress"
					class="box" value="${roadAddress}" id="users_address"
					placeholder="도로명주소" required>
			</div>
		</div>
		<div>
			<div>
				<input class="form-control" type="text" name="jibunAddress"
					class="box" value="${jibunAddress}" id="users_addressDetail"
					placeholder="상세주소" required>
			</div>
		</div>
		<div>
			<div>
				<input class="form-control" type="text" name="addr" class="box"
					value="${addr}" id="sample4_jibunAddress" placeholder="주소">
			</div>
		</div>

		<input type="submit" id="btnInsert" value="가입"><br>
		<input type="reset" id="btnCancle" value="취소">
	</form>
</body>
<script>
	$(".idid").hide();
	$(".Eemail").hide();
	$("#body").hide();
	$(frm.file).hide();
	$("#sendMessage").on("click", function(e) {
		e.preventDefault();
		$("#body").show();
	})

	//이메일 인증번호 전송 
	$(frm).on("click", "#email_row #sendMessage", function(e) {
		e.preventDefault();
		var email = $(frm.email).val();
		if (email != "") {
			$.ajax({
				type : "post",
				url : "/member/auth.do",
				data : {"e_mail" : email},
				success : function(data) {
					alert("인증번호를 발송하였습니다.");
					$("#dice").val(data);
					$("#chkEmail").show();
					$("#body").hide();
				}
			})

		} else {
			alert("Email을 입력해주세요");
		}
	});
	//이메일 인증
	$(frm.email_injeung_btn).on("click", function(e) {
		e.preventDefault();
		var dice = $("#dice").val();
		var chkNum = $(frm.email_injeung).val();
		if (chkNum != "") {
			$.ajax({
				type:"post",
				url:"/member/join_injeung.do",
				data:{"email_injeung" : chkNum,"dice" : dice},
				dataType : "json",
				success : function(data) {
					if (data == 1) {
						alert("인증이 성공되었습니다.");
						$("#injeung").val(1);
					} else {
						alert("인증이 실패하였습니다.");
					}
				}
			})
		} else {
			alert("인증번호를 입력해주세요");
		}
	})


	
	//아이디 중복
	$(frm).keyup("#id_row", function(e) {
		e.preventDefault();
		var id = $(frm.id).val();
		var reg = /^[a-z][a-z\d]{4,11}$/;
		if (id != "") {
			if (reg.test(id)) {
				$.ajax({
					type:"get",
					url:"/insert/read",
					data:{"id":id},
					dataType:"json",
					success:function(data) {
						if (data == 0) {
							$(frm).find("#id_row #idchk").val(data);
							$("#idOk").show();
							$("#idErr").hide();
						} else {
							$(frm).find("#id_row #idchk").val(data);
							$("#idErr").show();
							$("#idOk").hide();
						}
					}
				});	
			}
		}	
	});
	
	//이메일 정규식
	   $("#email").keyup(function() {
	      var email = $(this).val();
	      // 이메일 검증할 정규 표현식
	      var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	      if (reg.test(email)) {//정규표현식을 통과 한다면
	         $("#emailErr").hide();
	         $.ajax({
	            type:"get",
	            url:"/insert/eread",
	            data:{"email" : email},
	            dataType:"json",
	            success : function(data) {
	               if (data == 0) {
	                  $(frm).find("#email_row #idchk").val(data);
	                  $("#emailOk").show();
	                  $("#emailErrr").hide();
	               }else{
	                  $(frm).find("#email_row #idchk").val(data);
	                  $("#emailErrr").show();
	                  $("#emailOk").hide();
	               }
	            }

	         });
	         successState("#email");
	      } else {//정규표현식을 통과하지 못하면
	         $("#emailErr").show();
	         $("#emailOk").hide();
	         $("#emailErrr").hide();
	         errorState("#email");
	      }
	   });
	//아이디 정규식
	$("#regId").keyup(function() {
		var id = $(this).val();
		// 비밀번호 검증할 정규 표현식
		var reg = /^[a-z][a-z\d]{4,11}$/;
		if (reg.test(id)) {//정규표현식을 통과 한다면
			$("#idRegErr").hide();
			$("#idOk").show();
			successState("#id");
		} else {//정규표현식을 통과하지 못하면
			$("#idRegErr").show();
			$("#idOk").hide();
			errorState("#id");
		}
	});

	//비밀번호 정규식
	$("#pass").keyup(function() {
		var pass = $(this).val();
		// 비밀번호 검증할 정규 표현식
		var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		if (reg.test(pass)) {//정규표현식을 통과 한다면
			$("#pwdRegErr").hide();
			successState("#pass");
		} else {//정규표현식을 통과하지 못하면
			$("#pwdRegErr").show();
			errorState("#pass");
		}
	});

	//비밀번호 두개 같은지 확인
	$("#repass").keyup(function() {
		var repass = $(this).val();
		var pass = $("#pass").val();
		// 비밀번호 같은지 확인
		if (repass == pass) {//비밀번호 같다면
			$("#rePwdErr").hide();
			successState("#repass");
		} else {//비밀번호 다르다면
			$("#rePwdErr").show();
			errorState("#repass");
		}
	});

	//회원가입 정규식
	$(frm).submit(function(e) {
		e.preventDefault();
		var addr = $(frm.roadAddress).val() + "/" + $(frm.jibunAddress).val();
		$(frm.addr).val(addr);
		var idchk = $(frm).find("#id_row #idchk").val();
		var injeung = $(frm).find("#chkEmail #injeung").val();
		if (idchk == -1) {
			return;
		} else if (idchk == 1) {
			alert("다른 id를 사용해주세요");
			$(frm.id).focus();
		} else if (idchk == 0 && injeung == 0) {
			alert("이메일 인증을 해주세요");
		} else if (idchk == 0 && injeung == 1) {
			alert("회원가입 완료!!");
			frm.submit();
		}
	});

	//이미지 업로드
	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

	$("#image").on("click", function() {
		$(frm.file).click();
	});
</script>
<script>
	/*우편번호*/
	function openAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#users_zipCode").val(data.zonecode);
				$("#users_address").val(data.address);
				$("#users_addressDetail").focus();
			}
		}).open();
	}
</script>
</html>