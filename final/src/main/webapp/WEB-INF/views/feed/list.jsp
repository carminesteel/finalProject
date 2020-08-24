<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<title>Feed List</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
/*       /* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: absolute; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	 /* Full width */
	 /* Full height */
	/* overflow: auto; */ /* Enable scroll if needed */
	height:auto;
	overflow : scroll;
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.9);

}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
.ftbl{
	width:1166px;height:714px; margin:auto;text-align:center;border:1px solid #eeeeee;margin-bottom:27px
}

.icons{
	width:17px;height:17px;
}

html {
	font-family: Noto Sans KR
}

#exBody {
	background-color: #e9ecef;
	z-index: 1;
	
}

#exCenter {
	background-color: white;
	width: 1276px;
	margin: auto;
	z-index: 2;
}


#eTitle {
	font-family: Noto Sans KR;
	font-weight: bold;
	font-size: 70px;
	height: 80px;
	color:black;
	/* margin-top:5px; */
	margin-left:-2px; 
	letter-spacing:-1.5px;
	margin-left:45px;
}

#eContent {
	font-size: 30px;
	font-weight: 300;
	width: 600px;
	color:black;
	margin-bottom:20px;
	letter-spacing:-1px;
	margin-left:45px;
}

.tbl{
	margin-top:10px;
}	

.lightBottom{
	width:1166px;
	height:35px;
	padding-top:10px;
	margin:auto;
}

.btnInsert:hover{
	cursor:pointer;
}

.lbClose:hover{
	cursor:pointer;
}


</style>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp" />
	<div id=exBody>
		<div id=exCenter>
			<div id=eTitle>Feed</div>
			<c:if test="${cnt == 0 or empty Flist}">
				<c:if test="${not empty Flist}">
				<div id=eContent>팔로우 중인 작가들의 소식입니다.</div>
				</c:if>
	  			<div style="text-align: center;
							width: 800px;
							height: 600px;
							float: center;
							margin: auto;
							margin-top:100px;">
					<img style="float: center;margin:auto;"
						src="../display?fileName=noFeed.png" /><br>
				</div>
		</c:if>
		<c:if test="${cnt != 0 }">
			<div class=lTbl style="margin-top:100px;">
			
				<c:forEach items="${Flist}" var="fvo">
					<div class=ftbl>
						<input type="hidden" value="${fvo.b_no}" class="b_no">
						<input class="idxView" type="hidden" value="${fvo.view}"/>
						<img class=fimg style="height: 100%;max-width:100%; object-fit: contain;" src="../display?fileName=${fvo.image}">
					</div>
					<div style="width: 1130px; margin: auto;">
						<span style="display: inline-block; float: left;"> <img
							style="border-radius: 50%;" width=90px height=90px
							src="../display?fileName=${fvo.u_image}" />
						</span> 
						<span style="display: inline-block; float: left; margin-left: 18px; margin-top: 18px;">
							<input type="hidden" value="${fvo.id}" class=unFolTarget>
							<input type="hidden" class='r' data-r="${fvo.r}" value="${fvo.r}">
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
						<div style="text-align: left; display: inline-block; float: left;">
							<form name="frm" method="post" action="update" enctype="multipart/form-data">
								<input type="button" value="신고하기" class="report"
									style="border: none; background: #2b4163; border-radius: 5px 5px 5px 5px;
									color: white; width: 75px; height: 28px; font-size: 15px;margin-left:25px;">
							</form>
						</div>

						<div
							style="text-align: right; display: inline-block; float: right;margin-right:25px;margin-bottom:30px;font-size:18px;">
							<input type="hidden" value="${fvo.b_no}" class="b_no">
							<img class=icons src="../display?fileName=views.png" />${fvo.view}&nbsp;
							<img class=icons id="LikeBtn" src="../display?fileName=likes.png" /> ${fvo.b_like}&nbsp;
							<img class=icons src="../display?fileName=comment.png" /> ${fvo.r_cnt}
						</div>
					</div>
					<br><br>			
				</c:forEach>
			</div>
			</c:if>
			<div class="scrollLocation"></div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
	<div id="myModal" class="modal"></div>
</body>
<script>
	var id="${id}";
	var lastScrollTop=0;
	var myDiv = document.getElementById('myModal');

	$("#exCenter").on("click", ".lightBottom #LikeBtn", function(){
		var b_no=$(this).parent().find(".b_no").val();
		$.ajax({
			type:"post",
			url:"/board/like/update",
			data:{"id":id,"b_no":b_no},
			dataType:"json",
			success:function(data){
			$("#LikeBtn").val("좋아요/"+data);
				location.reload();
			}
		});
	});

	$(".scrollLocation").on("click", ".lightBottom #LikeBtn", function(){
		var b_no=$(this).parent().find(".b_no").val();
		$.ajax({
			type:"post",
			url:"/board/like/update",
			data:{"id":id,"b_no":b_no},
			dataType:"json",
			success:function(data){
			$("#LikeBtn").val("좋아요/"+data);
				location.reload();
			}
		});
	});

 	// Get the modal
	var modal = document.getElementById('myModal');
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
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
										+			"<div class='ftbl'>"
										+				"<input type='hidden' value='"+this.b_no+"' class='b_no'>"
										+				"<input class='idxView' type='hidden' value='"+this.view+"'/>"
										+				"<img class=fimg style='height: 100%; object-fit: contain;' src='../display?fileName="+this.image+"'>"
										+			"</div>"
										+			"<span style='display: inline-block; float:left;'>"
										+				"<img style='border-radius:50%;' width=90px height=90px	src='../display?fileName="+this.u_image+"'/>"
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
										+		"<div class=lightBottom>"
										+			"<div style='text-align: left; display: inline-block; float: left;'>"
										+				"<form name='frm' method='post' action='update' enctype='multipart/form-data'>"
										+					"<input type='button' value='신고하기' class='report' style='border: none; background: #2b4163; border-radius: 5px 5px 5px 5px; color: white; width: 75px; height: 28px; font-size: 15px;margin-left:25px;'>"
										+				"</form>"
										+			"</div>"
										+			"<div style='text-align: right; display: inline-block; float: right;margin-right:25px;margin-bottom:30px;font-size:18px;'>"
										+				"<input type='hidden' value='"+this.b_no+"' class='b_no'>"
										+				"<img class=icons src='../display?fileName=views.png'/>"+this.view+"&nbsp;"
										+				"<img class=icons id='LikeBtn' src='../display?fileName=likes.png'/>"+this.b_like+"&nbsp;"
										+				"<img class=icons src='../display?fileName=comment.png'/>"+this.r_cnt+""
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

	$("#exCenter").on("click",".lTbl .ftbl .fimg", function() {
		var b_no=$(this).parent().find(".b_no").val();
		var view = $(this).parent().find(".idxView").val();
		$("#myModal").load("../board/read?b_no="+b_no+"&view="+view);
		$('html').css("overflow", "hidden");        	
		$('.modal').css("overflow", "scroll");
	    modal.style.display = "block";
	    myDiv.scrollTop = 0;
	});

	$(".scrollLocation").on("click",".ftbl .fimg", function() {
		var b_no=$(this).parent().find(".b_no").val();
		var view = $(this).parent().find(".idxView").val();
		$("#myModal").load("../board/read?b_no="+b_no+"&view="+view);
		$('html').css("overflow", "hidden");        	
		$('.modal').css("overflow", "scroll");
	    modal.style.display = "block";
	    myDiv.scrollTop = 0;
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

	$(".report").on("click", function(){
		var b_no=$(this).parent().find(".b_no").val();
		window.open("/board/report?b_no="+b_no,"","width=600px, height=800px");
	});
</script>
</html>