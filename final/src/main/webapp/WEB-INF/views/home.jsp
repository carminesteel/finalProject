<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
   <title>index</title>
   <style>
html {
	font-family: Noto Sans KR;
}

#lightBox {
	position: absolute;
	width: 100%;
	height: 100%;
}

body {
	width: 100%;
	overflow-x:hidden;
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

.imgDiv {
	margin-left: 0;
}
.MenuNew{margin-left:0;}
.MenuBest{margin-left:0;} 
.MenuView{margin-left:0;} 

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

.latest:hover, .trending:hover, .views:hover {
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

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

</head>
<body style=padding-top:81px;>
   <jsp:include page="chat.jsp"/>
   <jsp:include page="menu.jsp"/>
   
   <div id=banner class="gallery-wrapper">
      <ul class="gallery-list">
      <li><a href="#none"><img class=slide src="/display?fileName=classicblue.png"alt="" /></a></li>
      <li><a href="#none"><img class=slide src="/display?fileName=recolor.png" alt="" /></a></li>
      <li><a href="#none"><img class=slide src="/display?fileName=gradients.png" alt="" /></a></li>
      <li><a href="#none"><img class=slide src="/display?fileName=pantone.png" alt="" /></a></li>
      <li><a href="#none"><img class=slide src="/display?fileName=glowing.png" alt="" /></a></li>
   </ul>
   <a class="btn-prev" href="#none"><img src="/display?fileName=arrowLeft.png"/></a>
   <a class="btn-next" href="#none"><img src="/display?fileName=arrowRight.png"/></a>
   
      <div class="ctrl-box">
            <a href="#none" class="active"><i class="bullet">1</i></a>
            <a href="#none"><i class="bullet">2</i></a>
            <a href="#none"><i class="bullet">3</i></a>
            <a href="#none"><i class="bullet">4</i></a>
            <a href="#none"><i class="bullet">5</i></a>
      </div>      
   </div>
   
   <div id=explore>
      <div id=exTitle>Explore</div>
      <div id=exContent>최고의 작품들을 소개합니다.</div>
      <div id=keyword>
		<a class="MenuNew" id="NewMenu">최신순</a>&emsp;&emsp;&emsp; 
		<a class="MenuBest" id="BestMenu">인기순</a>&emsp;&emsp;&emsp; 
		<a class="MenuView" id="ViewMenu">조회순</a>
	  </div>
      <a href="/board/list" class=more><img src="/display?fileName=more.png"/></a>
   </div><br><br>
   <div class="NewMenu" style="width:1855px;height:666px;margin:auto;">
		<c:forEach items="${list}" var="list" begin="0" end="9">
			<div class="imgContainer">
				<input class="idxBno" type="hidden" value="${list.b_no}"/>
				<img class="idxBimg" src="display?fileName=${list.image}"/>
				<div class="hoverInfo">
				<div class="hoverInfo1">${list.title}</div><br><br><br>
				<div class="hoverInfo2">${list.content}</div>
				</div>
				<div class="imgInfo">
					<span><img style="width:18px;height:18px;border-radius:10px 10px 10px 10px" src="display?fileName=${list.u_image}"/> 
								  ${list.nickname}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=views.png"/>
							<span>${list.view}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=likes.png"/>
							<span>${list.b_like}</span>
				</div>
				<br>
			</div>			
		</c:forEach>
	</div>
	<div class="BestMenu" style="width:1855px;height:666px;margin:auto;">
		<c:forEach items="${listA}" var="list" begin="0" end="9">
			<div class="imgContainer">
				<input class="idxBno" type="hidden" value="${list.b_no}"/>
				<img class="idxBimg" src="display?fileName=${list.image}"/>
				<div class="hoverInfo">
				<div class="hoverInfo1">${list.title}</div><br><br><br>
				<div class="hoverInfo2">${list.content}</div>
				</div>
				<div class="imgInfo">
					<span><img style="width:18px;height:18px;border-radius:10px 10px 10px 10px" src="display?fileName=${list.u_image}"/> 
								  ${list.nickname}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=views.png"/>
							<span>${list.view}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=likes.png"/>
							<span>${list.b_like}</span>
				</div>
				<br>
			</div>			
		</c:forEach>
	</div>
	<div class="ViewMenu" style="width:1855px;height:666px;margin:auto;">
		<c:forEach items="${listB}" var="list" begin="0" end="9">
			<div class="imgContainer">
				<input class="idxBno" type="hidden" value="${list.b_no}"/>
				<img class="idxBimg" src="display?fileName=${list.image}"/>
				<div class="hoverInfo">
				<div class="hoverInfo1">${list.title}</div><br><br><br>
				<div class="hoverInfo2">${list.content}</div>
				</div>
				<div class="imgInfo">
					<span><img style="width:18px;height:18px;border-radius:10px 10px 10px 10px" src="display?fileName=${list.u_image}"/> 
								  ${list.nickname}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=views.png"/>
							<span>${list.view}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=likes.png"/>
							<span>${list.b_like}</span>
				</div>
				<br>
			</div>			
		</c:forEach>
	</div>
   
   <div id=goods>
      <div id=gTitle>Goods</div>
      <div id=gContent>현재 제일 잘 나가는 굿즈에요.</div>
      <a href="" class=more><img src="/display?fileName=more.png"/></a>
   </div><br><br>
   <div class="imgDiv" style="width:1855px;height:666px;margin:auto;">
		<c:forEach items="${plist}" var="plist" begin="0" end="9">
			<div class="imgContainer">
				<img class="idxpimg" src="display?fileName=${plist.image}"/>							
				<div class="hoverInfo">
				<input type="hidden" class=p_no value="${plist.p_no}">
				<input type="hidden" class=id value="${plist.id}">
				<div class="hoverInfo1">${plist.title}</div><br><br><br>
				<div class="hoverInfo2">${plist.price}원</div>
				</div>
				<div class="imgInfo">
					<span><%-- <img style="width:18px;height:18px;border-radius:10px 10px 10px 10px" src="display?fileName=${plist.u_image}"/> --%> 
								  ${plist.id}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=views.png"/>
							<span>${plist.view}</span>&emsp;
						<img style="width:15px;height:15px;" src="display?fileName=likes.png"/>
							<span>${plist.p_like}</span>
				</div>
				<br>
			</div>
			
		</c:forEach>
	</div>
   
   <div id=feed>
      <div id=fTitle>Feed</div>
      <div id=fContent>팔로우한 작가들의 최신 아트웍이에요.</div>
      <a href="" class=more><img src="/display?fileName=more.png"/></a>
   </div><br><br>
   <div class="imgDiv" style="width:1855px;height:666px;margin:auto;">
		<c:forEach items="${flist}" var="flist" begin="0" end="9">
			<div class="imgContainer">
				<input class="fdBno" type="hidden" value="${flist.b_no}"/>
				<img class="idxFimg" src="display?fileName=${flist.image}"/>
				<div class="hoverInfo">
				<div class="hoverInfo1">${flist.title}</div><br><br><br>
				<div class="hoverInfo2">${flist.content}</div>
				</div>
				<div class="imgInfo">
					<span><img style="width:18px;height:18px;border-radius:10px 10px 10px 10px" src="/display?fileName=${flist.u_image}"/> 
					
								  ${flist.nickname}</span>&emsp;
						<img style="width:15px;height:15px;" src="/display?fileName=views.png"/>
							<span>${flist.view}</span>&emsp;
						<img style="width:15px;height:15px;" src="/display?fileName=likes.png"/>
							<span>${flist.b_like}</span>
				</div>
				<br>
			</div>
			
		</c:forEach>
	</div>
   
   <div id=exhibition>
      <div id=eTitle>Exhibition</div>
      <div id=eContent>다가오는 전시를 확인하세요.</div>
      <a href="/exh/list" class=more><img src="/display?fileName=more.png"/></a>
   </div><br><br>
	<jsp:include page="test.jsp"/>
	<br><br>
	<jsp:include page="footer.jsp"/>
	
	
	
	<%-- <div id=lightBox>
		<div id=lightInfo>
			<img id="image" src="display?fileName=${vo.u_image}"/>
			<div id=artInfo>
				<b name=title>${vo.title}</b>
				<br>
				${vo.nickname}
			</div>
		</div>
		<div id=lightContent>
		<input type="hidden" name="image" value="${ vo.image }">
			<img src="display?fileName=${vo.image}"width="100%"/>
			<br><br><br><br>
			<c:forEach items="${list}" var="image">
				<img src="display?fileName=${image}" name="files" width="100%"/>
				<br><br><br><br>
			</c:forEach>
 			<div id=lightBottom>
				<div style="height:100px;width:100%">
					<span style="display:inline-block;float:left;">
						<img style="border-radius:50%;" width=90px height=90px src="display?fileName=${vo.u_image}"/>
					</span>
					<span style="display:inline-block;float:left;margin-left:18px;margin-top:18px;">
						<b style="font-size:20px">${vo.nickname}</b>&nbsp;&nbsp;<a style="all:unset;font-size:14px;cursor:pointer;">팔로우</a><br>
						<b style="all:unset;color:#93a1a2;font-size:15px">${vo.introduce}</b>
					</span>
				</div>
				<div>
					<b style="font-size:30px;">${vo.title}</b>
					<br>
					<b style="all:unset;font-size:20px;">${vo.content}</b>
					<br>
					<div style="display:inline-block;float:right;"></div>
				</div>
				<br>
				<div style=text-align:left;display:inline-block;float:left;>
				<form name="frm" method="post" action="update" enctype="multipart/form-data">
				
					<input type="hidden" name="b_no" value="${vo.b_no}">
					<input type="hidden" name="id" value="${vo.id}">
					<input type="hidden" name="image" value="${vo.image}">
					<c:if test="${id==vo.id}">
						<!-- <input style="border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;width:55px;height:28px;font-size:15px;" type="submit" value="수정"> -->		
						<input style="border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;width:55px;height:28px;font-size:15px;" type="button" value="삭제" id="btnDelete">
					</c:if>
					<input type="button" value="신고하기" id="report" style="border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;width:75px;height:28px;font-size:15px;">
				</form>
				</div> --%>
				
				
				<%-- <div style=text-align:right;display:inline-block;float:right;>
					<img class=icons src="display?fileName=views.png"/> ${vo.view}&nbsp;
					<img class=icons id="LikeBtn" src="display?fileName=likes.png"/> ${vo.b_like}&nbsp;
					<img class=icons src="display?fileName=comment.png"/> ${vo.r_cnt}										
				</div>
				<jsp:include page="b_reply/list.jsp"></jsp:include> 
			</div>
		</div>	
	</div> --%>

    <!-- The Modal -->
    <div id="myModal" class="modal"> 
    </div>
    
    

</body>
<script>
	var b_no;
/* 	$(".idxBimg").on("click", function(){
		b_no=$(this).parent().find(".idxBno").val();
		alert(b_no);
		$("#dialog").load("/board/read?b_no="+b_no);
	}) */
	
	//게시물 순서 
	$(".BestMenu").hide();
	$(".ViewMenu").hide();
	
	$("#BestMenu").on("click",function(){
		$(".NewMenu").hide();
		$(".BestMenu").show();
		$(".ViewMenu").hide();
	});
	
	$("#ViewMenu").on("click",function(){
		$(".NewMenu").hide();
		$(".BestMenu").hide();
		$(".ViewMenu").show();
	});
	
	$("#NewMenu").on("click",function(){
		$(".NewMenu").show();
		$(".BestMenu").hide();
		$(".ViewMenu").hide();
	});
	
	    // Get the modal
        var modal = document.getElementById('myModal');
 
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];                                          
 
        // When the user clicks on the button, open the modal 
        $(".idxBimg").on("click", function(){
        	b_no=$(this).parent().find(".idxBno").val();
        	alert(b_no);
        	$("#myModal").load("../board/read?b_no="+b_no)
        	$('html').css("overflow", "hidden");        	
        	$('.modal').css("overflow", "scroll");
        	$('html').css("overflow-x", "hidden");
        	$('.modal').css("overflow-x", "hidden");
            modal.style.display = "block";
        })
        
        $(".idxFimg").on("click", function(){
        	b_no=$(this).parent().find(".fdBno").val();
        	alert(b_no);
        	$("#myModal").load("../board/read?b_no="+b_no)
        	$('html').css("overflow", "hidden");        	
        	$('.modal').css("overflow", "scroll");
        	$('html').css("overflow-x", "hidden");
        	$('.modal').css("overflow-x", "hidden");
            modal.style.display = "block";
        })

		
         // Get the modal
        var modal = document.getElementById('myModal');
 
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];                                          
 
        // When the user clicks on the button, open the modal 
        $(".idxBimg").on("click", function(){
        	b_no=$(this).parent().find(".idxBno").val();
        	$("#myModal").load("../board/read?b_no="+b_no)
        	$('html').css("overflow", "hidden");        	
        	$('.modal').css("overflow", "scroll");
        	$('html').css("overflow-x", "hidden");
        	$('.modal').css("overflow-x", "hidden");
            modal.style.display = "block";
        })
 	
         $(".idxBimg").on("click", function(){
        	b_no=$(this).parent().find(".idxBno").val();
        	$("#myModal").load("../board/read?b_no="+b_no)
        	$('html').css("overflow", "hidden");        	
        	$('.modal').css("overflow", "scroll");
        	$('html').css("overflow-x", "hidden");
        	$('.modal').css("overflow-x", "hidden");
            modal.style.display = "block";
        })
        
        
        
        
        
        
	$("#btnReply").hide();

	var id = "${id}";
	var b_no = "${vo.b_no}";

	$("#report").on(
			"click",
			function() {
				var b_no = "${vo.b_no}";
				window.open("/board/report?b_no=" + b_no, "",
						"width=500px, height=400px");
			});

	$("#LikeBtn").on("click", function() {
		$.ajax({
			type : "post",
			url : "/board/like/update",
			data : {
				"id" : id,
				"b_no" : b_no
			},
			dataType : "json",
			success : function(data) {
				$("#LikeBtn").val("좋아요/" + data);
				location.reload()
			}
		})
	})

	/* 홈 첫부분 슬라이드 구현 */
	var JUI = JUI || {};

	!function(param) {
		var global = param.g, $ = param.jQ;

		JUI.slider = function(selector, options) {

			var container = $(selector), detect = {}, config = {
				speed : 400,
				isSelected : 'active',
				autoPlay : true,
				duration : 2500
			};

			if (!container.length) {
				return;
			}

			$.extend(config, options);

			function setting() {

				detect.$listBox = container.find('.gallery-list');
				detect.$lists = detect.$listBox.children('li');
				detect.width = detect.$listBox.width();
				detect.$indicate = container.find('.ctrl-box a');
				detect.view = '.gallery-list';
				detect.indicate = '.ctrl-box a';
				detect.prev = '.btn-prev';
				detect.next = '.btn-next';
				detect.ctrl = '.btn-ctrl';
				detect.max = detect.$indicate.length - 1;
				detect.min = 0;
				detect.currentIndex = 0;
				detect.selectedIndex = null;
				detect.intervalId = null;

			}
			setting();

			function next(evt) {

				if (evt.type === 'mouseenter') {
					clearInterval(detect.intervalId);
					return false;
				}

				detect.selectedIndex = detect.currentIndex + 1;
				if (detect.selectedIndex > detect.max) {
					detect.selectedIndex = 0;
				}

				toMove(detect.selectedIndex, detect.width);

			}

			function prev(evt) {

				if (evt.type === 'mouseenter') {
					clearInterval(detect.intervalId);
					return false;
				}

				detect.selectedIndex = detect.currentIndex - 1;
				if (detect.selectedIndex < detect.min) {
					detect.selectedIndex = detect.max;
				}
				toMove(detect.selectedIndex, -detect.width);
			}

			function direction(selectedIndex) {
				return detect.currentIndex < selectedIndex ? 'goToRight'
						: 'goToLeft';
			}

			function toMove(selectedIndex, offset) {

				if (detect.selectedIndex == detect.currentIndex)
					return;
				if (detect.$lists.is(':animated'))
					return;

				detect.$lists.eq(selectedIndex).css({
					'left' : offset
				}).addClass(config.isSelected);
				detect.$lists.eq(selectedIndex).animate({
					'left' : 0
				}, config.speed);

				detect.$indicate.eq(detect.currentIndex).removeClass(
						config.isSelected);
				detect.$indicate.eq(selectedIndex).addClass(config.isSelected);

				detect.$lists.eq(detect.currentIndex).animate({
					'left' : -offset
				}, config.speed, function() {
					afterMoving(selectedIndex);
				});
			}

			function afterMoving(selectedIndex) {
				detect.$lists.eq(detect.currentIndex).removeClass(
						config.isSelected);
				detect.currentIndex = selectedIndex;
			}

			$(document).on('click.slide.indicate', detect.indicate, function() {
				detect.selectedIndex = $(this).index();
				var position = direction(detect.selectedIndex), offset = null;

				switch (position) {
				case 'goToRight':
					offset = detect.width;
					break;
				case 'goToLeft':
					offset = -detect.width;
				}
				toMove(detect.selectedIndex, offset);
			}).on('click.slide.next, mouseenter', detect.next, next).on(
					'click.slide.prev, mouseenter', detect.prev, prev).on(
					'click.slide.ctrl', detect.ctrl, controller);

			function startInterval() {
				detect.intervalId = setInterval(autoMoving, config.duration);
			}

			function autoMoving() {
				$(detect.next).trigger('click');
			}

			config.autoPlay ? startInterval() : controlState();

			function controller() {
				var $target = $(this);
				if ($target.is('.auto')) {
					clearInterval(detect.intervalId);
					$target.removeClass('auto').text('재생');
				} else {
					$target.addClass('auto').text('정지');
					startInterval();
				}
			}

			function controlState() {
				$(detect.ctrl).removeClass('auto').text('재생')
			}

			$(detect.view + "," + detect.indicate).on({
				'mouseenter' : function() {
					clearInterval(detect.intervalId);
				},
				'mouseleave' : function() {
					if (!$(detect.ctrl).is('.auto')) {
						return;
					}
					startInterval();
				}
			});

		};

	}({
		g : window,
		jQ : window.jQuery
	});

	$(function() {
		/**
		 * @param1 필수, @param2 옵션
		 * @param @type selector : 슬라이드 컨테이닝 박스
		 * @param @type {} : 객체 리터럴(옵션값)
		 * 기본값 {isSelected : 'active', speed:400, duration: 2500, autoPlay: true}
		 */

		// 기본 옵션값으로 호출할 경우 옵션 생략가능
		JUI.slider('#banner');

		// 사용자 정의 옵션값으로 호출
		/*
		JUI.slider('#slider01', {
		   speed : 200,
		   duration: 4000,
		   autoPlay: false
		})
		 */
	});
	
	//GOODS 클릭하면 read로 가는거
	 $(".imgDiv").on("click", ".imgContainer .idxpimg", function() {
	      var p_no = $(this).parent().find(".p_no").val();
	      var id = $(this).parent().find(".id").val();
	      location.href = "/product/read?p_no=" + p_no + "&id=" + id;
	   });
</script>
</html>