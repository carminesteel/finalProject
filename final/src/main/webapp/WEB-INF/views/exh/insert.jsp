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
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=285177e645b698276895abf188247b00&libraries=services"></script>

</head>
<body>
	<jsp:include page="../menu.jsp" />
	<h1>[전시회 등록]</h1>
	<form action="insert" name="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${vo.id}" name="id">
		<table id="tbl2" border=1>
			<tr>
				<td>대표이미지</td>
				<td><input type="file" name="file"> <img id="image"
					style="float: left;" src="http://placehold.it/100x100" width=300>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td width="350"><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="80" name="content"></textarea></td>
			</tr>
			<tr>
				<th>전시기간</th>
				<td width="350"><input type="date" name="date">~<input
					type="date" name="date2"></td>
			</tr>
			<tr>
				<th>전시회주소</th>
				<td><input type="button" class="btn-primary box"
					onclick="openAddress();" value="우편번호 찾기">
					<input type="text" name="addr" class="box"
					id="users_address" placeholder="주소" required>
					<input type="hidden" name="post" class="box"
					id="users_zipCode" placeholder="우편번호" required>
				</td>
			</tr>
			<tr>
				<th>상세장소</th>
				<td width="350"><input type="text" name="addr_detail"></td>
			</tr>
			<tr>
				<th>문의전화</th>
				<td width="350"><input type="text" name="tel"></td>
			</tr>
			<tr>
				<th>상세내용 이미지</th>
				<td>
					<input type="button" value="상세이미지" id="btnImage">
					<input type="file" name="files" accept="image/*" multiple>
					<div id="listFile"></div>
				</td>
			</tr>
		</table>
		<input type="submit" value="저장"> <input type="reset" value="취소"> 
		<input type="button" value="목록" id="buttonList">
	</form>
	<hr>
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

 	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

	$("#btnImage").on("click", function() {
		$(frm.files).click();
	});

	//다중이미지 업로드
	$(frm.files).on("change", function() {
		var files = $(frm.files)[0].files;
		var html = "";
		$.each(files, function(index, file) {
			html += "<img src='" + URL.createObjectURL(file) + "'>";
		});
		$("#listFile").html(html);
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
</script>
</html>