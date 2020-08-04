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

.mypageItems:hover{cursor:pointer;}

.creatertab {
   background: white;
   width: 300px;
   height: 100px;
   float: left;
   margin: auto;
}
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
		<div id="mypageList" style="background:blue;display:inline-block;float:left;margin-left:10px;width:1400px;height:900px;" >
			<div class="mypageItems" id="artWork" style="background:red;display:inline-block;float:left;margin-left:10px;width:200px;height:60px;" >
				<h3>아트웍</h3>
			</div>
			<div class="mypageItems" id="goods" style="background:red;display:inline-block;float:left;margin-left:10px;width:200px;height:60px;" >
				<h3>굿즈</h3>
			</div>
			<div class="mypageItems" id="following" style="background:red;display:inline-block;float:left;margin-left:10px;width:200px;height:60px;" >
				<h3>팔로잉</h3>
			</div>
			<div class="mypageItems" id="follower2" style="background:red;display:inline-block;float:left;margin-left:10px;width:200px;height:60px;" >
				<h3>팔로워</h3>
			</div>
			<div class="mypageItems" id="statistics" style="background:red;display:inline-block;float:left;margin-left:10px;width:200px;height:60px;" >
				<h3>통계</h3>
			</div>
			
			<div style="display:inline-block;float:center;background:yellow;margin:10px;width:1380px;height:820px;" >
				
				
				<div id=Blist>
					<c:if test="${empty blist}">
						<h1>등록한 게시물이 없습니다</h1>
					</c:if>
					<c:if test="${not empty blist}">
						<c:forEach items="${blist}" var="bvo">
							<div style="display:inline-block;float:left;">
								<img src="../display?fileName=${bvo.image}" width=200 height=200>
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
						<div style="display:inline-block;float:left;">
							<img src="../display?fileName=${pvo.image}" width=200 height=200>
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
						<table class="creatertab" style="margin: 10px; padding: 25px; border-radius: 5px 5px 5px 5px;">
							<tr>
								 <td id="creater" width=100 colspan=3 style="padding-bottom: 25px;">
			                        
			                        <img src="../display?fileName=${followingList.u_image}"   style="float: left; border-radius: 50%;" width=75 height=75 />
			                     </td>
			                     <td>
			                        <span style="text-align: left; width: 200px; float: left; padding-left: 25px;">
			                              <p style="font-size: 15px; margin: 0;">${followingList.nickname}</p>
			                        </span>
			                        <br>
									<span style="text-align:center; width: 200px; float: left; padding-left: 25px;">
										${followingList.introduce}
									</span>
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
						<table width=400 class="creatertab" style="margin: 10px; padding: 25px; border-radius: 5px 5px 5px 5px;">
							<tr>
								 <td id="creater" width=149 colspan=3 style="padding-bottom: 25px;">
			                        
			                        <img src="../display?fileName=${followerList.u_image}" style="float: left; border-radius: 50%;" width=75 height=75 />
			                        </td>
			                     <td>
			                        <span style="text-align: left; width: 200px; float: left; padding-left: 25px;">
			                              
			                              <p style="font-size: 15px; margin:0;">${followerList.nickname}</p>
			                        </span>
			                        <br>
									<span id="total">
										${followerList.introduce}
									</span>
			                     </td>
							</tr>
						</table>
					</c:forEach>
					</c:if>
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