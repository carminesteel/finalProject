<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	display:inline-block;
	float:left
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

#u_list {display:inline-block;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>마이페이지</title>

</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;height:1080px;">
	<jsp:include page="../menu.jsp" />
	<div style=height:1080px;>		
		<div id="userRead">
			<table>
			<tr>
				<td colspan=2><img src="../display?fileName=${vo.u_image}" width=200 height=200 style="border-radius:50%"/></td>
			</tr>
			<tr>
				<td width=150>ID</td>
				<td id="id" c_id="${vo.id}">${vo.id}</td>				
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
				<td>자기소개</td>		
				<td>${vo.introduce}</td>				
			</tr>
			<tr>
				<td>이메일</td>		
				<td>${vo.email}</td>				
			</tr>
			<tr>
				<td id=follower>팔로워: ${vo.follower}</td>
				<td>팔로잉: ${vo.follow}</td>
			</tr>
			<tr>
				<td colspan=2><button id=follow value=""></button></td>
			</table>
		</div>
	</div>
	<br>
	<br>
	<br>
	<jsp:include page="../footer.jsp" />
</body>
<script>
var follower="${id}";
var target="${vo.id}";

getFollow();

function getFollow(){
$.ajax({
	type:"post",
	url:"/user/followChk",
	data:{"follower":follower,"target":target},
	success:function(data){
		if(data==1){
			$("#follow").html("unfollow");
		}else{
			$("#follow").html("follow");
		}
	}
})
}
	
	$("#follow").click(function(){
		$.ajax({
			type:"post",
			url:"/user/followUpdate",
			data:{"follower":follower,"target":target},
			success:function(data){
				$("#follower").html("팔로워: "+data);
				getFollow();
			}
		})
	})
	//잉쓰
</script>
</html>