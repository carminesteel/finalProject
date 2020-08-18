<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<title>Feed List</title>
<style>

.ftbl{
	width:1166px;height:714px; margin:auto;text-align:center;border:1px solid #eeeeee;margin-bottom:27px
}

.icons{
	width:17px;height:17px;
}

	
#tbl .row{}

html {
	font-family: Noto Sans KR
}

#exBody {
	background-color: #e9ecef;
	z-index: 1;
	
}

#exCenter {
	background-color: white;
	width: 1186px;
	margin: auto;
	z-index: 2;
	padding: 45px;
}


#eTitle {
	font-family: Noto Sans KR;
	font-weight: bold;
	font-size: 70px;
	height: 80px;
	color:black;
	/* margin-top:5px; */
	margin-left:-2px; 
	letter-spacing:-1.5px
}

#eContent {
	font-size: 30px;
	font-weight: 300;
	width: 600px;
	color:black;
	margin-bottom:20px;
	letter-spacing:-1px;
	
}

.tbl{
	margin-top:10px;
}	

.lightBottom{
	width:1166px;
	margin:auto;
}

.btnInsert:hover{
	cursor:pointer;
}


</style>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp" />
	<div id=exBody>
		<div id=exCenter>
			<div id=eTitle>Feed</div>
			<div id=eContent>팔로우 중인 작가들의 소식입니다.</div>

			<div class=lTbl>
				<c:forEach items="${Flist}" var="fvo">
					<div class=ftbl>
						<img class=fimg style="height: 100%; object-fit: contain;" src="../display?fileName=${fvo.image}">
					</div>
					<div style="width: 1130px; margin: auto;">
						<span style="display: inline-block; float: left;"> <img
							style="border-radius: 50%;" width=90px height=90px
							src="../display?fileName=${fvo.u_image}" />
						</span> 
						<span style="display: inline-block; float: left; margin-left: 18px; margin-top: 18px;">
							<input type=hidden value="${fvo.id}" class=unFolTarget>
							<b style="font-size: 20px">${fvo.nickname}</b>&nbsp;&nbsp;
							<a style="all: unset; font-size: 14px; cursor: pointer;" class="unfollow">언팔로우</a><br>
							<b style="all: unset; color: #93a1a2; font-size: 15px;">${fvo.introduce}</b>
						</span><br>
						<br>
						<br>
						<br>
						<div style="display: inline-block; width: 825px;font-size:33px;margin-bottom:12px">${fvo.title}</div>
						<div style="display: inline-block; width: 100%;font-size:20px;">${fvo.content}</div>
					</div>
					<div class=lightBottom>
						<br>
						<div style="text-align: left; display: inline-block; float: left;">
							<form name="frm" method="post" action="update" enctype="multipart/form-data">
								<input type="button" value="신고하기" class="report"
									style="border: none; background: #2b4163; border-radius: 5px 5px 5px 5px;
									color: white; width: 75px; height: 28px; font-size: 15px;margin-left:25px;">
							</form>
						</div>

						<div
							style="text-align: right; display: inline-block; float: right;margin-right:25px;margin-bottom:30px;font-size:18px;">
							<img class=icons src="../display?fileName=views.png" />${fvo.view}&nbsp;
							<img class=icons id="LikeBtn" src="../display?fileName=likes.png" /> ${fvo.b_like}&nbsp;
							<img class=icons src="../display?fileName=comment.png" /> ${fvo.r_cnt}
						</div>

						<hr style="width: 1127px;border:solid 1px #b3c6e6;">
					</div>
					<br><br><br>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="scrollLocation"></div>
	<jsp:include page="../footer.jsp" />
</body>
<script>
	var id="${id}";
	var lastScrollTop=0;
	
	$(window).scroll(function(){
		var windowScrollTop=$(window).scrollTop();
		if(windowScrollTop - lastScrollTop > 0){
			if ($(window).scrollTop() >= ($(document).height() - $(window).height())){
				var lastr=$(".r:last").attr("data-r");
				id="${id}";
				$.ajax({
					type:"post",
					url:"/feed/infiniteScrollDown",
					headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST",
					},
					dataType:"json",
					data:JSON.stringify({
						id:id,
						r:lastr
					}),
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success:function(data){
						var str="";
						
						if(data!=""){
							$(data).each(function(){
									str +=		"<div style='width: 1130px; margin: auto;'>"
										+			"<span style='display: inline-block; float:left;'>"
										+				"<img style='border-radius:50%;' width=90px height=90px	src='../display?fileName='"+this.u_image+"'/>"
										+			"</span>"
										+			"<span style='display:inline-block; float:left; margin-left:18px; margin-top:18px;'>"
										+				"<input type='hidden' class='r' data-r='"+this.r+"' value='"+this.r+"'>"
										+				"<b style='font-size:20px'>"+this.nickname+"</b>&nbsp;&nbsp;"
										+				"<a style='all: unset; font-size: 14px; cursor: pointer;'>팔로우</a><br>"
										+				"<b style='all: unset; color: #93a1a2; font-size: 15px;'>"+this.introduce+"</b>"
										+			"</span><br><br><br><br>"
										+			"<div style='display: inline-block; width: 825px;font-size:33px;margin-bottom:12px'>"+this.title+"</div>"
										+			"<div style='display: inline-block; width: 100%;font-size:20px;'>"+this.content+"</div>"
										+		"</div>"
										+		"<div class=lightBottom><br>"
										+			"<div style='text-align: left; display: inline-block; float: left;'>"
										+				"<form name='frm' method='post' action='update' enctype='multipart/form-data'>"
										+					"<input type='button' value='신고하기' class='report' style='border: none; background: #2b4163; border-radius: 5px 5px 5px 5px; color: white; width: 75px; height: 28px; font-size: 15px;margin-left:25px;'>"
										+				"</form>"
										+			"</div>"
										+			"<div style='text-align: right; display: inline-block; float: right;margin-right:25px;margin-bottom:30px;font-size:18px;'>"
										+				"<img class=icons src='../display?fileName=views.png'/>"+this.view+"&nbsp;"
										+				"<img class=icons id='LikeBtn' src='../display?fileName=likes.png'/>"+this.b_like+"&nbsp;"
										+				"<img class=icons src='../display?fileName=comment.png'/>"+this.r_cnt+""
										+			"</div>"
										+			"<hr style='width: 1127px;border:solid 1px #b3c6e6;'>"
										+			"<div class='ftbl'>"
										+				"<img class=fimg style='height: 100%; object-fit: contain;' src='../display?fileName="+this.image+"'>"
										+			"</div>"
										+		"</div><br><br>"
							});
							$(".scrollLocation").append(str);
						}else{
							alert("더 불러올 데이터가 없습니다.");
						}
					}
				});
				$("html, body").stop().animate({scrollTop:lastScrollTop}, 0);
			}
			lastScrollTop=windowScrollTop;
		}
	});
	
	$(".unfollow").on("click",function(){
 		var target=$(this).parent().find(".unFolTarget").val();
 		var follower="${id}";
 		if(!confirm("팔로우를 취소하시겠습니까?")) return; 		
  		$.ajax({
 			type:"post",
 			url:"/user/followUpdate",
 			data:{"follower":follower,"target":target},
 			success:function(){
 				alert("취소되었습니다.");
 				location.reload();
 			}
 		});
 	});
	
</script>
</html>