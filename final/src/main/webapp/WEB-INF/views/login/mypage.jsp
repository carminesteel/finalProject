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

#blist {
	width: 1118px;
	height: 886px;
}

#btn:hover {
	cursor: pointer;
}

#passChk {
	text-align: center;
	width: 800px;
	height: 400px;
	float: center;
	margin: auto;
	padding-top: 150px;
}

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

#u_list {
	display: inline-block;
}

.mypageItems:hover {
	cursor: pointer;
}

.mypageItems {
	font-weight: light;
	font-size: 20px;
	margin-right: 10px;
	display: inline-block;
	float: left;
	width: 80px;
	height: 40px
}

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
<body style="padding-top: 50px; margin-left: 0px; width: 100%;height:1080px;">
	<jsp:include page="../menu.jsp" />
	
	<div style="background:#2b4163;height:1200px;padding:80px;padding-top:0px;padding-left:120px;">
	<div id=pDiv style="height:220px;padding-left:15px;"><br><br>
	<div id=pTitle>MyPage</div>
	<div id=pContent>${vo.nickname} 님의 프로필입니다.</div>
	</div>		
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
			<div style="font-size:20px;color:white;">비밀번호 확인</div><br>
			<input type="password" id="chkPass">
			<button id="confirm">확인</button>
		</div>
		<div style="width:1700px;height:1100px;text-align:center;">
			<div id="userRead">
				<div style="width: 193px; height: 213px;margin: auto; display: inline-block">
					<img src="../display?fileName=${vo.u_image}" width=113px
						height=113px style="border-radius: 50%" /><br>
					<div style="font-size: 26px; font-weight: bold">${vo.nickname}</div>
					<br>
					<div style="font-size: 13px;">${vo.introduce}</div>
				</div>
				<br>
				<br>
				<button id="btn" onClick="location.href='usersUpdate'">내 프로필 편집</button>
				<button id="btnMessage" onClick="location.href='/product/message'">쪽지함</button>
				<br>
				<br>
				<div
					style="width: 250px; height: 153px;display: inline-block; margin: auto">
					<div class="infoC">
						<span class=left>팔로우</span> <span class=right>${vo.follow}</span>
					</div>
					<div>
						<span class=left>팔로워</span> <span class=right>${vo.follower}</span>
					</div>
					<div>
						<span class=left>총 작품</span> <span class=right>3</span>
					</div>
					<div>
						<span class=left>총 수익</span> <span class=right>4</span>
					</div>
				</div>
				<div style="font-size:15px">
					${vo.email}
				</div>
			</div>

			<div id="mypageList" style="background:white;display:inline-block;float:left;margin-left:10px;width:1200px;height:950px;padding:30px;border-radius:6px 6px 6px 6px" >
				<div style="width:1100px;font-weight:300">
					<div class="mypageItems" id="artWork" >
						아트웍
					</div>
					<div class="mypageItems" id="goods">
						굿즈
					</div>
					<div class="mypageItems" id="following" >
						팔로잉
					</div>
					<div class="mypageItems" id="follower">
						팔로워
					</div>
					<div class="mypageItems" id="orderList">
						구매내역
					</div>
				</div>
				
				<div style="display:inline-block;float:center;margin:10px;width:1135px;height:870px;" >		
					<div id=Blist>
						<c:if test="${empty blist}">
							<h1>등록한 게시물이 없습니다</h1>
						</c:if>
						<c:if test="${not empty blist}">
						<div class="imgList">
								<img src="../display?fileName=addWork.jpg" onClick="location.href='/board/insert'">
							</div>
							<c:forEach items="${blist}" var="bvo">
								<div style="display:inline-block;float:left;margin:17px;">
									<img class="myImgs" src="../display?fileName=${bvo.image}" onClick="location.href='../board/read?b_no=${bvo.b_no}'">
								</div>
							</c:forEach>
						</c:if>
					</div>
				
					<div id=Plist>
						<c:if test="${empty plist}">
							<h1>등록한 상품이 없습니다</h1>
						</c:if>
						<c:if test="${not empty plist}">
							<div class = imgList>
								<img src="../display?fileName=addWork.jpg" onClick="location.href='/product/insert'">
							</div>
							<c:forEach items="${plist}" var="pvo">					
								<div style="display:inline-block;float:left;margin:17px;">
									<img class="myImgs" src="../display?fileName=${pvo.image}" onClick="location.href='../product/read?p_no=${pvo.p_no}'">
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
						<div>
							<table class="creatertab" >
								<tr>
									 <td class="creater" style="width:126px;text-align:center;" onClick="location.href='../user/read?id=${followingList.id}'">				                   
				                        <img src="../display?fileName=${followingList.u_image}"   style="margin-left:10px;border-radius: 50%;" width=80 height=80 />
				                     </td>
				                     <td style="text-align:left;" onClick="location.href='../user/read?id=${followingList.id}'">
				                        <div style="font-size:20px;display:inline-block">${followingList.nickname}</div><br>		                       
										<div style="display:inline-block;color:#acacac">${followingList.introduce}</div>
				                     </td>
				                     <td width=114px>
				                     	<button class="BtnUnfollow" style="all:unset;background:#2e6cb5;color:white;width:74px;height:25px;font-size:13px;border-radius:20px 20px 20px 20px;margin-bottom:60px;">언팔로우</button>
				                     	<input type=hidden value="${followingList.id}" class=unFolTarget>
				                     </td>
								</tr>
							</table>
							
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
							<table class="creatertab" onClick="location.href='../user/read?id=${followerList.id}'">
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
					<div id=buyList>
						구매내역은 최근 구매상품 5개 까지만 나옵니다.
						<br><br>
						<c:if test="${empty buyList}">
							<h1>당신의 주문내역이 없습니다.</h1>
						</c:if>
						<c:if test="${not empty buyList}">
						<table class="creatertab" style="width:1100px;">
							<tr>
								<td>상품 이미지</td>
								<td>상품 명</td>
								<td>수량</td>
								<td>총 금액</td>
								<td>결제 일시</td>
							<tr>
						</tr>
						<c:forEach items="${buyList}" var="buy">
						
								<tr onClick="location.href='../product/read?p_no=${buy.product_no}'">
				                     <td><img src="../display?fileName=${buy.image}" style="margin-left:10px;border-radius: 50%;" width=80 height=80 /></td>
				                     <td>${buy.title}</td>	                       
									 <td>${buy.quantity}</td>
									 <td>${buy.quantity*buy.price}</td>		                       
									 <td>${buy.buyDate}</td>
									
								</tr>
						
						</c:forEach>
						</table>
						</c:if>
					</div>		
				</div>
			</div>
		</div>
		</div>
	<jsp:include page="../footer.jsp" />
</body>
<script>
	var id="${id}";
	/*  $("#userRead").hide();
	$("#mypageList").hide(); 
	 
	$("#pDiv").hide(); */
	
	$("#Plist").hide();
	$("#followingList").hide();
	$("#followerList").hide(); 
	$("#buyList").hide();
	$("#passChk").hide();
	
	
	$("#artWork").click(function(){
		$("#Blist").show();
		$("#Plist").hide();
		$("#followingList").hide();
		$("#followerList").hide();
		$("#buyList").hide();
	})
	$("#goods").click(function(){
		$("#Blist").hide();
		$("#Plist").show();
		$("#followingList").hide();
		$("#followerList").hide();
		$("#buyList").hide();
	})
	$("#following").click(function(){
		$("#Blist").hide();
		$("#Plist").hide();
		$("#followingList").show();
		$("#followerList").hide();
		$("#buyList").hide();
	})
	$("#follower").click(function(){
		$("#Blist").hide();
		$("#Plist").hide();
		$("#followingList").hide();
		$("#followerList").show();
		$("#buyList").hide();
	})
	
	$("#orderList").click(function(){
		$("#Blist").hide();
		$("#Plist").hide();
		$("#followingList").hide();
		$("#followerList").hide();
		$("#buyList").show();
	})
	
	
 	
	
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
						$("#pDiv").show();
						/*  getMyPageList();  */
						
					}
				}
			})
		} else {
			alert("비밀번호를 입력해주세요");
			$("#passChk").find("#chkPass").focus();
		}
	}) 
	
	/* function getMyPageList(){
		$.ajax({
			type:"post",
			url:"/mypage/list",
			data:{"id":id},
			dataType:"json",
			success:function(){
			}
		}) 
 	} */ 		
	$("#followingList").on("click",".BtnUnfollow",function(){
 		var target=$(this).parent().find(".unFolTarget").val();
 		var div=$(this).parent().parent().parent().parent();
 		if(!confirm("팔로우를 취소하시겠습니까?")) return;
 		
 		$.ajax({
 			type:"post",
 			url:"/mypage/unfollow",
 			data:{"follower":id,"target":target},
 			success:function(){
 				alert("취소되었습니다.");
 				div.prop("style","display:none");
 			}
 		})
 	
 	})
</script>
</html>