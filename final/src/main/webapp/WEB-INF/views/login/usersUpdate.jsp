<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.css" />
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
#passChk {
	text-align: center;
	width: 500px;
	height: 400px;
	float: center;
	margin: auto;

}

#userRead {
	
	width:420px;
	margin-left:10px;
	text-align: center;
	overflow:hidden;
	display:inline-block;
	float:left 
	
}

#usertable{
	float:left;
}

#userRead table{margin:auto;}

#userRead td{padding:7px;}

.btn-area button,#profileBtn {
	width: 300px;
	height: 38px;
	background: #166cea;
	color: #fff;
	font-size: 15px;
	border: none;
	border-radius: 40px;
	cursor: pointer;
	margin-left: 2px;
	margin-bottom: 6px;
	outline: none;
}
#passChk {
	text-align: center;
	width: 800px;
	height: 400px;
	float: center;
	margin: auto;
	padding-top: 150px;
}
#warning {
	color: white;
	display: inline-block;
	float: left;
	height: 160px;
	width: 400px;
	text-align: left;
	margin-left: 50px;
	margin-top:20px;
	font-size: 15px;
	font-weight: 300;
	line-height: 2.0;
}

#confirm {
	all: unset;
	border: 1px solid white;
	color: white;
	margin-left: 10px;
	width: 40px;
	height: 30px;
	border-radius: 5px 5px 5px 5px;
}

#confirm:hover {
	cursor: pointer;
}

input[type="password"] {
	height: 30px;
	border-radius: 5px 5px 5px 5px
}
#u_list {display:inline-block;}

.mypageItems:hover{cursor:pointer;}



#userRead{
	text-align:center;
	margin-left:750px;
	margin-top:-15px;
}

#passPass{	
	width:420px;
	margin-left:10px;
	height:600px;
	text-align: center;
	overflow:hidden;
	display:inline-block;	
	border-radius:10px;
	margin-left:750px;
	margin-top:-10px;
}


</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>마이페이지</title>

</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;height:1080px; background:#2b4163;">
	<jsp:include page="../menu.jsp" />
	<div style=height:1080px;>		
		<br><br><br><br><br><br>
		<c:if test="${passChk!=1}">
		<div id="passChk">
				<img style="width: 150px; height: 150px; float: left; margin-left:70px;"
					src="../display?fileName=warning.png" /><br>
				<div id=warning>
					현재 ${vo.nickname} 님의 개인정보에 접근하고 있습니다.<br> 더 진행하려면 비밀번호를
					입력해주세요.
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			<div style="font-size:18px;color:white; ">비밀번호 확인</div><br>
			<input type="password" id="chkPass">
			<button id="confirm">확인</button>
		</div> 
		</c:if>
		
		
		<form name="frm" action="/login/usersUpdate/profile_update" method="post" enctype="multipart/form-data">
		<c:if test="${passChk==1}">
		<div id="userRead" style="background:#fff; border-radius:10px;">
			<table>
			<tr>
			<td><input type="hidden" name=id value="${vo.id}"></td>	
			<td><input type="hidden" name="u_image" value="${ vo.u_image }"></td>
			</tr>
			<tr>
				<td colspan=2>
				<img src="../display?fileName=${vo.u_image}" id="image" style="width:150px; height:150px;border-radius:50%;object-fit:contain"/></td>
				<td><input type="file" name="file"></td>			
			</tr>
			<tr>
				<td width=150>아이디</td>
				<td >${vo.id}</td>				
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name=name value="${vo.name}"></td>					
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name=nickname value="${vo.nickname}"></td>				
			</tr>
			<tr>
				<td>핸드폰</td>		
				<td><input type="text" name=phone value="${vo.phone}"></td>				
			</tr>
			<tr>
				<td>자기소개</td>		
				<td><input type="text" name=introduce value="${vo.introduce}"></td>				
			</tr>
			<tr>
				<td>주소</td>		
				<td><input type="text" name=addr value="${vo.addr}"></td>			
			</tr>
			<tr>
				<td>이메일</td>		
				<td><input type="text" name=email value="${vo.email}"></td>				
			</tr>
			<tr class="btn-area">
				<td style="text-align:center; "colspan=2>
					 <input type=submit id="profileBtn" value="저장">
					 
					 <button id="passBtn">비밀번호 변경하기</button>
					 
					 <button id="usersPosition">회원탈퇴</button>
				</td>
			</tr>
			
		
			</table>
		</div>
		
		
		</c:if>
		</form>
	<!-- ////////////////////////////////userRead를 눌르면 비밀번호 병경이 켜진다/////////////////////////////// -->	
		<form name="frm2" method="post" action="/login/usersUpdate/profile_passUpdate">
		<div id="passPass" style="background:#fff;">
			<br><br>
			안전한 비밀번호로 내 정보를 보호하세요.<br><br>
			<div style="color:red;">다른 아이디/사이트에서 사용한 적 없는 비밀번호</div><br>
			<div style="color:red;">이전에 사용한 적 없는 비밀번호가 안전합니다.</div>
			<br><br>
			<div>
				새 비밀번호:&nbsp;&nbsp;&nbsp;
         		<input type="password" name="newPass" id="pwd1" placeholder="PassWord"  maxlength="16" autocomplete="off" required>
         		<div id="pwdRegErr" style="background:#F2DEDE; color:#B94A48; width:420px; height:38px; line-height:40px;">8~16자 영문 대 소문자,숫자,특수문자를 사용하세요.</div>
			</div>
			<br>
			<div>
				새 비밀번호 확인:&nbsp;&nbsp;
         		<input type="password"  name="newPassChk" id="pwd2" placeholder="PassWord"  required>
			</div>
			<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다</div>
			<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
			
			<br><br><br><br>
			<div class="btn-area">
				<div style="text-align:center; "colspan=2>
					 <button id="upassUpdate">확인</button><br>
					 <button type="reset">취소</button><br>
					 <button id="back">돌아가기</button> 
					 <input type="hidden" id="passChking">
					 
				</div>
			</div>
					
		</div>
		</form>		
	</div>
				
	<jsp:include page="../footer.jsp" />
</body>
<script>

var id="${id}";
$(frm2).hide();
$(frm.file).hide();


function click(){
	var pass = $("#passChk").find("#chkPass").val();
	if (pass != "") {
		$.ajax({
			type:"post",
			url:"/login/mypagePassChk",
			data:{"id":id,"pass":pass},
			dataType:"json",
			success:function(data) {
				if (data==0) {
					alert("비밀번호가 일치하지 않습니다.");
				} else {
					alert("확인되었습니다.");
					location.href="/login/usersUpdate";
					
				}
			}
		})
	} else {
		alert("비밀번호를 입력해주세요");
		$("#passChk").find("#chkPass").focus();
	}
}
	
 	$("#passChk").on("click", "#confirm", function() {
 		click();
	}) 
	$("#chkPass").keydown(function(key){
		if(key.keyCode==13){
			click();
		}
	})
	
	
	//프로필 정보 수정
	$(frm).submit(function(e){
	   e.preventDefault();
	   $(frm.name).val($(frm.name).val());	 
	   $(frm.nickname).val($(frm.nickname).val());
	   $(frm.phone).val( $(frm.phone).val());
	   $(frm.introduce).val($(frm.introduce).val());
	   $(frm.addr).val($(frm.addr).val());
	   $(frm.email).val($(frm.email).val());
       if(!confirm("회원 정보를 수정하시겠습니까?")) return;       
           frm.submit();    
           alert("회원님의 정보가 수정되었습니다.");
   })
	
	$("#passBtn").on("click",function(e){
		e.preventDefault();
		$(frm).hide();
		$(frm2).show();
	})
	
	$("#back").on("click",function(e){
		e.preventDefault();
		$(frm).show();
		$(frm2).hide();
	})
	
	$(frm.file).on("change", function() {
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
	
 	$("#image").on("click", function(){
 		$(frm.file).click();
 	});
	
 	
 	
 	$("#pwd1").keyup(function() {
 		var pwd1=$(this).val();
 		// 비밀번호 검증할 정규 표현식
 		var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
 		if (reg.test(pwd1)) {//정규표현식을 통과 한다면
 			$("#pwdRegErr").hide();
 			successState("#pwd1");
 		} else {//정규표현식을 통과하지 못하면
 			$("#pwdRegErr").show();
 			errorState("#pwd1");
 		}
 	});
 	
 	
 	$(function(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function(){
			var pwd1=$("#pwd1").val();
			var pwd2=$("#pwd2").val();
			var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
			if(pwd1 !="" || pwd2 !=""){
				if(pwd1 == pwd2){
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
					$("#passChking").val(1);
					}
				else{
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled","disabled");
					$("#passChking").val(0);
				}
			}
		});
	});
 	
 	
 	
 	$("#upassUpdate").click(function(e){
 		e.preventDefault();
		var pass=$(frm2.newPassChk).val();
 		var passChking=$("#passChking").val();
		
		if(passChking==0){
			alert("비밀번호를 확인해주세요");
		}else{
			
			if(!confirm("변경 하시겠습니까?")) return;
			
			$.ajax({
				type:"post",
				url:"/login/usersUpdate/profile_passUpdate",
				data:{"id":id,"pass":pass},
				success:function(){
					alert("비밀번호가 변경되었습니다. \n 다시 로그인 해주세요!");
					location.href="/login/login";
				}
			})
		}
		
	})
	//회원탈퇴
	$("#usersPosition").click(function(e){
		e.preventDefault();
		var id=$(frm).val();
		if(!confirm("회원탈퇴시 복구는 할 수 없습니다.")) return;
		if(!confirm("정말로 회원탈퇴를 하시겠습니까?")) return;
		alert("확인을 눌르면 탈퇴가 됩니다.");
		$.ajax({
			type:"post",
			url:"/login/usersUpdate/updatePosition",
			data:{"id":id},
			success:function(){
				alert("회원탈퇴 완료!");
				location.href ="/login/login";
			}
		});	 	
	});
	
</script>
</html>