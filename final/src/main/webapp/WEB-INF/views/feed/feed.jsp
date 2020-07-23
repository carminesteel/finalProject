<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#tbl{overflow:hidden;width:1100px;}
	#tbl .row{float:left;margin:5px;}
</style>
<body>

<h1>Feed</h1>
	<div id=tbl border=1 ></div>
	   <script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			
				<div width:200px class=row><img src="../display?fileName={{image}}" width=200 height=200>
					<br>{{title}}
					<br>좋아요:{{b_like}}
					<br>{{id}}<br>{{content}}
				</div>
			
		{{/each}}
</script>
</body>

<script>
var id="${id}";
getList();

function getList(){
	$.ajax({
		type:"post",
		url:"/feed/list",
		data:{"id":id},
		dataType:"json",
		success:function(data){
			 var temp = Handlebars.compile($("#temp").html());
		      $("#tbl").html(temp(data));
			
		}
	})
}

</script>

</html>