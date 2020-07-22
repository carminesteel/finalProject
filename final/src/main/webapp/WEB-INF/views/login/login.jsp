<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type = "text/javascript" src = "https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<style>
#bg {
	position: fixed;
	top: 0;
	left: 0;
	position: absolute;
	z-index: -1; /* Preserve aspet ratio */
	min-width: 100%;
	min-height: 100%;
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
	height: 100vh;
	background-size:cover;
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

#tlqkf{
	position: relative;
	z-index: 2;
	background:white;
	padding:40px;
	height:750px;
	margin:30px;
	border-radius: 20px;
}

.login-form h1 {
	font-size: 50px;
	color: black;
	text-align: left;
	margin-bottom: 80px;
}

.int-area {
	width: 400px;
	position: relative;
	margin-top: 20px;
}

.int-area:first-child {
	margin-top: 0;
}

.int-area input {
	width: 100%;
	padding: 20px 10px 10px;
	border-radius: 25px;
	border: none;
	border-bottom: 1px solid #999;
	font-size: 20px;
	color: black;
	outline: none;
}

.int-area label {
	position: absolute;
	left: 10px;
	top: 15px;
	font-size: 18px;
	color: #999;
	transition: all .5s ease;
}

.int-area label.warning {
	color: red !important;
	animation: warning .3s ease;
	animation-iteration-count: 3;
}

@keyframes warning { 
	0% {transform:: translateX(-8px);}
	25%{transform: translateX(8px);}
	50%{transform: translateX(-8px);}
	75%{transform: translateX(8px);}
}
.int-area input:focus+label,
.int-area input:valid+label {
	top: -2px;
	font-size: 13px;
	color: #166cea;
}

.btn-area {
	margin-top: 30px;
}

.btn-area button {
	width: 222px;
	height: 50px;
	background: #166cea;
	color: #fff;
	font-size: 20px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	margin-left:2px;
	margin-bottom:6px;
}

.caption {
	margin-top: 30px;
	text-align: left;

}

.caption a {
	font-size: 15px;
	color:red;
	text-decoration: none;
}
</style>
</head>
<body>
	<img src="../display?fileName=loginback.png" id="bg" alt="">
	<section class="login-form">
		<div  style="">
			<h1 style="font-family:Helvetica33-ExtendedThin; font-size:80px; 
			text-align:left; margin-left:40px; color:#fff;">Artists</h1>
		</div>
		<div id=tlqkf>
		<h1 style="height:10px;">Login</h1>
		<span>이곳이 처음이신가요?<a id="userInsert">회원가입</a></span>
		<br><br><br><br>
		<form name="frm" action="login" method="post">
			<div class="int-area">
				<input type="text" name="id" id="id" autocomplete="off" required>
				<label for="id">USER NAME</label>
			</div>
			<br><br>
			<div class="int-area">
				<input type="password" name="pass" id="pass" autocomplete="off"	required>
				<label for="pass">PASSWORD</label>
			</div>
			<br><br>
			<div class="btn-area" style="text-align:center;">
				<button id="btn" type="submit">LOGIN</button>
				<br>
			</div>
		</form>
		 <a id="kakao-login-btn" style="margin-left:90px;"></a>           
           <a href="http://developers.kakao.com/logout" ></a>
           <br>
           <div id="naver_id_login" style="text-align:center;"></div>
           <div class="caption">
		   <a href="">아아디 찾기</a><br>
		   <a href="">비밀번호 찾기</a>
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
      alert(JSON.stringify(authObj));
   },
   fail : function(err) {
      alert(JSON.stringify(err));
   }

});
//
</script>
<!-- 네이버아디디로로그인 초기화 Script -->
   <script type="text/javascript">
 
         var naver_id_login = new naver_id_login("mqYaOfp45EbLfF5Ed8in", "http://localhost:8088/");    // Client ID, CallBack URL 삽입
                                            // 단 'localhost'가 포함된 CallBack URL
         var state = naver_id_login.getUniqState();
        
         naver_id_login.setButton("green", 4, 48);
         naver_id_login.setDomain("http://localhost:8088/login/login"); //  URL
         naver_id_login.setState(state);
         naver_id_login.setPopup();
         naver_id_login.init_naver_id_login(); 
</script>
<script>
let	id = $('#id');
let	pass = $('#pass');
let	btn = $('#btn');

$(btn).on('click', function() {
	if($(id).val() == "") {
		$(id).next('label').addClass('warning');
		setTimeout(function() {
			$('label').removeClass("warning");
		}, 1500);
	} 
	else if($(pass).val() == "") {
		$(pass).next('label').addClass('warning');
		setTimeout(function() {
			$('label').removeClass("warning");
		}, 1500);
	}
});
</script>
<script>
   $(frm).submit(function(e){
      e.preventDefault();
      var id=$(frm.id).val();
      var pass=$(frm.pass).val();
      
      $.ajax({
         type:"post",
         url:"/login/login",
         dataType:"json",
         data:{"id":id,"pass":pass},
         success:function(data){
            if(data==1){
               alert("로그인 성공");
               location.href="/";
            }else if(data==2){
               alert("관리자 로그인 성공");
               location.href="/";//관리자 메뉴로 이동 설정해주세요 만들어지면
            }else if(data==3){
               alert("블럭처리된 계정");
            }else if(data==4){
               alert("비밀번호가 틀렸습니다.");
               $(frm.pass).val("");
               $(frm.pass).focus();
            }else{
               alert("아이디가 존재하지 않습니다.");
               $(frm.id).val("");
               $(frm.pass).val("");
               $(frm.id).focus();
            }   
         }            
      });
   });
   
   
   //회원가입 버튼을 눌렀을 때
   $("#userInsert").on("click" , function(){
	   window.open("/login/insert","","width=700, height=1400");
   })
</script>
</html>