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
	font-size: 22px
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
	top: 225px;
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

/* 전시부분 슬라이드 스타일 */


</style>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


</head>
<body style=padding-top:81px;>
      
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
      <div id=keyword>최신순&emsp;&nbsp;인기순&emsp;&nbsp;조회순</div>
      <a href="" class=more><img src="/display?fileName=more.png"/></a>
   </div><br><br>
   <table border=1 style=border-collapse:collapse;height:685px;width:1820px;margin:auto;>
      <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      </tr>
      <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td> 
      <td></td>
      </tr>
   </table>
   
   <div id=goods>
      <div id=gTitle>Goods</div>
      <div id=gContent>현재 제일 잘 나가는 굿즈에요.</div>
      <a href="" class=more><img src="/display?fileName=more.png"/></a>
   </div><br><br>
   <table border=1 style=border-collapse:collapse;height:685px;width:1820px;margin:auto;>
      <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      </tr>
      <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      </tr>
   </table>
   
   <div id=feed>
      <div id=fTitle>Feed</div>
      <div id=fContent>팔로우한 작가들의 최신 아트웍이에요.</div>
      <a href="" class=more><img src="/display?fileName=more.png"/></a>
   </div><br><br>
   <table border=1 style=border-collapse:collapse;height:685px;width:1820px;margin:auto;>
      <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      </tr>
      <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      </tr>
   </table>
   
   <div id=exhibition>
      <div id=eTitle>Exhibition</div>
      <div id=eContent>다가오는 전시를 확인하세요.</div>
      <a href="" class=more><img src="/display?fileName=more.png"/></a>
   </div><br><br>
	<jsp:include page="test.jsp"/>
	<br><br>
	<jsp:include page="footer.jsp"/>
</body>
<script>
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

</script>
</html>