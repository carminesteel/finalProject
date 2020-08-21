<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
/* .help-block 을 일단 보이지 않게 설정 */
#myForm .help-block {
	display: none;
}

#bg {
	margin-top: 10px;
	position: fixed;
	left: 0;
	position: absolute;
	z-index: -1; /* Preserve aspet ratio */
	width: 1920px;
	height: 1018px;
}

* {margin: 0;padding: 0;box-sizing: border-box;}

body {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	background-size: cover;
	overflow: hidden;
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
	width: 423px;
	border-radius: 20px;
}

section {height: 100%;}
.int-area {width: 315px;position: relative;}
.int-area:first-child {margin-top: 0;}
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

#btn-email #sendMessage{
	width: 100px;
	height: 40px;
	background: #2b4163;
	color: #fff;
	font-size: 13px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	margin-bottom: 6px;
	outline: none;
	padding-bottom:4px;
	margin-right:8px;
	float:right;
}

#btn-emailChk .emailPass_injeung_btn{
	width: 100px;
	height: 40px;
	background: #2b4163;
	color: #fff;
	font-size: 13px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	margin-bottom: 6px;
	outline: none;
	padding-bottom:4px;
	margin-right:8px;
	float:right;
}

#showPassChk #passUpdate{
	width: 100px;
	height: 40px;
	background: #2b4163;
	color: #fff;
	font-size: 13px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	margin-bottom: 6px;
	outline: none;
	padding-bottom:4px;
	margin-right:8px;
	float:right;
}

#btn-id #btnId {
	width: 100px;
	height: 40px;
	background: #2b4163;
	color: #fff;
	font-size: 13px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	margin-bottom: 6px;
	outline: none;
	padding-bottom:4px;
	margin-right:8px;
	float:right;
	position:relative;
	z-index:999;
}
.caption {margin-top: 280px;text-align: left;}
.caption a {font-size: 15px;color: #2b4163;text-decoration: none;}
.email_row {width: 315px;position: relative;}
.email_row:first-child {margin-top: 0;}
.email_row input {
	width: 100%;
	padding: 20px 10px 10px;
	border-radius: 25px;
	border: 1px solid #999;
	font-size: 20px;
	color: black;
	outline: none;
	height:38px;
}

.btn-chkEmail {width: 315px;position: relative;}

.btn-chkEmail:first-child {margin-top: 0;}

.btn-chkEmail input {
	width: 100%;
	padding: 20px 10px 10px;
	border-radius: 25px;
	border: 1px solid #999;
	font-size: 20px;
	color: black;
	outline: none;
	height:38px;
}

.showPass {width: 315px;position: relative;}

.showPass:first-child {margin-top: 0;}

.showPass input {
	width: 100%;
	margin:6px;
	padding: 20px 10px 10px;
	border-radius: 25px;
	border: 1px solid #999;
	font-size: 20px;
	color: black;
	outline: none;
	height:38px;
}

.loader {
  border: 16px solid #f3f3f3; /* Light grey */
  border-top: 16px solid #3498db; /* Blue */
  border-radius: 50%;
  width: 1px;
  height: 1px;
  animation: spin 2s linear infinite;
  position:fixed;
  top:43.5%;
  left:45%;
  z-index: 999;
  
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

</style>
</head>
<body>
	<div class="loader"></div>
	<img src="../display?fileName=loginback.png" id="bg">
	<section class="login-form" id="myForm">
	<div>
		<div style="font-family: Helvetica33-ExtendedThin; font-size: 110px; text-align: left; color: #fff; display: inline-block; margin-top: 50px;">Artists</div>
	</div>
		<div id=tlqkf>
		<span style="font-size: 30px; font-weight: 500; letter-spacing:-2;color:#2e6cb5;" id="sexy">비밀번호 찾기</span>
		<br><br>
			<form name="frm" method="post" action="update">
			<div id=notShowPass>
				<div class="int-area">
					<h5 style="text-align: left; margin-left: 8px; margin-bottom:6px;">아이디</h5>
					<input type="hidden" id=idChk value=-1>
					<input type="text" name="id" value="" autocomplete="off" required >
					<h5 style="margin-left: 40px; margin-top:4px; color:red;">회원가입 당시 입력했던 아이디를 입력해주세요.</h5>		
				</div>
				<div id="btn-id" style="text-align: center;"><br>
					<button id="btnId" >아이디 확인</button>
				</div>
				<br>	
				<div class="email_row">									
					<input type="hidden" id=idChk value=-1>
					<h5 style="text-align: left; margin-left: 8px; margin-bottom:6px;">이메일</h5>
					<input type="text" name="email" id="email" id="getEmail" value="" readonly autocomplete="off" required>
					<h5 style="margin-left: 88px; margin-top:6px; color:blue;">회원가입 당시 입력했던 이메일 입니다.</h5>																		
				</div>
				
				<div id="btn-email" style="text-align: center;"><br>
					<button id="sendMessage">이메일 인증</button>					
				</div>
				<br>				
				<div class="btn-chkEmail" style="display:none;">					
					<input type="hidden" id=dice>
					<input type="text" name="emailPass_injeung" value="" autocomplete="off" required>									
					<input type="hidden" id="injeung" value=0>
					<h5 style="margin-left: 88px; margin-top:6px; color:blue;">인증번호를 입력해주세요.</h5>																		
				</div>																
				<div id="btn-emailChk" style="text-align: center;">
					<button class="emailPass_injeung_btn">인증번호 확인</button>					
				</div>
				</div>
				<br>
				<div id="allShowPass">
				<span style="font-size:30px; font-weight: 500; letter-spacing:-2">새로운 비밀번호</span>
				<br>
				<br>									
				<div class="showPass">
					<h5 style="text-align: left; margin-left: 8px; margin-bottom:4px;">새 비밀번호</h5>										
					<input type="password" name="pass" id="pass" value="" maxlength="16" autocomplete="off" required>
					<div id="pwdRegErr" class="help-block"><h5 style="margin-left:14px; margin-top:6px; color:red;">8~16자 영문 대 소문자,숫자,특수문자를 사용하세요.</h5></div>																							
				</div>					    				    				    				    		    
		         <div class="showPass">		
		         	<h5 style="text-align: left; margin-left: 8px; margin-bottom:4px;">새 비밀번호 확인</h5>                          
		            <input type="password" name="pass" id="repass" value="" maxlength="16" autocomplete="off" required>
		            <div id="rePwdErr" class="help-block"><h5 style="margin-left:20px; margin-top:6px; color:red;">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</h5></div>		            		                  
          	 	</div>
          	 	<div id="showPassChk" style="text-align: center;">
					<input type="submit" id="passUpdate" value="비밀번호 변경">					
				</div>
				</div>          	 	          	 
			</form>			
		</div>
	</section>
</body>
<script>
$(".loader").hide();
$("#allShowPass").hide();
$(".emailPass_injeung_btn").hide();


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
		$(".showPass").find("#rePwdErr").hide();
		successState("#repass");
	} else {//비밀번호 다르다면
		$(".showPass").find("#rePwdErr").show();
		errorState("#repass");
	}
});


$(frm).on("click", "#btn-id #btnId", function() {
   var id = $(frm.id).val();
   $.ajax({
      type:"post",
      url:"/find_email/read",
      data:{"id":id},
      dataType:"json",
      success:function(data) {
         if (data == 1) {
            $.ajax({
               type:"post",
               url:"/find_email/readEmail",
               data:{"id":id},
               dataType:"json",
               success:function(data) {
                  $(frm.email).val(data.email);
               }
            })
         } else {
            alert("존재하지 않는 아이디 입니다.");

         }
      }
   });	
});

//이메일 인증번호 전송 
$(frm).on("click", "#btn-email #sendMessage", function(e) {
	$(".loader").show();	
	e.preventDefault();
   var email = $(frm.email).val();
   if (email != "") {
      $.ajax({
         type:"post",
         url:"/memberPass/auth.do",
         data:{"e_mail":email},
         success:function(data) {
            alert("인증번호를 발송하였습니다.");
            $("#dice").val(data);
            $(".btn-chkEmail").show();
            $(".emailPass_injeung_btn").show();
            $(".loader").hide();
         }
      })

   } else {
      alert("Email을 입력해주세요");
   }
});

$(".emailPass_injeung_btn").on("click", function(e) {
   e.preventDefault();
   var dice = $("#dice").val();
   var chkNum = $(frm.emailPass_injeung).val();
   if (chkNum != "") {
      $.ajax({
         type:"post",
         url:"/memberPass/join_injeung.do",
         data:{"emailPass_injeung":chkNum,"dice":dice},
         dataType:"json",
         success:function(data) {
            if (data == 1) {
               alert("인증이 성공되었습니다.");
               $("#injeung").val(1);
               $("#allShowPass").show();               
               $("#btnId").hide();
               $("#sendMessage").hide();
               $("#notShowPass").hide();
               $("#sexy").hide();
            } else {
               alert("인증이 실패하였습니다.");
            }
         }
      })
   } else {
      alert("인증번호를 입력해주세요");
   }
})

$("#passUpdate").click(function(e){
   e.preventDefault();
   var id = $(frm.id).val();
   var pass = $(frm.pass).val();
 if(!confirm("비밀번호를 변경하시겠습니까?")) return;
               
  $.ajax({
     type:"post",
     url:"/login/passFind/update",
     data:{"id":id,"pass":pass},
     success:function(){
        alert("비밀번호가 변경되었습니다.");
        location.href="/login/login";
     }
     
  });   
})
</script>

</html>