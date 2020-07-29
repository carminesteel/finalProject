<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#passChk {
	text-align: center;
	width: 500px;
	height: 400px;
	float: center;
	margin: auto;
}

#userRead {
	border: 2px solid black; width:420px;
	margin-left:10px;
	text-align: center;
	overflow:hidden;
	display: none;
}

#usertable{
	float:left;
}

#userRead table{margin:auto;}

#userRead td{padding:7px;}

.btn-area button {
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
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>마이페이지</title>

</head>
<body>
	<div>
		<jsp:include page="../menu.jsp" />
		<br><br><br><br><br><br>
		<div id="passChk">
			<h4>비밀번호 확인</h4>
			<input type="text" id="chkPass">
			<button>확인</button>
		</div> 
		<div id="userRead">
			<table>
			<tr>
				<td colspan=2><img src="../display?fileName=${vo.u_image}" width=200 height=200 style="border-radius:50%"/></td>
			</tr>
			<tr>
				<td width=150>ID</td>
				<td>${vo.id}</td>				
			</tr>
			<tr>
				<td>이름</td>
				<td>${vo.name}</td>				
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${vo.nickname}</td>				
			</tr>
			<tr>
				<td>Phone</td>		
				<td>${vo.phone}</td>				
			</tr>
			<tr>
				<td>자기소개</td>		
				<td>${vo.introduce}</td>				
			</tr>
			<tr>
				<td>주소</td>		
				<td>${vo.addr}</td>			
			</tr>
			<tr>
				<td>이메일</td>		
				<td>${vo.email}</td>				
			</tr>
			<tr class="btn-area">
				<td style="text-align:center; "colspan=2>
					 <button id="btn" onClick="location.href='usersUpdate'">회원정보 수정</button>
				</td>
			</tr>	
			</table>
		</div>
	</div>
	<br>
	<br>
	<br>
	<jsp:include page="../footer.jsp" />
</body>
<script>
	var id="${id}";

 	$("#passChk").on("click", "button", function() {
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
						$("#passChk").hide();
						$("#userRead").show();
					}
				}
			})
		} else {
			alert("비밀번호를 입력해주세요");
			$("#passChk").find("#chkPass").focus();
		}
	}) 
</script>
</html>