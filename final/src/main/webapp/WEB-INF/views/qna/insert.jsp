<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>ㄴ
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>문의하기</h1>
	
	<form name="frm" method="post" action="insert">
	<input type="hidden" name="p_no" value="${param.p_no}">
	<%-- <input type="hidden" name="id" value="${id}"> --%>
	<input type="hidden" name="id" value="${id}">
	<table>
		
		<tr>
		
			<th>제목</th>
			<td><input type="text" name="title" size=50></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10" cols="52" name="content" value="${vo.content}"></textarea></td>
		</tr>
		
	</table>
	<input type="button" value="취소">
	<input type="submit" value="문의하기" >
	<input type="button" value="창닫기" onclick="javascript:self.close();">
	</form>
</body>
<script>
var p_no="${param.p_no}";
var qe="${qe}";
/*$(frm).submit(function(e) {
	e.preventDefault();
	if (!confirm("문의하시겠습니까?"))
		return;
	window.close();
	frm.submit();
	location.href="/product/read?p_no="+p_no;
	
});*/
$(frm).submit(function(e){
	e.preventDefault();
	if(!confirm("문의하시겠습니까?")) return;
	var content =$(frm.content).val();
	var id=$(frm.id).val();
	var title=$(frm.title).val();
	if(content==""){
		alert("내용을입력해주세요");
	}else{
		$.ajax({
			type:"post",
			url:"/qna/insert",
			data:{"p_no":p_no,"id":id,"title":title,"content":content},
			success:function(){
				$("#qe").html(++qe);
				window.close();
				
			
				
			}
		
		});
	}
});
	
</script>
</html>