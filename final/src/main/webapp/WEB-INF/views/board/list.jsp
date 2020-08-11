<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<style>
	html {
	font-family:Noto Sans KR;
}

   
body {
	width: 100%;
}

.slide {
	height: 270px;
}

#exTitle, #gTitle, #fTitle, #eTitle {
	letter-spacing: -3;
	font-family: Noto Sans KR;
	font-size: 87px;
	text-align: center;
	font-weight: bold;
	margin-top: 60px;
}

#exContent, #gContent, #fContent, #eContent {
	font-family: Noto Sans KR;
	text-align: center;
	font-weight: light;
	font-size: 30px;
	margin-top: 20px;
}

#keyword {
	text-align: center;
	margin-top: 50px;
	font-size: 20px
}

.more {
	font-family: Noto Sans KR;
	float: right;
	margin-right: 55px;
}

* {
	margin: 0;
	padding: 0;
	text-decoration: none
}

li {
	list-style: none
}

.gallery-wrapper {
	width: 100%;
	top: 100px;
	margin: 0 auto;
}

.gallery-wrapper .gallery-list {
	position: relative;
	width: 100%;
	height: 270px;
}

.gallery-wrapper .gallery-list li {
	position: absolute;
	left: 0;
	display: none
}

.gallery-wrapper .gallery-list li:first-child {
	display: block;
}

.gallery-wrapper .gallery-list li.active {
	display: block;
}

.gallery-wrapper .gallery-list li a {
	display: block;
	text-align: center
}

.gallery-wrapper .gallery-list li a img {
	display: block;
}

.gallery-wrapper .btn-prev, .gallery-wrapper .btn-next {
	position: absolute;
	top: 190px;
	font-size: 26px;
}

.gallery-wrapper .btn-prev {
	left: 20px;
}

.gallery-wrapper .btn-next {
	right: 20px;
}

.ctrl-box {
	position: relative;
	top: -30px;
	text-align: center;
	right: 12px;
}

.ctrl-box a {
	
}

.ctrl-box a .bullet {
	margin-left: 3px;
	margin-right: 3px;
	display: inline-block;
	width: 6px;
	height: 6px;
	border: 1px solid #cfd2d7;
	border-radius: 100%;
	background: #dfe2e7;
	text-indent: -9999em;
	font-size: 0;
	vertical-align: middle
}

.ctrl-box a.active .bullet {
	border: 1px solid #d43a3a;
	background: #fd4b4b;
}

.btn-ctrl {
	margin-left: 10px;
	padding: 0 4px;
	border: 1px solid #b6b6b6;
	border-radius: 4px;
	background-color: #dadada;
	line-height: 20px;
}

.slide {
	width: 1920px;
}

#eDiv {
	height: 710px;
}

 .imgDiv{
	
	margin-left:0;
} 

.imgContainer{
	margin-left:15px;
	width:350px;
	height:300px;
	display:inline-block;
	border-radius: 5px 5px 5px 5px;
	background: black;
}

.imgInfo{
	width:100%;
	text-align:left;
	padding-top:3px;
}


.imgContainer img{
	width:350px;
	height:300px;
	object-fit:cover;
	object-position:center;
	border-radius: 5px 5px 5px 5px;
}

.imgContainer img:hover {
    opacity: 0.3;
	cursor:pointer;
}
.imgContainer img:hover	+ .hoverInfo{
	display:block;
}


.hoverInfo{
	
	width:300px;
	height:110px;
	position:absolute;
	display:none;
	margin-top:-120px;
	margin-left:28px;
}

.hoverInfo1{	
	float:left;
	font-size:24px;
	color:white;
}

.hoverInfo2{
	float:left;
	color:white;	
}

	</style>
<meta charset="UTF-8">
<title>[작품]</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
</head>
<body style=padding-top:81px;>
	<jsp:include page="../menu.jsp"></jsp:include>
	<div id=explore>
		<div id=exTitle>Explore</div>
		<div id=exContent>최고의 작품들을 소개합니다.</div>
		<div id=keyword>최신순&emsp;&emsp;&nbsp;인기순&emsp;&emsp;&nbsp;조회순</div>
		<c:if test="${id!=null}">		
			<a href="/board/insert" class=more><img id=bButton src="/display?fileName=eButton.png" /></a> <br>
		</c:if>
   	</div><br><br>
	<div class="imgDiv" style="width:1855px;margin:auto;">
		<c:forEach items="${list}" var="vo">
			<div class="imgContainer">
				<img src="display?fileName=${vo.image}">
				<input type="hidden" class="b_no" data-bno="${vo.b_no}" value="${vo.b_no}">
				<div class="imgInfo">
					<img style="width:15px;height:15px;" src="display?fileName=views.png"/>
							<span>${vo.view}</span>&emsp;
					<img style="width:15px;height:15px;" src="display?fileName=comment.png"/>
							<span>${vo.r_cnt}</span>&emsp;		
					<img style="width:15px;height:15px;" src="display?fileName=likes.png"/>
							<span>${vo.b_like}</span>	
				</div>		
				<div class="hoverInfo">
					<div class="title">${vo.title}</div>
					<div class="content">${vo.content}</div>
				</div>
			</div>
		</c:forEach>
		<div class="scrollLocation"></div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>

	var lastScrollTop=0;


	$(window).scroll(function(){
		var windowScrollTop=$(window).scrollTop();
		if(windowScrollTop - lastScrollTop > 0){
			if ($(window).scrollTop() >= ($(document).height() - $(window).height())){
				var lastbno=$(".b_no:last").attr("data-bno");
				
				$.ajax({
					type:"post",
					url:"infiniteScrollDown",
					headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST",
					},
					dataType:"json",
					data:JSON.stringify({
						b_no:lastbno
					}),
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success:function(data){
						var str="";
						
						if(data!=""){
							$(data).each(function(){
								str += "<div class="+"'imgContainer'"+">"
									+		"<img src='display?fileName="+this.image+"'>"
									+		"<input type='hidden' class='b_no' data-bno='"+this.b_no+"' value='"+this.b_no+"'>"
									+		"<div class='imgInfo'>"
									+			"<img style='width:15px;height:15px;' src='display?fileName=views.png'>"
									+				"<span>"+this.view+"</span>"
									+			"<img style='width:15px;height:15px;' src='display?fileName=comment.png'>"
									+				"<span>"+this.r_cnt+"</span>"
									+			"<img style='width:15px;height:15px;' src='display?fileName=likes.png'>"
									+				"<span>"+this.b_like+"</span>"
									+		"</div>"
									+		"<div class='hoverInfo'>"
									+			"<div class='title' '"+this.title+"'></div>"
									+			"<div class='content' '"+this.content+"'></div>"
									+		"</div>"
									+	"</div>"
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

	$(".imgDiv").on("click",".imgContainer img", function() {
		var b_no = $(this).parent().find(".b_no").val();
		location.href = "read?b_no=" + b_no;
	});
</script>
</html>