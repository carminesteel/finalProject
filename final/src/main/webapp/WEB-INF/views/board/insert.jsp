<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[게시판 등록]</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>
	<h1>[게시판 등록]</h1>
	<form name="frm" method="post" action="insert"  enctype="multipart/form-data">
	<table border=1>
			
				<tr>
				
				<th width=100>Title</th>
				<td><input type="text" name="title" size=50><input type="hidden" name="id" value="${id}"></td>
			</tr>
			<tr>
				<td>대표이미지</td>
				<td>
				<img id="image" src="http://placehold.it/150x120" width=150>
				<input type="file" name="file">
				</td>
			</tr>
			<tr>
				<th>
					<input type="button" value="상품이미지" id="btnImage">
				</th>
				<td style="padding:5px;height:150px;">
					<input type="file" name="files" accept="image/*" multiple>
					<div id="listFile"></div>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<textarea rows="10" cols="67"name="content"></textarea>
				</td>
			</tr>						
		</table>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
		<input type="button" value="목록" onClick="location.href='list'">
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
//이미지를 클릭했을때
$("#image").on("click", function(){
	$(frm.file).click();
});
$("#btnImage").on("click", function(){
	$(frm.files).click();
});

//파일선택버튼을 눌렀을때(Multi)
$(frm.files).on("change", function(){
	var files=$(frm.files)[0].files;
	var html="";
	
	$.each(files, function(index, files){
		html += "<img src='" + URL.createObjectURL(files) + "'>";
		$("#listFile").html(html);
	});
	
});
$(frm.file).on("change", function(){
	var file=$(frm.file)[0].files[0];
	$("#image").attr("src", URL.createObjectURL(file));
});

</script>
</html>