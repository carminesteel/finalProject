<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[답글]</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
	#txtReply{boader:bottom;}
</style>
</head>
<body>
	
	<c:forEach items="${vo}" var="v">
		${v.content}<br>
		${v.writedate}<br>
		${v.replyer}<br>
		${v.q_no}<br>
	</c:forEach>
	<div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<input type="text" id="txtReply" size=100>&nbsp;&nbsp;
	<button id="btnInsert2">입력</button>
	</div>
</body>
<script>
var q_no="${q_no}";
	$("#btnInsert2").on("click", function(){
		var content=$("#txtReply").val();
		if(content==""){
			alert("내용을입력하세요");
			return;
		}
		var replyer="${id}";
		$.ajax({
			type:"post",
			url:"/qna/insert2",
			data:{"q_no":q_no,"replyer":replyer,"content":content},
			success:function(){
				location.reload();
			}
		});
	});
	
</script>
</html>