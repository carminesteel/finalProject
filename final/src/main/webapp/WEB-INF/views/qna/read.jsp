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
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	#txtReply{boader:bottom;}
	#btnInsert2{
	all: unset;
	background: #2b4163; 
	width: 50px; 
	height: 30px; 
	color: white; 
	border-radius: 5px 5px 5px 5px;
	text-align:center;
	}
	
	#btnInsert2:hover{
	cursor:pointer;
	}
</style>
</head>
<body>
	<input type="hidden" value="${id}">	
	<c:forEach items="${vo}" var="v">
		<div><img width=65px height=65px; style="border-radius:50%;" src="../display?fileName=${v.u_image}"/></div>
		<b>${v.nickname}</b><br>
		<b>답글 내용 : ${v.content}</b><br>
		<b>답변 날짜 : ${v.writedate}</b><br>
	</c:forEach>
	<div>
	<br>
	<c:if test="${id=='zzz'}">
		<input style=width:732px;height:20px;margin-top:20px;resize:none; type="text" id="txtReply">
		<button id="btnInsert2">입력</button>
	</c:if>
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
				$('#tbl1').load(document.URL +  ' #tbl1');
				location.reload();
			}
		});
	});
	
</script>
</html>