<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
html {
	font-family: Noto Sans KR;
}

.myImgs {
	width: 343px;
	height: 272px;
	object-fit: cover;
	border-radius:3px 3px 3px 3px;
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
#passChk {
	text-align: center;
	width: 800px;
	height: 400px;
	float: center;
	margin: auto;
	padding-top:150px;
}

input[type="password"] {
	height: 30px;
	border-radius: 5px 5px 5px 5px
}

#warning {
	color: white;
	display: inline-block;
	float: left;
	height: 150px;
	width: 400px;
	text-align: left;
	margin-left: 50px;
	font-size: 20px;
	font-weight: 300;
	line-height: 2.0;
}

#btn {
	all: unset;
	background: #2e6cb5;
	width: 200px;
	height: 35px;
	color: white;
	border-radius: 20px 20px 20px 20px;
}

#btn:hover {
	cursor: pointer;
}

#blist {
	width: 1118px;
	height: 886px;
}


/* #userRead {
	border: 2px solid black; width:304px;
	margin-left:10px;
	text-align: center;
	overflow:hidden;
	display:inline-block;
	float:left
} */

#userRead {
	width: 304px;
	height: 478px;
	margin-right: 30px;
	text-align: center;
	overflow: hidden;
	display: inline-block;
	float: left;
	background: white;
	padding: 26px;
	border-radius: 5px 5px 5px 5px;
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

.mypageItems:hover{cursor:pointer;}

.mypageItems {
	font-weight: light;
	font-size: 20px;
	margin-right: 10px;
	display: inline-block;
	float: left;
	width: 80px;
	height: 40px
}

/* .creatertab {
   background: white;
   width: 300px;
   height: 100px;
   float: left;
   margin: auto;
} */

#pTitle {
	font-weight: bold;
	font-size: 70px;
	color: white;
}

#pContent {
	font-weight: 200;
	font-size: 30px;
	color: white;
}

.infoC {
	width: 100%;
}

.left {
	width: 122px;
	display: inline-block;
	font-size: 17px;
	height: 35px;
	text-align: left
}

.right {
	width: 122px;
	display: inline-block;
	font-size: 17px;
	height: 35px;
	text-align: right;
}

.creatertab {
	border:1px solid #ededed;
	width: 550px;
	height: 138px;
	float: left;
	margin: auto;
	margin-left:10px;
	margin-bottom:10px;
	border-radius:5px 5px 5px 5px;
}

.imgList {
	display: inline-block;
	float: left;
	margin: 17px
}

</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>마이페이지</title>

</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;height:1080px;">
	<jsp:include page="../menu.jsp" />
	<div style="background:#2b4163;height:1200px;padding:80px;padding-top:0px;padding-left:120px;">		
		<div id=pDiv style="height:220px;padding-left:15px;"><br><br>
			<div id=pTitle>ArtistPage</div>
			<div id=pContent>${vo.nickname} 님의 프로필입니다.</div>
		</div>
		<div style="width:1700px;height:1100px;text-align:center;">
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
			<div id="mypageList" style="background:white;display:inline-block;float:left;margin-left:10px;width:1200px;height:950px;padding:30px;border-radius:6px 6px 6px 6px" >
				<div style="width:1100px;font-weight:300">
					<div class="mypageItems" id="artWork">
						아트웍
					</div>
					<div class="mypageItems" id="goods">
						굿즈
					</div>
					<div class="mypageItems" id="following">
						팔로잉
					</div>
					<div class="mypageItems" id="follower2">
						팔로워
					</div>
					<div class="mypageItems" id="statistics">
						통계
					</div>
				</div>	
				<div style="display:inline-block;float:center;margin:10px;width:1135px;height:870px;" >										
					<div id=Blist>
						<c:if test="${empty blist}">
							<h1>등록한 게시물이 없습니다</h1>
						</c:if>
						<c:if test="${not empty blist}">
							<c:forEach items="${blist}" var="bvo">
								<div style="display:inline-block;float:left;margin:17px;">
									<img src="../display?fileName=${bvo.image}">
								</div>
							</c:forEach>
						</c:if>
					</div>
					<div id=Plist>
						<c:if test="${empty plist}">
							<h1>등록한 상품이 없습니다</h1>
						</c:if>
						<c:if test="${not empty plist}">
						<c:forEach items="${plist}" var="pvo">
							<div style="display:inline-block;float:left;margin:17px;">
								<img src="../display?fileName=${pvo.image}">
							</div>
						</c:forEach>
						</c:if>
					</div>
					<div id=followingList>
						<c:if test="${empty followingInfo}">
							<h1>당신이 팔로우한 사람이 없습니다.</h1>
						</c:if>
						<c:if test="${not empty followingInfo}">
						<c:forEach items="${followingInfo}" var="followingList">
							<table class="creatertab">
								<tr>
									 <td id="creater" style="width:126px;text-align:center;">				                        
				                        <img src="../display?fileName=${followingList.u_image}"   style="float: left; border-radius: 50%;" width=75 height=75 />
				                     </td>
				                     <td style="text-align:left;">
				                        <div style="font-size:20px;display:inline-block">${followingList.nickname}</div><br>		                       
										<div style="display:inline-block;color:#acacac">${followingList.introduce}</div>
				                     </td>
								</tr>
							</table>
						</c:forEach>
						</c:if>
					</div>
	
	
					
					<div id=followerList>
						<c:if test="${empty followerInfo}">
							<h1>당신을 팔로우한 사람이 없습니다.</h1>
						</c:if>
						<c:if test="${not empty followerInfo}">
						<c:forEach items="${followerInfo}" var="followerList">
							<table class="creatertab">
								<tr>
									 <td id="creater" style="width:126px;text-align:center;">
				                        <img src="../display?fileName=${followerList.u_image}" style="margin-left:10px;border-radius: 50%;" width=80 height=80 />
				                        </td>
				                     <td style="text-align:left;">
				                        <div style="font-size:20px;display:inline-block">${followerList.nickname}</div><br>		                       
										<div style="display:inline-block;color:#acacac">${followerList.introduce}</div>
				                     </td>
								</tr>
							</table>
						</c:forEach>
						</c:if>
					</div>
				
				</div>
			</div>
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


$("#Plist").hide();
$("#followingList").hide();
$("#followerList").hide();


$("#artWork").click(function(){
	$("#Blist").show();
	$("#Plist").hide();
	$("#followingList").hide();
	$("#followerList").hide();
})
$("#goods").click(function(){
	$("#Blist").hide();
	$("#Plist").show();
	$("#followingList").hide();
	$("#followerList").hide();
})
$("#following").click(function(){
	$("#Blist").hide();
	$("#Plist").hide();
	$("#followingList").show();
	$("#followerList").hide();
})
$("#follower2").click(function(){
	$("#Blist").hide();
	$("#Plist").hide();
	$("#followingList").hide();
	$("#followerList").show();
})


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