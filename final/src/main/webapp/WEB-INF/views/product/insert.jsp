<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[상품목록]</title>
<style>
.menuB {
	text-decoration: none;
	color: black;
}

body {
	width: 1000px;
}

#tab {
	width: 1000px;
	margin: auto;
	overflow: hidden;
}

.box {
	width: 200px;
	float: left;
	text-align: center;
	margin: auto;
}

.image img {
	whitd: 150px;
	height: 120px;
	margin: auto;
	margin-bottom: 5px;
}
</style>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp"></jsp:include>
	<h1>Product Insert</h1>
	
	<form name="frm" action="insert" method="post" enctype="multipart/form-data">
		
		id입력 <input type=text name=id size=10> 
		제목을 입력하세요 <input type=text name=title size=10><br>
		
		<h1>이미지 업로드하셈</h1>
		<br>
		
		대표이미지 <input type="file" name="file">		
		<img id="image" src="http://placehold.it/100x100" width=300><br>
		
		상세이미지 <input type="button" id="btnImage" value="상품이미지">
		<input type="file" name="files" accept="image/*" multiple>
		
		<div id="listFile"></div>
		<br> 
		상품 설명
		<textarea name=content cols=100 rows=10></textarea>
		<br> 
		가격 <input type="text" name="price">원
	
	
	<input type="submit" value="저장">
	<input type="reset" value="취소">
	<input type="button" value="목록" id="buttonList">
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>
	$("#buttonList").on("click", function() {
		location.href = "list";
	});

	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("저장하시겠습니까?"))
			return;
		frm.submit();
	});

	$("#image").on("click", function() {
		$(frm.file).click();
	});
	
	$("#multiImage").on("click", function() {
		$(frm.files).click();
	});

	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

	//다중이미지 미리보기
	$("#btnImage").on("click", function() {
		$(frm.files).click();
	});
	$(frm.files).change(function() {
		var files = $(frm.files)[0].files;
		var html = "";
		$.each(files, function(index, file) {
			html += "<img src='" + URL.createObjectURL(file) + "'>";
			$('#listFile').html(html);
		});
	});
</script>

</html>