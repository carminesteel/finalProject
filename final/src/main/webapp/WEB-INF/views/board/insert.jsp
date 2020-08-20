<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[게시판 등록]</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<style>
html {
	font-family: Noto Sans Kr
}

.details{
	width:1100px;
}

#image:hover, #images:hover{
	cursor:pointer;
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

#eTitle {
	font-family: Noto Sans KR;
	font-weight: bold;
	font-size: 70px;
	height: 90px;
	color: black;
	margin-left:40px;
}

#eContent {
	font-size: 30px;
	font-weight: 300;
	width: 600px;
	color:black;
	margin-bottom:30px;
	margin-left:40px;
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
</style>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp"></jsp:include>
	<div id=exBody>
		<div id=exCenter>
		<div id=eTitle>Upload</div>
			<form name="frm" method="post" action="insert"  enctype="multipart/form-data">
				<div id=eContent>작품 업로드</div>
				<input type="hidden" name="id" value="${id}">
				<div style="width:1101px;height:1210px;margin:auto;padding:0px;margin-bottom:20px;">
					<input type="text" placeholder="작품명을 입력해주세요." name="title" style="margin-bottom:15px;display:inline-block;width:1040px;height:47px;border:1px solid black;font-size:30px;padding:30px;">
					<div style="display:inline-block;padding:0px;margin:auto;text-align:center;width:1101px;height:792px;overflow:auto;overflow-x:hidden;margin-bottom:15px; border:1px dashed black;">
						<input type="file" name="file">	<img id="image" style="display:block;margin:auto;margin-top:30px;margin-bottom:30px;"  src="/display?fileName=mainIMG.png">						
						<input type="file" name="files" accept="image/*" multiple>	<img id="images" src="/display?fileName=detailIMG.png">
						<div id="listFile" style="width:1100px"></div>
					</div>
					<textarea placeholder="작품에 대해 설명해주세요." name="content" style="resize:none;display:inline-block;padding:0px;margin:auto;width:1051px;height:230px;border:1px solid black;font-size:15px;padding:25px;"></textarea>									
				</div>

					<input
						style="all: unset;float:right;margin-right:40px; background: #2e6cb5; width: 100px; height: 30px; color: white; border-radius: 5px 5px 5px 5px;text-align:center;"
						type="submit" value="저장"> 
					<input
						style="all: unset; background: #2e6cb5; width: 70px; height: 30px;margin-left:40px; color: white; border-radius: 5px 5px 5px 5px;text-align:center;"
						 type="reset" value="취소">
					<input
						style="all: unset; background: #2e6cb5; width: 70px; height: 30px; color: white; border-radius: 5px 5px 5px 5px;text-align:center;"
					 type="button" value="목록" onClick="location.href='list'">

			</form>
		</div>
	</div>		
			<%-- <form name="frm" method="post" action="insert"  enctype="multipart/form-data">
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
			</form> --%>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
$(frm.file).hide();
$(frm.files).hide();

//이미지를 클릭했을때
$("#image").on("click", function(){
	$(frm.file).click();
});

$("#images").on("click", function(){
	$(frm.files).click();
});
$("#btnImage").on("click", function(){
	$(frm.files).click();
});

//파일선택버튼을 눌렀을때(Multi)
$(frm.files).on("change", function(){
	var files=$(frm.files)[0].files;
	var html="";
	
	$.each(files, function(index, files){
		$("#images").hide();
		html += "<img class='details' style='width:1100px' src='" + URL.createObjectURL(files) + "'>";
		$("#listFile").html(html);
	});	
});

$(frm.file).on("change", function(){
	var file=$(frm.file)[0].files[0];
	$("#image").attr("src", URL.createObjectURL(file));
	$("#image").css("max-width","1100px");
});

</script>
</html>