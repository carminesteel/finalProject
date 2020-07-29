<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[상품목록]</title>
<style>
html {font-family:Noto Sans KR}

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

.creatertab .proimage td {
	display: none;
}

.creatertab .proimage td:nth-child(1), .creatertab .proimage td:nth-child(2),
	.creatertab .proimage td:nth-child(3) {
	display: inline-block
}

#productMenu {
	width: 1250px;
	font-size: 18px;
	margin: auto;
	height: 60px;
	padding-top:0px];
	padding-bottom: 0px;
	padding-left:20px;
	background:white;
	border-radius:5px 5px 5px 5px;
	position:absolute;
	left:325px;
	bottom:800px;
}

.menuB {
	text-decoration: none;
	color: black;
}

.menuB:hover {
	cursor: pointer;
	border-bottom: 2px solid black
}

body {
	width: 1000px;
}

#besttab, #artgoodstab {
	width: 1000px;
	margin: auto;
	overflow: hidden;
}

#creater {
	width: 1275px;
	margin: auto;
	overflow: hidden;
	padding-top:100px;
	padding-bottom:50px;
}

.creatertab {
	background:white;
	width: 616px;
	height: 360px; float : left;
	margin: auto;
	float: left;
}

.box {
	width: 200px;
	float: left;
	text-align: center;
	margin: auto;
}

.image img {
	width: 150px;
	height: 120px;
	margin: auto;
}

.proImg {
	max-width: 100%;
	object-fit: cover;
}

/* 메뉴에 언더바 따라오게 */
nav {
	position: relative;
	display: flex;
	height: 55px;
}

nav a {
	display: block;
	padding: .95em 0;
	color: #333;
	text-decoration: none;
	text-align: center;
}

#best, #artgoods {
	padding-top:120px;
}
</style>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp"></jsp:include>

	<table id=productMenu>
		<tr>
			<td><nav>
					<a class=menuB id="bestmenu">Best</a>&emsp;&emsp;&emsp; <a
						class=menuB id="artgoodsmenu">Gallery</a>&emsp;&emsp;&emsp; <a
						class=menuB id="purchasemenu">Artist</a>
					<div class="nav-underline"></div>
				</nav></td>
		</tr>
	</table>

	<div id=exBody style="padding-top:0px;">
		

			<div id="best">
				<div id="besttab"></div>
				<script id="besttemp" type="text/x-handlebars-template">
			{{#each .}}
				<div class="box">
					<input type="hidden" value="{{p_no}}" class="p_no">
					<div class="image"><img src="/display?fileName={{image}}"/></div>
					<div class="title">{{title}}</div>
					<div class="price">{{price}}원</div>
					<div class="content">{{content}}</div>
					<div class="id" style="display:none">{{id}}</div>
				</div>
			{{/each}}
		</script>
			</div>

			<div id="artgoods" style="display: none">
				<div id="artgoodstab"></div>
				<script id="artgoodstemp" type="text/x-handlebars-template">
			{{#each .}}
				<div class="box">
					<input type="hidden" value="{{p_no}}" class="p_no">
					<div class="image"><img src="/display?fileName={{image}}"/></div>
					<div class="title">{{title}}</div>
					<div class="price">{{price}}원</div>
					<div class="content">{{content}}</div>
					<div class="id" style="display:none">{{id}}</div>
				</div>
			{{/each}}
		</script>
			</div>

			<div id="creater">
				<c:forEach items="${users}" var="creater">
					<table class="creatertab"
						style="margin: 10px; padding: 25px; border-radius: 5px 5px 5px 5px;">
						<tr class="creater">
							<td width=149 colspan=3 style="padding-bottom: 25px;"><img
								src="/display?fileName=${creater.u_image}"
								style="float: left; border-radius: 50%;" width=75 height=75 /> <span
								style="text-align: left; width: 200px; float: left; padding-left: 25px;">
									<p style="font-weight: bold; font-size: 24px; margin: 0;">${creater.id}</p>
									<p style="font-size: 15px; margin: 0;">${creater.introduce}</p>
							</span> <span
								style="float: right; background: #e9e9e9; position: relative; top: 15px; padding: 5px; border-radius: 20px 20px 20px 20px; font-size: 13px; width: 80px; height: 28px; text-align: center;line-height:26px;color:#373e45">상품n개</span>
							</td>
						</tr>
						<tr class="proimage">
							<c:forEach items="${proimage}" var="image">
								<c:if test="${creater.id==image.id}">
									<td width=180 height=190 style="margin: 2px;"><img
										class=proImg src="/display?fileName=${image.image}" width=100%
										height=100%></td>
								</c:if>
							</c:forEach>
						</tr>
					</table>
				</c:forEach>
			</div>

			<%-- 	<div id="creater">

		<div id="creatertab">
			<c:forEach items="${users}" var="creater">
				<div class="creater" style="border:1px solid black">
					<img src="/display?fileName=${creater.u_image}" width=300 height=300/>
					<div style="float:right">
						<div class="createrid">${creater.id}</div><br>
						<div>${creater.introduce}</div>
					</div>
					
					<div>
					<c:forEach items="${proimage}" var="image">
					<c:if test="${creater.id==image.id}">
						<img src="/display?fileName=${image.image}" width=100 height=100>
					</c:if>
					</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
	</div> --%>
		
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>

</body>

<script>
	getBest();
	artgoods();
	$("#best").hide();
	$("#artgoods").hide();
	//$("#creater").hide();

	$("#bestmenu").on("click", function() {
		$("#best").show();
		$("#artgoods").hide();
		$("#creater").hide();
	});

	$("#artgoodsmenu").on("click", function() {
		$("#best").hide();
		$("#artgoods").show();
		$("#creater").hide();
	});

	$("#purchasemenu").on("click", function() {
		$("#best").hide();
		$("#artgoods").hide();
		$("#creater").show();
		//proimage();

		var array = [];
		$("#tab .row").each(function() {
			var id = $(this).find(".createrid").html();
			alert(id);
			var data = {
				"id" : id
			};
			array.push(data);
		});
		var template = Handlebars.compile($(".creatertemp").html());
		$(".creatertab").html(template(array));

	});

	$("#besttab").on("click", ".image", function() {
		var p_no = $(this).parent().find(".p_no").val();
		var id = $(this).parent().find(".id").html();
		location.href = "/product/read?p_no=" + p_no + "&id=" + id;
	});

	function getBest() {
		$.ajax({
			type : "get",
			url : "/product/rest/bestlist",
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#besttemp").html());
				$("#besttab").html(temp(data));
			}
		});
	}

	$("#artgoodstab").on("click", ".image", function() {
		var p_no = $(this).parent().find(".p_no").val();
		var id = $(this).parent().find(".id").html();
		location.href = "/product/read?p_no=" + p_no + "&id=" + id;
	});

	function artgoods() {
		$.ajax({
			type : "get",
			url : "/product/rest/artgoods",
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#artgoodstemp").html());
				$("#artgoodstab").html(temp(data));
			}
		});
	}
	/*
	function proimage(){
		$("#creatertab .creater").each(function(){
			var id=$(this).find(".createrid").html();
			$.ajax({
				type:"get",
				url:"/product/rest/proimage",
				data:{"id":id},
				dataType:"json",
				error:function(){
					alert("xxxx");
				},
				success:function(data){
					//alert(id);
					for(var i=0; i<=data.length-1; i++){
						//alert(data[i]["id"]);
						if(id==data[i]["id"]){
							//alert(id+"   !@@!   "+data[i]["id"]);
							var temp=Handlebars.compile($(".creatertemp").html());
							$(".creatertab").html(temp(data));
						}
					}
				}
			});
		});
	}*/
</script>

</html>