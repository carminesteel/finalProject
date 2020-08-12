<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[게시판 등록]</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
			<style>
		.image {margin:auto; padding:50px;}
		#exBody {
		background-color: #e9ecef;
		z-index: 1;
		
		}
		
		#exCenter {
			padding-top:150px;
			background-color: white;
			width: 1276px;
			margin: auto;
			z-index: 2;
			padding-bottom:150px
		}  
		</style>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>
	<div id=exBody>
		<div id=exCenter>
			<form name="frm" method="post" action="insert"  enctype="multipart/form-data">
				<table style="width:1130px;margin:auto;border-collapse:collapse;">
					<tr>
						<th>제목</th>
						<td width=350>
							<input type="text" name="title"><br>
							<input type="hidden" name="id" value="${id}">
						</td>
					</tr>
					<tr>
						<th>대표이미지</th>
						<td>
							<input type="file" name="file">
							<img id="image" style="float: left;" src="http://placehold.it/100x100" width=300>
						</td>
					</tr>
					<tr>
						<th>상품이미지</th>
						<td style="padding:5px;height:150px;">
							<!-- <input type="button" value="상품이미지" id="btnImage"> -->
							<input type="file" name="files" accept="image/*" multiple>
							<div id="listFile"></div>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="80" name="content"></textarea></td>
					</tr>					
					</table>
				<div style="float:right;margin-right:6%; margin-top:10px;">
					<input type="submit" value="저장">
					<input type="reset" value="취소">
					<input type="button" value="목록" onClick="location.href='list'">
				</div>
			</form>
		</div>
	</div>
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