<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의하기</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);	
	
	#btnSend{
	all: unset;
	float:right;
	margin-right:330px;
	margin-left:3px; 
	background: #2b4163; 
	width: 70px; 
	height: 30px; 
	color: white; 
	border-radius: 5px 5px 5px 5px;
	text-align:center;
	}
	
	#btnSend:hover{
	cursor:pointer;
	}
	
	#btnReset{
	all: unset;
	margin-left:10px;
	float:right;
	background: #2b4163; 
	width: 70px; 
	height: 30px;
	margin-left:10px; 
	color: white; 
	border-radius: 5px 5px 5px 5px;
	text-align:center;
	}
	
	#btnReset:hover{
	cursor:pointer;
	}
	
	body{
	width:800px;
	margin:auto;
	padding-top:30px;
	background-color: #74a4d7;
	z-index: 1;
	}
	</style>
</head>
</head>
<body>
	<form action="paperInsert" name="frm" method="post">
		<input type="hidden" name="p_no" value="${param.p_no}">
		<input type="hidden" name="sender" value="${id}">
		<table>
			<tr>
				<td style="text-align:right"><b>판매자 :</b> ${param.receiver}님</td>		
			</tr>
			<tr>
			<td><b>TITLE : </b><input type="text" name="title" style="width:732px;height:20px;margin-top:20px;resize:none;border-radius:5px 5px 5px 5px;" placeholder="제목을입력하세요"></td>
			</tr>
			<tr>
			<td><textarea name="content" style="width:790px;height:150px;margin-bottom:15px;margin-top:3px;resize:none;border-radius:5px 5px 5px 5px; "placeholder="내용을입력하세요"></textarea>
			</tr>
		</table>
		<input id="btnSend" type="submit" value="보내기"> 
		<input id="btnReset" type="reset" value="취소">
	</form>
</body>
<script>
var p_no="${param.p_no}";
var receiver="${param.receiver}";
var sender="${id}";

	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("쪽지를 보내시겠습니까?")) return;
		var title = $(frm.title).val();
		var content = $(frm.content).val();
	if(title==""){
		alert("제목을 입력하세요");
		}if(content==""){
			alert("내용을 입력하세요");
		}else{
			$.ajax({
				type:"post",
				url:"paperInsert",
				data:{"sender":sender,"receiver":receiver,"title":title,"content":content},
				success:function(){
					alert("쪽지가 전송되었습니다");
					window.close();
				}
			});
		}
	});
</script>
</html>