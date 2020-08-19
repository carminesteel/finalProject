<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
		<style>
html {
	font-family: Noto Sans KR;
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
	font-size: 20px;
	margin-bottom: 10px;
}

.more {
	font-family: Noto Sans KR;
	float: right;
	text-align: center;
	margin-right: 55px;
	background: #2b4163;
	color: white;
	border: 1px solid black;
	border-radius: 20px 20px 20px 20px;
	width: 100px;
	height: 30px;
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

.imgDiv {
	margin-left: 0;
}

.imgContainer {
	margin-left: 15px;
	width: 350px;
	height: 300px;
	display: inline-block;
	border-radius: 5px 5px 5px 5px;
	background: black;
}

.imgInfo {
	width: 100%;
	text-align: left;
	padding-top: 3px;
}

.imgContainer img {
	width: 350px;
	height: 300px;
	object-fit: cover;
	object-position: center;
	border-radius: 5px 5px 5px 5px;
}

.imgContainer img:hover {
	opacity: 0.3;
	cursor: pointer;
}

.imgInfo:hover{
	pointer-events: none;
	opacity: 1;
}

.imgContainer img:hover+.hoverInfo {
	visibility:visible;
	pointer-events: none
}

.hoverInfo {
	width: 300px;
	height: 240px;
	position: absolute;
	visibility:hidden;
	margin-top: -270px;
	margin-left: 28px;
	overflow:hidden;
	text-overflow:ellipsis;
}

.hoverInfo1 {
	display:inline-block;
	float: left;
	font-size: 24px;
	color: white;
	height:30px;
}

.hoverInfo2 {
	display:inline-block;
	float: left;
	color: white;
	overflow:hidden;
	text-overflow:ellipsis;
}

#dialog {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
}

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

.lbClose:hover{
	cursor:pointer;
}


.MenuNew {
	text-decoration: none;
	color: black;
}

.MenuNew:hover {
	cursor: pointer;
	border-bottom: 2px solid black
}

.MenuBest {
	text-decoration: none;
	color: black;
}

.MenuBest:hover {
	cursor: pointer;
	border-bottom: 2px solid black
}

.MenuView {
	text-decoration: none;
	color: black;
}

.MenuView:hover {
	cursor: pointer;
	border-bottom: 2px solid black
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
		<div id=keyword>
			<a class="MenuNew" id="NewMenu">최신순</a>&emsp;&emsp;&emsp; 
			<a class="MenuBest" id="BestMenu">인기순</a>&emsp;&emsp;&emsp; 
			<a class="MenuView" id="ViewMenu">조회순</a>
		</div>
		<c:if test="${id!=null}">
			<a href="/product/insert" class=more id=bButton>작품 올리기</a> <br>
		</c:if>
   	</div><br>
	<div class="NewMenu" style="width:1855px;margin:auto;display:block;">
		<c:forEach items="${list}" var="vo">
			<div class="imgContainer">
				<input class="idxBno" type="hidden" value="${vo.b_no}"/>
				<input class="idxView" type="hidden" value="${vo.view}"/>
				<input type="hidden" class="r" data-r="${vo.r}" value="${vo.r}">
				<img class="idxBimg" src="display?fileName=${vo.image}"/>
				<div class="hoverInfo">
				<div class="hoverInfo1">${vo.title}</div><br><br><br>
				<div class="hoverInfo2">${vo.content}</div>
				</div>
				<div class="imgInfo">
						<img style="width:15px;height:15px;" src="display?fileName=views.png"/>
							<span>${vo.view}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=likes.png"/>
							<span>${vo.b_like}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=comment.png"/>
							<span>${vo.r_cnt}</span>
				</div>
				<br>
			</div>
		</c:forEach>
	</div>
 	<div class="scrollLocation" style="margin-left:19px;"></div>
	
 	<div class="BestMenu" style="width:1855px;margin:auto;display:none;">
		<c:forEach items="${listA}" var="Avo">
			<div class="imgContainer">
				<input class="idxBno" type="hidden" value="${Avo.b_no}"/>
				<input class="idxView" type="hidden" value="${Avo.view}"/>
				<input type="hidden" class="Ar" data-r="${Avo.r}" value="${Avo.r}">
				<img class="idxBimg" src="display?fileName=${Avo.image}"/>
				<div class="hoverInfo">
				<div class="hoverInfo1">${Avo.title}</div><br><br><br>
				<div class="hoverInfo2">${Avo.content}</div>
				</div>
				<div class="imgInfo">
						<img style="width:15px;height:15px;" src="display?fileName=views.png"/>
							<span>${Avo.view}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=likes.png"/>
							<span>${Avo.b_like}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=comment.png"/>
							<span>${Avo.r_cnt}</span>
				</div>
				<br>
			</div>		
		</c:forEach>
	</div>
 	<div class="AscrollLocation" style="margin-left:19px;"></div>
	
	<div class="ViewMenu" style="width:1855px;margin:auto;display:none;">
		<c:forEach items="${listB}" var="Zvo">
			<div class="imgContainer">
				<input class="idxBno" type="hidden" value="${Zvo.b_no}"/>
				<input class="idxView" type="hidden" value="${Zvo.view}"/>
				<input type="hidden" class="Br" data-r="${Zvo.r}" value="${Zvo.r}">
				<img class="idxBimg" src="display?fileName=${Zvo.image}"/>
				<div class="hoverInfo">
				<div class="hoverInfo1">${Zvo.title}</div><br><br><br>
				<div class="hoverInfo2">${Zvo.content}</div>
				</div>
				<div class="imgInfo">
						<img style="width:15px;height:15px;" src="display?fileName=views.png"/>
							<span>${Zvo.view}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=likes.png"/>
							<span>${Zvo.b_like}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=comment.png"/>
							<span>${Zvo.r_cnt}</span>
				</div>
				<br>
			</div>		
		</c:forEach>
	</div>
	<div class="BscrollLocation" style="margin-left:19px;"></div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<!-- The Modal -->
    <div id="myModal" class="modal"> 
    </div>
</body>
<script>
	var myDiv = document.getElementById('myModal');


	 	// Get the modal
		var modal = document.getElementById('myModal');
		
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

	var lastScrollTop=0;
	
	$("#NewMenu").on("click",function(){
		$(".BestMenu").css("display","none");
		$(".NewMenu").css("display","block");
		$(".ViewMenu").css("display","none");
		$(".scrollLocation").empty();
		$(".scrollLocation").show();
		$(".AscrollLocation").hide();
		$(".BscrollLocation").hide();
		lastScrollTop=0;

	});
		
	$("#BestMenu").on("click",function(){
		$(".BestMenu").css("display","block");
		$(".NewMenu").css("display","none");
		$(".ViewMenu").css("display","none");
		$(".AscrollLocation").empty();
		$(".AscrollLocation").show();
		$(".scrollLocation").hide();
		$(".BscrollLocation").hide();
		lastScrollTop=0;

	});
	
	$("#ViewMenu").on("click",function(){
		$(".BestMenu").css("display","none");
		$(".NewMenu").css("display","none");
		$(".ViewMenu").css("display","block");
		$(".BscrollLocation").empty();
		$(".BscrollLocation").show();
		$(".scrollLocation").hide();
		$(".AscrollLocation").hide();
		lastScrollTop=0;

	});
	
	$(".BestMenu").on("click",".imgContainer .idxBimg", function() {
		var b_no = $(this).parent().find(".idxBno").val();
		var view = $(this).parent().find(".idxView").val();
		$("#myModal").load("../board/read?b_no="+b_no+"&view="+view);  
		$('html').css("overflow", "hidden");        	
		$('.modal').css("overflow", "scroll");
		$('html').css("overflow-x", "hidden");
		$('.modal').css("overflow-x", "hidden");
	    modal.style.display = "block";
	    myDiv.scrollTop = 0;
	});
	$(".ViewMenu").on("click",".imgContainer img", function() {
		var b_no = $(this).parent().find(".idxBno").val();		
		var view = $(this).parent().find(".idxView").val();
		$("#myModal").load("../board/read?b_no="+b_no+"&view="+view);  
		$('html').css("overflow", "hidden");        	
		$('.modal').css("overflow", "scroll");
		$('html').css("overflow-x", "hidden");
		$('.modal').css("overflow-x", "hidden");
	    modal.style.display = "block";
	    myDiv.scrollTop = 0;
	});
	$(".NewMenu").on("click",".imgContainer img", function() {
		var b_no = $(this).parent().find(".idxBno").val();
		var view = $(this).parent().find(".idxView").val();
		$("#myModal").load("../board/read?b_no="+b_no+"&view="+view);  
		$('html').css("overflow", "hidden");        	
		$('.modal').css("overflow", "scroll");
		$('html').css("overflow-x", "hidden");
		$('.modal').css("overflow-x", "hidden");
	    modal.style.display = "block";
	    myDiv.scrollTop = 0;
	});

	$(window).scroll(function(){
		var windowScrollTop=$(window).scrollTop();
		if(windowScrollTop - lastScrollTop > 0){
			if ($(window).scrollTop() >= ($(document).height() - $(window).height())){
				if($('.NewMenu').is(":visible")){
					var lastr=$(".r:last").attr("data-r");
					$.ajax({
						type:"post",
						url:"infiniteScrollDown",
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST",
						},
						dataType:"json",
						data:JSON.stringify({
							r:lastr
						}),
						error:function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						},
						success:function(data){
							var str="";
							
							if(data!=""){
								$(data).each(function(){
									str += "<div class='imgContainer' style='margin-left:19px;'>"
										+		"<input class='idxBno' type='hidden' value='"+this.b_no+"'/>"
										+		"<input class='idxView' type='hidden' value='"+this.view+"'/>"
										+		"<input type='hidden' class='r' data-r='"+this.r+"' value='"+this.r+"'>"
										+		"<img class='idxBimg' src='display?fileName="+this.image+"'/>"
										+		"<div class='hoverInfo'>"
										+			"<div class='hoverInfo1'>"+this.title+"</div><br><br><br>"
										+			"<div class='hoverInfo2'>"+this.content+"</div>"
										+		"</div>"
										+		"<div class='imgInfo'>"
										+			"<img style='width:15px;height:15px;' src='display?fileName=views.png'/>"
										+				"<span>"+this.view+"</span>&emsp;"
										+			"<img style='width:15px;height:15px;' src='display?fileName=likes.png'/>"
										+				"<span>"+this.b_like+"</span>&emsp;"
										+			"<img style='width:15px;height:15px;' src='display?fileName=comment.png'/>"
										+				"<span>"+this.r_cnt+"</span>&emsp;"
										+		"</div>"
										+		"<br>"
										+	"</div>"
										
								});
								$(".scrollLocation").append(str);
			 					$(".BestMenu").css("display","none");
								$(".NewMenu").css("display","block");
								$(".ViewMenu").css("display","none");
							}else{
								alert("더 불러올 데이터가 없습니다.");
							}
						}
					});
					$("html, body").stop().animate({scrollTop:lastScrollTop}, 0);
				} else if($(".BestMenu").is(":visible")){
 					$(".BestMenu").css("display","block");
					$(".NewMenu").css("display","none");
					$(".ViewMenu").css("display","none");
					var lastr=$(".Ar:last").attr("data-r");
					 $.ajax({
						type:"post",
						url:"AinfiniteScrollDown",
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST",
						},
						dataType:"json",
						data:JSON.stringify({
							r:lastr
						}),
						error:function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						},
						success:function(data){
							var str="";
							
							if(data!=""){
								$(data).each(function(){
									str += "<div class='imgContainer' style='margin-left:19px;'>"
										+		"<input class='idxBno' type='hidden' value='"+this.b_no+"'/>"
										+		"<input class='idxView' type='hidden' value='"+this.view+"'/>"
										+		"<input type='hidden' class='Ar' data-r='"+this.r+"' value='"+this.r+"'>"
										+		"<img class='idxBimg' src='display?fileName="+this.image+"'/>"
										+		"<div class='hoverInfo'>"
										+			"<div class='hoverInfo1'>"+this.title+"</div><br><br><br>"
										+			"<div class='hoverInfo2'>"+this.content+"</div>"
										+		"</div>"
										+		"<div class='imgInfo'>"
										+			"<img style='width:15px;height:15px;' src='display?fileName=views.png'/>"
										+				"<span>"+this.view+"</span>&emsp;"
										+			"<img style='width:15px;height:15px;' src='display?fileName=likes.png'/>"
										+				"<span>"+this.b_like+"</span>&emsp;"
										+			"<img style='width:15px;height:15px;' src='display?fileName=comment.png'/>"
										+				"<span>"+this.r_cnt+"</span>&emsp;"
										+		"</div>"
										+		"<br>"
										+	"</div>"
								});
								$(".AscrollLocation").append(str);
							}else{
								alert("더 불러올 데이터가 없습니다.");
							}
						}
					});
					 $("html, body").stop().animate({scrollTop:lastScrollTop}, 0);
				}else if($('.ViewMenu').is(":visible")){
					$(".BestMenu").css("display","none");
					$(".NewMenu").css("display","none");
					$(".ViewMenu").css("display","block");
					var lastr=$(".Br:last").attr("data-r");
					$.ajax({
						type:"post",
						url:"BinfiniteScrollDown",
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST",
						},
						dataType:"json",
						data:JSON.stringify({
							r:lastr
						}),
						error:function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						},
						success:function(data){
							var str="";
							
							if(data!=""){
								$(data).each(function(){
									str += "<div class='imgContainer' style='margin-left:19px;'>"
										+		"<input class='idxBno' type='hidden' value='"+this.b_no+"'/>"
										+		"<input class='idxView' type='hidden' value='"+this.view+"'/>"
										+		"<input type='hidden' class='Br' data-r='"+this.r+"' value='"+this.r+"'>"
										+		"<img class='idxBimg' src='display?fileName="+this.image+"'/>"
										+		"<div class='hoverInfo'>"
										+			"<div class='hoverInfo1'>"+this.title+"</div><br><br><br>"
										+			"<div class='hoverInfo2'>"+this.content+"</div>"
										+		"</div>"
										+		"<div class='imgInfo'>"
										+			"<img style='width:15px;height:15px;' src='display?fileName=views.png'/>"
										+				"<span>"+this.view+"</span>&emsp;"
										+			"<img style='width:15px;height:15px;' src='display?fileName=likes.png'/>"
										+				"<span>"+this.b_like+"</span>&emsp;"
										+			"<img style='width:15px;height:15px;' src='display?fileName=comment.png'/>"
										+				"<span>"+this.r_cnt+"</span>&emsp;"
										+		"</div>"
										+		"<br>"
										+	"</div>"
								});
								$(".BscrollLocation").append(str);
							}else{
								alert("더 불러올 데이터가 있을텐데????????????????있는데????????.");
							}
						}
					});
					$("html, body").stop().animate({scrollTop:lastScrollTop}, 0);
				}
			}
			lastScrollTop=windowScrollTop;
		}
	});

	$(".scrollLocation").on("click",".imgContainer img", function() {
		var b_no=$(this).parent().find(".idxBno").val();
		var view = $(this).parent().find(".idxView").val();
		$("#myModal").load("../board/read?b_no="+b_no+"&view="+view);
		$('html').css("overflow", "hidden");        	
		$('.modal').css("overflow", "scroll");
		$('html').css("overflow-x", "hidden");
		$('.modal').css("overflow-x", "hidden");
	    modal.style.display = "block";
	    myDiv.scrollTop = 0;
	});
	
	$(".AscrollLocation").on("click",".imgContainer img", function() {
		var b_no=$(this).parent().find(".idxBno").val();
		var view = $(this).parent().find(".idxView").val();
		$("#myModal").load("../board/read?b_no="+b_no+"&view="+view); 
		$('html').css("overflow", "hidden");        	
		$('.modal').css("overflow", "scroll");
		$('html').css("overflow-x", "hidden");
		$('.modal').css("overflow-x", "hidden");
	    modal.style.display = "block";
	    myDiv.scrollTop = 0;
	});
	
	$(".BscrollLocation").on("click",".imgContainer img", function() {
		var b_no=$(this).parent().find(".idxBno").val();
		var view = $(this).parent().find(".idxView").val();
		$("#myModal").load("../board/read?b_no="+b_no+"&view="+view); 
		$('html').css("overflow", "hidden");
		$('.modal').css("overflow", "scroll");
		$('html').css("overflow-x", "hidden");
		$('.modal').css("overflow-x", "hidden");
	    modal.style.display = "block";
	    myDiv.scrollTop = 0;
	});
</script>
</html>