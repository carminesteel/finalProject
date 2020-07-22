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
		body {width:1000px;}
		#tab{width:1000px;margin:auto;overflow:hidden;}
		.box{width:200px;float:left;text-align:center; margin:auto;}
		.image img{whitd:150px; height:120px; margin:auto; margin-bottom:5px;}
	</style>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>
	<table id=productMenu height=116px>
		<tr>
			<td><a class=menuB href="">BEST</a>&emsp;&emsp;&emsp;<a class=menuB href="">아트굿즈</a>&emsp;&emsp;&emsp;<a class=menuB href="">판매자</a>
		</tr>
	</table>
	
	<div id="tab" ></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="box">
				<div class="image"><img src="{{image}}"/></div>
				<div class="title">{{title}}</div>
				<div class="price">{{price}}</div>
				<div class="content">{{content}}</div>
			</div>
		{{/each}}
	</script>

	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>

<script>
	getList();
	
	function getList(){
		$.ajax({
			type:"get",
			url:"/product/rest/list",
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#tab").html(temp(data));
			}
		});
	}
</script>

</html>