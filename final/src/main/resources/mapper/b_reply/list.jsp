<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>댓글</title>
<style>
	#tbl1{text-align:center;}
</style>	
</head>
<body>
	<form action="/b_reply/insert" method="post" name="rfrm">
		<input type="hidden" name="b_no" id="b_no" value="${vo.b_no}">
		<input type="hidden" name="replyer" value="user">
		<input type="text" name="content" size=50>
		<input type="submit" value="입력">
		
	</form>
	
	
	
	<form action="/b_reply/delete" method="post" name="rfrm1">
	<table id=tbl1 width=600>
		<tr>
			<td width=70>댓글번호</td>
			<td width=100>작성자</td>
			<td width=200>내용</td>
			<td width=170>날짜</td>
			<td width=30></td>
		</tr>
		<c:forEach items="${rlist}" var="rvo">
		<tr class="row">
			<td class="r_no" >${rvo.r_no}</td>
			<td>${rvo.replyer}</td>	
			<td>${rvo.content}</td>
			<td><fmt:formatDate value="${rvo.date}" pattern="yyyy-MM-dd kk:mm:ss"/></td>

			<td class="b_no">${rvo.b_no}</td>
			<td><input type="button" value="삭제" class="rbtnDelete"></td>		
			
		</tr>
		</c:forEach>
	</table>
</form>
</body>
<script>
var b_no = $("#tbl1 .row").find(".b_no").html();
$("#tbl1").find(".row .b_no").hide();
$(rfrm).submit(function(e){
	e.preventDefault();
	if($(rfrm.content).val()==""){
		alert("내용을 입력해주세요");
	}else{
		rfrm.submit();
	}
});

$("#tbl1").on("click", ".row .rbtnDelete", function(){
	var r_no=$(this).parent().parent().find(".r_no").html();
	if(!confirm("삭제하시겠습니까?")) return;
	$.ajax({
	      type:"post",
	      url:"/b_reply/delete",
	      data:{"r_no":r_no},
	      success:function(){
	         location.href="/board/read?b_no="+b_no;
	      }
	   });
	
});



</script>
</html>