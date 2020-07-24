<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[상품목록]</title>
	<style>
		#productMenu{width:1780px;font-family:YDIYGO330;font-size:24px;margin:auto;vertical-align:middle}
		.menuB{text-decoration:none;color:black;}
		.menuB:hover{cursor:pointer;}
		body {width:1000px;}
		#besttab, #artgoodstab, #creatertab{width:1000px;margin:auto;overflow:hidden;}
		.box{width:200px;float:left;text-align:center; margin:auto;}
		.creater{width:500px;float:left;text-align:center; margin:auto;}
		.image img{whitd:150px; height:120px; margin:auto; margin-bottom:5px;}
	</style>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp"></jsp:include>
	
	<table id=productMenu height=116px>
		<tr>
			<td>
				<a class=menuB id="bestmenu">BEST</a>&emsp;&emsp;&emsp;
				<a class=menuB id="artgoodsmenu">아트굿즈</a>&emsp;&emsp;&emsp;
				<a class=menuB id="purchasemenu">판매자</a>
			</td>
		</tr>
	</table>
	
	<div id="best">
		<div id="besttab" ></div>
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
	
	<div id="artgoods" style="display:none">
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
		<div id="creatertab">
			<c:forEach items="${creater}" var="creater">
				<div class="creater">
					<img src="/display?fileName=${creater.u_image}" width=100 height=100/>
					<div style="float:right">
						<div class="createrid">${creater.id}</div><br>
						<div>${creater.introduce}</div>
					</div>
					
					<div class="proimagetab"></div>
					<script class="proimagetemp" type="text/x-handlebars-template">
						{{#each .}}
							<div class="proimagebox">
								<div class="image"><img src="/display?fileName={{image}}"/></div>
							</div>
						{{/each}}
					</script>
				</div>
				
			</c:forEach>
		</div>
	</div>
		
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>

<script>
	getBest();
	artgoods();
	$("#best").hide();
	$("#artgoods").hide();
	//$("#creater").hide();
	
	$("#bestmenu").on("click", function(){
		$("#best").show();
		$("#artgoods").hide();
		$("#creater").hide();
	});
	
	$("#artgoodsmenu").on("click", function(){
		$("#best").hide();
		$("#artgoods").show();
		$("#creater").hide();
	});
	
	$("#purchasemenu").on("click", function(){
		$("#best").hide();
		$("#artgoods").hide();
		$("#creater").show();
		proimage();
	});
	
	$("#besttab").on("click", ".image", function(){		
		var p_no=$(this).parent().find(".p_no").val();
		var id=$(this).parent().find(".id").html();
		location.href="/product/read?p_no="+p_no+"&id="+id;
	});
	
	function getBest(){
		$.ajax({
			type:"get",
			url:"/product/rest/bestlist",
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#besttemp").html());
				$("#besttab").html(temp(data));
			}
		});
	}
	
	$("#artgoodstab").on("click", ".image", function(){		
		var p_no=$(this).parent().find(".p_no").val();
		var id=$(this).parent().find(".id").html();
		location.href="/product/read?p_no="+p_no+"&id="+id;
	});
	
	function artgoods(){
		$.ajax({
			type:"get",
			url:"/product/rest/artgoods",
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#artgoodstemp").html());
				$("#artgoodstab").html(temp(data));
			}
		});
	}
	
	function proimage(){
		$("#creatertab .creater").each(function(){
			var id=$("#creatertab .creater").find(".createrid").html();
			$.ajax({
				type:"get",
				url:"/product/rest/proimage",
				data:{"id":id},
				dataType:"json",
				success:function(data){
					id=$("#creatertab .creater").find(".createrid").html();
					var temp=Handlebars.compile($(".proimagetemp").html());
					$(".proimagetab").html(temp(data));
				}
			});
		});
	}
</script>

</html>