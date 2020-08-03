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
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>마이페이지</title>

</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;height:1080px;">
	<jsp:include page="../menu.jsp" />
	<div style=height:1080px;>		
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
			<div class="mypageItems" id="follower" style="background:red;display:inline-block;float:left;margin-left:10px;width:200px;height:60px;" >
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
						<div style="display:inline-block;float:left;">
							<img src="../display?fileName=${followingList.u_image}" width=200 height=200>
						</div>
					</c:forEach>
					</c:if>
				</div>


				
				<div id=followerList>
					<c:if test="${empty followerInfo}">
						<h1>당신을 팔로우한 사람이 없습니다.</h1>
					</c:if>
					<c:if test="${not empty followerInfo}">
					<c:forEach items="${followerInfo}" var="followerList">
						<div style="display:inline-block;float:left;">
							<span>${followerList.name}</span>
							<img src="../display?fileName=${followerList.u_image}" width=200 height=200>
						</div>
					</c:forEach>
					</c:if>
				</div>
			
			</div>
		</div>
		</div>

	<jsp:include page="../footer.jsp" />
</body>
<script>
	var id="${id}";
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
	$("#follower").click(function(){
		$("#Blist").hide();
		$("#Plist").hide();
		$("#followingList").hide();
		$("#followerList").show();
	})
	
	
	$("#userRead").hide();
	$("#mypageList").hide();
	
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
						$("#mypageList").show();
						/* getMyPageList(); */
						
					}
				}
			})
		} else {
			alert("비밀번호를 입력해주세요");
			$("#passChk").find("#chkPass").focus();
		}
	}) 
/* 	
	function getMyPageList(){
		$.ajax({
			type:"post",
			url:"/mypage/list",
			data:{"id":id},
			dataType:"json",
			success:function(){
			}
		})
 	} */
</script>
</html>