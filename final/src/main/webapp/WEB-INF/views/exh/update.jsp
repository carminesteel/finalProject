<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전시회</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=285177e645b698276895abf188247b00&libraries=services"></script>
	<style>
		.image {
			margin: auto;
			padding: 50px;
		}
    #exBody {
	background-color: #e9ecef;
	z-index: 1;
	}
	
	#exCenter {
		background-color: white;
		width: 1276px;
		margin: auto;
		z-index: 2;
	} 		
	</style>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp" />
	<div id=exBody>
		<div id=exCenter>
			<form name="frm" action="update" method="post"	enctype="multipart/form-data">
				<input type="hidden" name="e_no" value="${vo.e_no}">
				<input type="hidden" value="${id}" name="id">
				<table id="tbl2" style="width:1130px;margin:auto;border-collapse:collapse;">
					<tr>
						<td class="image">			
							<c:if test="${vo.image!=null && vo.image!=''}">
								<input type="file" name="file" style="display:none;">
								<img src="/display?fileName=${vo.image}" width=300 id="image" style=float:left;>
							</c:if>
							<c:if test="${vo.image==null || vo.image==''}">
								<input type="file" name="file">
								<img id="image" src="http://placehold.it/150x120" width=300 style=float:left;>
							</c:if>
							<input type="hidden" value="${vo.image}" name="image" >
						</td>
						<td width=500>
							<h3>
								Title&nbsp;&nbsp;<input type="text" value="${vo.title}" name="title">
							</h3> <br> <br> <br>
							<h4>
								기간&nbsp;&nbsp;<input type="date" name="date" value="${vo.date}">~<input type="date" name="date2" value="${vo.date}">
							</h4>
							<h4>
								연락처&nbsp;&nbsp;<input type="text" value="${vo.tel}" name="tel">
							</h4>
							<h4>전시장소</h4>
							<input type="button" class="btn-primary box" onclick="openAddress();" value="우편번호 찾기">
							<input type="hidden" name="post" class="box" id="users_zipCode" placeholder="우편번호" required>
							<input type="text" name="addr" class="box" value="${vo.addr}"
								id="users_address" placeholder="주소" required>					
							<h4>
								상세주소&nbsp;&nbsp;<input type="text" value="${vo.addr_detail}"
									name="addr_detail">
							</h4>
						</td>
					</tr>
				</table>
				<br>
				<div style="float:right;margin-right:6%; margin-bottom:10px;">
					<input type="submit" value="수정" >		
				</div>
				<div>
					<div id="info" style="width:1130px;margin:auto;border-collapse:collapse;">
						<h3>상세정보</h3>
						<div>
							<textarea rows="20" cols="100" name="content">${vo.content}</textarea>
						</div>
						<div class="images" width=400>
							<input type="file" name="files" accept="image/*" multiple style="display:none;">									
							<div id="listFile">
								<c:forEach items="${images}" var="image">
									<img id="images" src="/display?fileName=${image}">						
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
<script>

	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("수정하시겠습니까?"))
			return;
		frm.submit();
	});
 
	$("#images").on("click", function() {
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
	
	$("#image").on("click",function(){
		$(frm.file).click();
	});
	
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src",URL.createObjectURL(file));
	});

	$("#reply").hide();
	$("#map").hide();

	$("#Menu").on("click", function() {
		$("#reply").show();
		$("#info").hide();
		$("#map").hide();
	});
	$("#MapMenu").on("click", function() {
		$("#map").show();
		$("#info").hide();
		$("#reply").hide();
	});
	$("#infoMenu").on("click", function() {
		$("#info").show();
		$("#reply").hide();
		$("#map").hide();
	});
	$("#tbl2").on("click", "a", function(e) {
		$("#map").show();
		$("#info").hide();
		$("#reply").hide();
		e.preventDefault();
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