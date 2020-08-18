<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고신고</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

</head>
<body>

	<h1>신고하기</h1>
	
	<form name="frm" method="post" action="updateReport">
	<input type="hidden" name="b_no" value="${param.b_no}">
	<input type="hidden" name="id" value="${id}">
	<table>
		
		<tr>
			<td>내용</td>
			<td><textarea rows="10" cols="52" name="content" value="${vo.content}"></textarea></td>
		</tr>
		
	</table>
	<input type="button" value="취소">
	<input type="submit" value="신고하기">
	</form>
</body>

<script>
var b_no="${param.b_no}";
 $(frm).submit(function(e){
	e.preventDefault();
	if(!confirm("신고하시겠습니까?")) return;
	var content = $(frm.content).val();
	var id= $(frm.id).val();
	if(content==""){
		alert("내용을 입력해주세요");
	}else{
		$.ajax({
			type:"post",
			url:"reportCnt",
			data:{"b_no":b_no,"id":id},
			success:function(data){
				if(data==0){
					$.ajax({
						type:"post",
						url:"reportInsert",
						data:{"id":id,"b_no":b_no,"content":content},
						success:function(){
							window.close();
							location.href="/board/list";
						}
					})
				}else{
					alert("이미 신고한 게시물 입니다.");
				}
			}
		});
		
	}
 });
</script>
</html>