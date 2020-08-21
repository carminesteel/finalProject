<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" 	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"	charset="utf-8"></script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
#bg {
	margin-top:10px;
	position: fixed;
	left: 0;
	position: absolute;
	z-index: -1; /* Preserve aspet ratio */
	width:1920px;
	height:1018px;
}
</style>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	background-size: cover;
	overflow:hidden;
}

 body::before {
	content: "";
	position: absolute;
	z-index: 1;
	top: 0;
	right: 0;
	buttom: 0;
	left: 0;
}
 
#tlqkf {
	position: relative;
	z-index: 2;
	background: white;
	padding: 50px;
	height: 720px;
	width:423px;
	border-radius: 20px;
}


.int-area {
	width: 315px;
	position: relative;
}

.int-area:first-child {
	margin-top: 0;
}

.int-area input {
	width: 100%;
	padding: 20px 10px 10px;
	border-radius: 25px;
	border: 1px solid #999;
	font-size: 20px;
	color: black;
	outline: none;
	height:38px;
}

.int-area label {
	position: absolute;
	left: 15px;
	top: 10px;
	font-size: 12px;
	color: #999;
	transition: all .5s ease;
}

.int-area label.warning {
	color: red !important;
	animation: warning .3s ease;
	animation-iteration-count: 3;
}

@keyframes warning { 
   0%{transform:translateX(-8px);}
   25%{transform:translateX(8px);}
   50%{transform:translateX(-8px);}
   75%{transform:translateX(8px);}
}

.int-area input:focus+label, .int-area input:valid+label {
	top: -2px;
	font-size: 13px;
	color: #166cea;
}

.btn-area {
	margin-top: 30px;
}

.btn-area button {
	width: 222px;
	height: 49px;
	background: #1e33d2;
	color: #fff;
	font-size: 16px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	margin-bottom: 6px;
	outline: none;
	padding-bottom:4px;
}

.caption {
	margin-top: 35px;
	text-align: left;
}

.caption a {
	font-size: 15px;
	color: red;
	text-decoration: none;
}

section{
	height:100%;
}
</style>
</head>
<body>
	<img src="../display?fileName=loginback.png" id="bg">
	<!-- <div style="display:inline-block;text-align:right;position:absolute;color:white;font-size:30px;top:900px;left:400px;letter-spacing:-5;font-weight:300;line-height:33px;">
		당신만을 위한 아트 플랫폼<br>
		아티스트
	</div> -->
	<section class="login-form">
		<div>
			<div id="Artists" style="font-family: Helvetica33-ExtendedThin; font-size: 110px; text-align: left;
				color: #fff;display:inline-block;margin-top:50px;"
				>Artists</div>
		</div>
		<div id=tlqkf>
			<span style="font-size:40px;font-weight:500;letter-spacing:-2">Login</span><br>
			<span style="font-size:18px;font-weight:200">이곳이 처음이신가요? <a id="userInsert" style="color: #1d35c9;cursor:pointer">회원가입</a></span>
			<br>
			<br>
			<br>
			<br>
			<br>
			<form name="frm" action="login" method="post">
				<div class="int-area">
				
					<input type="text" name="id" id="id" autocomplete="off" required>
					<label for="id">USER NAME</label>
				</div>
				<br>
				<div class="int-area">
				
					<input type="password" name="pass" id="pass" autocomplete="off"
						required> <label for="pass">PASSWORD</label>
				</div>
				<br>
				<div class="btn-area" style="text-align: center;">
					<button id="btn" type="submit">로그인</button>
					<br>
				</div>
			</form>
			<a id="kakao-login-btn" style="margin-left: 51px;"></a> <a
				href="http://developers.kakao.com/logout"></a> <br>
			<div id="naver_id_login" style="text-align: center;"></div>
			<br><br>
			<div class="caption">
				<a href="idFind">아이디 찾기</a><br>
				<a href="passFind">비밀번호 찾기</a><br>
			</div>
		</div>
	</section>
</body>
<script type='text/javascript'>
	Kakao.init('eed74541730128eef3a18e5599019718');

	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.createLoginButton({

		container : '#kakao-login-btn',
		success : function(authObj) {
		},
		fail : function(err) {
		}

	});
	//
</script>
<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("mqYaOfp45EbLfF5Ed8in",	"http://localhost:8088/login/naverlogin"); // Client ID, CallBack URL 삽입
	// 단 'localhost'가 포함된 CallBack URL
	var state = naver_id_login.getUniqState();

	naver_id_login.setButton("green", 4, 48);
	naver_id_login.setDomain("http://localhost:8088/login/login"); //  URL
	naver_id_login.setState(state);
	naver_id_login.init_naver_id_login(); //naver_id_login.setPopup(); 팝업창으로 열린다
</script>
<script>
	

	let	id = $('#id');
	let	pass = $('#pass');
	let	btn = $('#btn');

	$(btn).on('click', function() {
		if ($(id).val() == "") {
			$(id).next('label').addClass('warning');
			setTimeout(function() {
				$('label').removeClass("warning");}, 1500);
		} else if ($(pass).val() == "") {
			$(pass).next('label').addClass('warning');
			setTimeout(function() {
				$('label').removeClass("warning");	}, 1500);
		}
	});
</script>
<script>
var dest="${dest}";
	$(frm).submit(function(e) {
		e.preventDefault();
		var id = $(frm.id).val();
		var pass = $(frm.pass).val();

		$.ajax({
			type : "post",
			url : "/login/login",
			dataType : "json",
			data : {"id" : id,"pass" : pass},
			success : function(data) {
				if (data == 1) {
					alert("로그인 성공");
					location.href = "/";
					if(dest!=""){
						location.href="${dest}";
					}else{
						location.href="/";
					}
				} else if (data == 2) {
					alert("관리자 로그인 성공");
					location.href = "/";//관리자 메뉴로 이동 설정해주세요 만들어지면
				} else if (data == 3) {
					alert("블럭처리된 계정");
				}  else if (data == 4) {
					alert("회원탈퇴 계정");
				}else if (data == 5) {
					alert("비밀번호가 틀렸습니다.");
					$(frm.pass).val("");
					$(frm.pass).focus();
				} else {
					alert("아이디가 존재하지 않습니다.");
					$(frm.id).val("");
					$(frm.pass).val("");
					$(frm.id).focus();
				}
			}
		});
	});

	//회원가입 버튼을 눌렀을 때
	$("#userInsert").on("click", function() {
		window.open("/login/agree", "", "width=600, height=800");
	});
	
	$("#Artists").on("click", function(){
		location.href="/";
	});
</script>
</html>