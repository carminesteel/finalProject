<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[작품정보]</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>
	<h1>[작품정보]</h1>
	<form name="frm" method="post" action="update" enctype="multipart/form-data">
		<input type="hidden" name="b_no" value="${vo.b_no}">
		<table id="tbl" border=1>
			<tr>
				<th width=100>번호</th>
				<td>${vo.b_no}</td>
			</tr>
			<tr>
				<th width=100>제목</th>
				<td><input type="text" name="title" value="${vo.title}" size=50></td>
			</tr>
			<tr>
				<th width=100>아이디</th>
				<td name="id">${vo.id}</td>
			</tr>
			<tr>
				<th width=100>날짜</th>
				<td><fmt:formatDate value="${vo.date}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				 <td>대표이미지</td>
				<td width=400>
					<input type="file" name="file">
					<c:if test="${ vo.image!=null && vo.image!='' }">
						<img id="image" src="display?fileName=${ vo.image }" width=150>
					</c:if>
					<c:if test="${ vo.image==null || vo.image=='' }">
						<img src="http://placehold.it/150x120" width=150>
					</c:if>
					<input type="hidden" name="image" value="${ vo.image }">
				</td>
				
				<%--		<td>대표이미지</td>
				<td><img id="image" src="display?fileName=${vo.image}" width=150/>
				<input type="file" name="file" />
				</td> --%>
			</tr>
			<tr>
				<th>
					<input type="button" value="상품이미지" id="btnImage">
				</th>
				<td style="padding:5px;height:150px;">
					<input type="file" name="files" accept="images/*" multiple>
					<div id="listFile">
						<c:forEach items="${list}" var="image">
							<img src="display?fileName=${image}" width="300" height="300"/>
						</c:forEach>
					</div>
				</td>
			</tr>
			<tr>
				<th width=100>내용</th>
				<td><input type="text" name="content" value="${vo.content}"></td>
			</tr>
			
		</table>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
		<input type="button" value="삭제" id="btnDelete">
		<input type="button" value="목록" onClick="location.href='list'">
		<input type="button" value="댓글보기" id="btnReply">
		<input type="button" value="댓글숨기기" id="btnReply2">
		<input type="button" value="좋아요/${vo.b_like}" id="LikeBtn">
		
	</form>
	<hr>
	<jsp:include page="../b_reply/list.jsp"></jsp:include>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
$("#btnReply").hide();

var id="${id}";
var b_no="${vo.b_no}";

$("#LikeBtn").on("click",function(){
	$.ajax({
		type:"post",
		url:"/board/like/update",
		data:{"id":id,"b_no":b_no},
		dataType:"json",
		success:function(data){
			$("#LikeBtn").val("좋아요/"+data);
		}
	})
})

$("#btnReply").on("click",function(){
	$(rfrm).show();
	$(rfrm1).show();
	$("#btnReply").hide();
	$("#btnReply2").show();
})
$("#btnReply2").on("click",function(){
	$(rfrm).hide();
	$(rfrm1).hide();
	$("#btnReply").show();
	$("#btnReply2").hide();
})

$(frm).submit(function(e){
	e.preventDefault();
	if(!confirm("수정하실래요?")) return;
	frm.submit();
	
});
$("#image").on("click", function(){
	$(frm.file).click();
});

$("#btnImage").on("click", function(){
	$(frm.files).click();
});

$(frm.files).on("change", function(){
	var files=$(frm.files)[0].files;
	var html="";
	$.each(files, function(index, files){
		html+="<img src='"+URL.createObjectURL(files)+"'>";
		$("#listFile").html(html);
	});
});

$(frm.file).on("change", function(){
	var file=$(frm.file)[0].files[0];
	$("#image").attr("src", URL.createObjectURL(file));
});
$("#btnDelete").on("click", function(){
	if(!confirm("삭제하실래요?")) return;
	frm.action="delete";
	frm.submit();
});


</script>

</html>