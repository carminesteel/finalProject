<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 등록</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=285177e645b698276895abf188247b00&libraries=services"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
.image {
	margin: auto;
	padding: 50px;
}
#exBody {
	background-color: #e9ecef;
	z-index: 1;
}

#exCenter {
	padding-top: 150px;
	background-color: white;
	width: 1276px;
	margin: auto;
	z-index: 2;
	padding-bottom: 150px
}

#exhTitle {
	font-family: Noto Sans KR;
	font-weight: bold;
	font-size: 70px;
	height: 90px;
	color: black;
	margin-left: 40px;
}

#exhContent {
	font-size: 30px;
	font-weight: 300;
	width: 600px;
	color: black;
	margin-bottom: 30px;
	margin-left: 40px;
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
#buttonList{
all: unset; 
background: #2e6cb5; 
width: 70px; 
height: 30px; 
color: white; 
border-radius: 5px 5px 5px 5px; 
text-align: center;
}
/* 전시제목 */
#exhName{
margin-bottom: 15px; 
display: inline-block; 
width: 400px; 
height: 47px; 
border: 1px solid black; 
font-size: 30px; 
padding: 30px;
}
/* 전시날짜 */
#exhDete{
margin-bottom: 15px; 
display: inline-block; 
width: 200px; 
height: 47px; 
border: 1px solid black; 
font-size: 20px; 
padding: 30px;
float:right;
margin-right:25px;

}
/* 전시날짜 */
#exhDete2{
margin-bottom: 15px; 
display: inline-block; 
width: 200px; 
height: 47px; 
border: 1px solid black; 
font-size: 20px; 
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
#exhExplain{
resize: none; 
display: inline-block; 
padding: 0px; 
margin: auto; 
width: 500px; 
height: 230px; 
border: 1px solid black; 
font-size: 15px; 
padding: 25px;
}
#exhTel{
margin-bottom: 15px; 
display: inline-block; 
width: 440px; 
height: 50px; 
border: 1px solid black; 
font-size: 20px; 
padding: 30px;
float:right;
}
#btn-box{
display: inline-block;
width: 200px; 
height: 30px;
float:right;
margin-top:-160px;
margin-right:301.99px;
}
#users_address{
display: inline-block;
float:right;
padding: 10px;
border: 1px solid black; 
width:480px;
height:25px;
font-size:19px;
margin-top:-120px;
}
#users_address_detail{
display: inline-block;
float:right;
padding: 10px;
border: 1px solid black; 
width:480px;
height:25px;
font-size:19px;
margin-top:-51px;

}
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div id=exBody>
		<div id=exCenter>
			<div id=exhTitle>Upload</div>
			<form action="insert" name="frm" method="post"enctype="multipart/form-data">
				<div id=exhContent>전시 업로드</div>
				<input type="hidden" value="${id}" name="id">
				<div style="width:1101px;height:1210px;margin:auto;padding:0px;margin-bottom:20px;">
					<input type="text" placeholder="전시명을 입력해주세요." name="title"id="exhName">
					<input type="date" name="date2" id="exhDete2">~
					<input type="date" name="date" id="exhDete">					
					<div id="ProductImage">
						<input type="file" name="file"> <img id="image"	style="display: block; margin: auto; margin-top: 30px; margin-bottom: 30px;"src="/display?fileName=mainIMG.png"> 
						<input type="file" name="files" accept="image/*" multiple><img id="images" src="/display?fileName=detailIMG.png">
					<div id="listFile" style="width: 1100px"></div>
					</div>
					<textarea placeholder="전시 대해 설명해주세요." name="content" id="exhExplain"></textarea>
					<input type="text" placeholder="문의 전화번호" name="tel"id="exhTel">					
					<input type="hidden" id="btn-box" onclick="openAddress();" value="우편번호 찾기">
					
					<input type="text" name="addr" class="box" id="users_address" placeholder="주소" required>
					<input type="hidden" name="post" class="box" id="users_zipCode" placeholder="우편번호"	required>
					<input type="text" name="addr_detail" id="users_address_detail" placeholder="상세주소">
				</div>
				<input	type="submit" value="저장" id="btnOne">
				<input  type="reset" value="취소" id="btnTwo"> 
				<input	type="button" value="목록" id="buttonList">
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
<script>
$(frm.file).hide();
$(frm.files).hide();
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

	/*우편번호*/
	function openAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#users_zipCode").val(data.zonecode);
				$("#users_address").val(data.address);
			}
		}).open();
	}
	
	$("#users_address").on("click", function(){
		openAddress();
	});
</script>
</html>