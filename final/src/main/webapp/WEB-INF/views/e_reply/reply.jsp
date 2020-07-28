<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
	.reply1{margin:5px; padding:10px; width:450px;}
	</style>
</head>
<body>
	<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
		<div class="reply1">
			<div class="replydate">
				<b>{{replyer}}</b>
				<a>{{date}}</a>
				<button r_no={{r_no}}>삭제</button>
			</div>
			<div class="content">{{content}}</div>
		</div>
		{{/each}}
	</script>
	<div><input type="text" id="txtReply" size=60>&nbsp;&nbsp;<button id="btnInsert">입력</button></div>
	<br>
</body>
<script>
	var e_no="${vo.e_no}";
	getList();
	
	function getList(){
		$.ajax({
			type:"get",
			url:"/reply/list",
			data:{"e_no":e_no},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				
			}
		});
	}
	
	var re = "${re}";
	$("#btnInsert").on("click",function(){
		var content=$("#txtReply").val();
		if(content==""){
			alert("댓글을 입력하세요");
			return;
		}
		var replyer="user2";
		$.ajax({
			type:"post",
			url:"/reply/insert",
			data:{"e_no":e_no,"replyer":replyer,"content":content},
			success:function(){
				alert("댓글을 등록하였습니다.");
				$("#txtReply").val("");		
				getList();
				$("#re").html(++re);
				return false;
			}
		});
	});
	
	var Dre = "${re}";
	$("#tbl").on("click",".replydate button",function(){
		var r_no=$(this).attr("r_no");
		if(!confirm("삭제하시겠습니까?")) return;
		$.ajax({
			type:"post",
			url:"/reply/delete",
			data:{"r_no":r_no},
			success:function(){				
				alert("댓글이 삭제되었습니다");				
				$("#re").html(--Dre);
				getList();
			}
		});
	});
</script>
</html>