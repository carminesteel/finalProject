<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[상품 등록]</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
#pTitle {
	font-family: Noto Sans KR;
	font-weight: bold;
	font-size: 70px;
	height: 90px;
	color: black;
	margin-left:40px;
}
#pContent {
	font-size: 30px;
	font-weight: 300;
	width: 600px;
	color:black;
	margin-bottom:30px;
	margin-left:40px;
}
html {
	font-family: Noto Sans Kr
}

.details {
	width: 1100px;
}

#image:hover, #images:hover {
	cursor: pointer;
}

body {
	overflow-x: hidden;
	float: left;
	padding: 0px;
	width: 100%;
	margin: 0px;
}

.image {
	margin: auto;
	padding: 50px;
}

#exBody {
	background-color: #e9ecef;
	z-index: 1;
}

#exCenter {
	/* padding-top: 150px;
	background-color: white;
	width: 1276px;
	margin: auto;
	z-index: 2;
	padding-bottom: 150px */
	background-color: white;
	width: 1186px;
	margin: auto;
	z-index: 2;
	padding: 45px;
}

/* 버튼쪽입니다. */
#btnOne{
all: unset;
float: right;
margin-right: 40px; 
background: #2e6cb5; 
width: 100px; 
height: 30px; 
color: white; 
border-radius: 5px 5px 5px 5px; 
text-align: center;
}
#btnTwo{
all: unset; 
background: #2e6cb5; 
width: 70px; 
height: 30px; 
margin-left: 40px; 
color: white; 
border-radius: 5px 5px 5px 5px; 
text-align: center;
}
#btnThree{
all: unset; 
background: #2e6cb5; 
width: 70px; 
height: 30px; 
color: white; 
border-radius: 5px 5px 5px 5px; 
text-align: center;
}

/* 상품제목 */
#productList{
margin-bottom: 15px; 
display: inline-block; 
width: 480px; 
height: 47px; 
border: 1px solid black; 
font-size: 30px; 
padding: 30px;
}
/* 상품제목 */
#productPrice{
margin-bottom: 15px; 
display: inline-block; 
width: 480px; 
height: 47px; 
border: 1px solid black; 
font-size: 30px; 
padding: 30px;
float:right;
}
/* 이미지 칸*/
#ProductImage{
display: inline-block; 
padding: 0px;
margin: auto; 
text-align: center; 
width: 1101px; 
height: 792px; 
overflow: auto; 
overflow-x: hidden; 
margin-bottom: 15px; 
border: 1px dashed black;
}
#ProductExplain{
resize: none; 
display: inline-block; 
padding: 0px; 
margin: auto; 
width: 1051px; 
height: 230px; 
border: 1px solid black; 
font-size: 15px; 
padding: 25px;
}
</style>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp"></jsp:include>
	<div id=exBody>
		<div id=exCenter>
			<div id=pTitle>Upload</div>
			<form name="frm" action="insert" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${id}">
				<div id=pContent>상품 업로드</div>				
				<div style="width: 1101px; height: 1210px; margin: auto; padding: 0px; margin-bottom: 20px;">				
					<input type="text" placeholder="상품명을 입력해주세요." name="title" id="productList">
					<input type="text" placeholder="금액을 입력해주세요." name="price" id="productPrice">
					<div id="ProductImage">
						<input type="file" name="file"> <img id="image"	style="display: block; margin: auto; margin-top: 30px; margin-bottom: 30px;"src="/display?fileName=mainIMG.png"> 
						<input type="file" id="btnImage" name="files" accept="image/*" multiple><img id="images" src="/display?fileName=detailIMG.png">
					<div id="listFile" style="width: 1100px"></div>
					</div>
				<textarea placeholder="상품에 대해 설명해주세요." name="content"	id="ProductExplain"></textarea>

				</div>
				<input	type="submit" value="저장" id="btnOne">
				<input  type="reset" value="취소" id="btnTwo"> 
				<input	type="button" value="목록" id="btnThree" onClick="location.href='list'">
			</form>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
$(frm.file).hide();
$(frm.files).hide();
	$("#btnThree").on("click", function() {
		location.href = "list";
	});

	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("저장하시겠습니까?"))return;
		frm.submit();
	});

	$("#image").on("click", function() {
		$(frm.file).click();
	});
	
	$("#images").on("click", function() {
		$(frm.files).click();
	});

	$(frm.file).on("change", function(){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
		$("#image").css("max-width","1100px");
	});

	
	
	
	//다중이미지 미리보기

	$(frm.files).on("change", function(){
		var files=$(frm.files)[0].files;
		var html="";
		
		$.each(files, function(index, files){
			$("#images").hide();
			html += "<img class='details' style='width:1100px' src='" + URL.createObjectURL(files) + "'>";
			$("#listFile").html(html);
		});	
	});
</script>
</html>