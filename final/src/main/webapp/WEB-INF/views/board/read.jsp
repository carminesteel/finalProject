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
	<style>
html {
	font-family: Noto Sans Kr;
}



#LikeBtn:hover {
	cursor: pointer;
}

.icons {
	width: 20px;
	height: 20px;
}

body {
	margin: 0;
}

#lightBox {
	display: inline-block;
	width: 100%;
	height:100%;
	position: absolute;
	/* 			top:50%;
			left:50%;
			transform:translate(-50%, -50%); */
	z-index: 899;
}

#lightContent {
	background: white;
	width: 1392px;
	margin: auto;
	padding: 0px;
}

#lightInfo {
	width: 1392px;
	margin: auto;
	background: none;
	vertical-align: middle;
}

#image {
	width: 64px;
	height: 64px;
	border-radius: 50%;
	display: inline-block;
	margin-bottom: 20px;
}

#artInfo {
	margin-top: 20px;
	margin-left: 15px;
	display: inline-block;
	height: 65px;
	color: white;
	font-size: 17px;
}

#lightBottom {
	width: 1130px;
	margin: auto;
}
.lbClose{
	width:35px;
	height:35px;
	position:fixed;
	right:50px;
	top:20px;
	
}
</style>
</head>
<body>
   
	<div id=lightBox>	
	
		<div id=lightInfo>	
			<img class=lbClose src="display?fileName=xiconWhite.png"/>
			<img id="image" src="display?fileName=${vo.u_image}"/>
			<div id=artInfo>
				<b name=title>${vo.title}</b>
				<br>
				${vo.nickname}
			</div>
		</div>
		<div id=lightContent>
		<input type="hidden" name="image" value="${ vo.image }">
			<%-- <img src="display?fileName=${vo.image}"width="100%"/> --%>
			<br><br><br><br>
			<c:forEach items="${list}" var="image">
				<img src="display?fileName=${image}" name="files" width="100%"/>
				<br><br><br><br>
			</c:forEach>
 			<div id=lightBottom>
				<div style="height:100px;width:100%">
					<span style="display:inline-block;float:left;">
						<img style="border-radius:50%;" width=90px height=90px src="display?fileName=${vo.u_image}"/>
					</span>
					<span style="display:inline-block;float:left;margin-left:18px;margin-top:18px;">
						<b style="font-size:20px">${vo.nickname}</b>&nbsp;&nbsp;<a style="all:unset;font-size:14px;cursor:pointer;">팔로우</a><br>
						<b style="all:unset;color:#93a1a2;font-size:15px">${vo.introduce}</b>
					</span>
				</div>
				<div>
					<b style="font-size:30px;">${vo.title}</b>
					<br>
					<b style="all:unset;font-size:20px;">${vo.content}</b>
					<br>
					<div style="display:inline-block;float:right;"></div>
				</div>
				<br>
				<div style=text-align:left;display:inline-block;float:left;>
				<form name="frm" method="post" action="update" enctype="multipart/form-data">
				
					<input type="hidden" name="b_no" value="${vo.b_no}">
					<input type="hidden" name="id" value="${vo.id}">
					<input type="hidden" name="image" value="${vo.image}">
					<c:if test="${id==vo.id}">
						<!-- <input style="border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;width:55px;height:28px;font-size:15px;" type="submit" value="수정"> -->		
						<input style="border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;width:55px;height:28px;font-size:15px;" type="button" value="삭제" id="btnDelete">
					</c:if>
					<input type="button" value="신고하기" id="report" style="border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;width:75px;height:28px;font-size:15px;">
				</form>
				</div>
				
				
				<div style=text-align:right;display:inline-block;float:right;>
					<img class=icons src="display?fileName=views.png"/> ${vo.view}&nbsp;
					<img class=icons id="LikeBtn" src="display?fileName=likes.png"/> ${vo.b_like}&nbsp;
					<img class=icons src="display?fileName=comment.png"/> ${vo.r_cnt}										
				</div>

				<jsp:include page="../b_reply/list.jsp"/> 
			</div> 
		</div>	
	</div>

			
		<%-- 	<form name="frm" method="post" action="update" enctype="multipart/form-data">
	 <c:if test="${id==vo.id}">
		<input type="submit" value="수정">
		<input type="button" value="삭제" id="btnDelete">
		</c:if>
		<input type="button" value="목록" onClick="location.href='list'">
		<input type="button" value="댓글보기" id="btnReply">
		<input type="button" value="댓글숨기기" id="btnReply2">
		<input type="button" value="좋아요/${vo.b_like}" id="LikeBtn">		
	</form>
	<hr>--%>
	

<!-- -------------------------------------------- -->

 <%-- 	<jsp:include page="../menu.jsp"></jsp:include>
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
				<td>
				<input type="text" name="title" value="${vo.title}" size=50>
					<input type="button" value="신고하기" id="report">
				</td>
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
				
						<td>대표이미지</td>
				<td><img id="image" src="display?fileName=${vo.image}" width=150/>
				<input type="file" name="file" />
				</td>
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
		<c:if test="${id==vo.id}">
		<input type="submit" value="수정">
		<input type="button" value="삭제" id="btnDelete">
		</c:if>
		<input type="button" value="목록" onClick="location.href='list'">
		<input type="button" value="댓글보기" id="btnReply">
		<input type="button" value="댓글숨기기" id="btnReply2">
		<input type="button" value="좋아요/${vo.b_like}" id="LikeBtn">
		
	</form>
	<hr>
	<jsp:include page="../b_reply/list.jsp"></jsp:include>
	<jsp:include page="../footer.jsp"></jsp:include>
	  --%>
	 
</body>
<script>


$("#btnReply").hide();

var id="${id}";
var b_no="${vo.b_no}";

$("#report").on("click", function(){
	var b_no="${vo.b_no}";
	window.open("/board/report?b_no="+b_no,"","width=500px, height=400px");
});

$("#LikeBtn").on("click",function(){
	$.ajax({
		type:"post",
		url:"/board/like/update",
		data:{"id":id,"b_no":b_no},
		dataType:"json",
		success:function(data){
			$("#LikeBtn").val("좋아요/"+data);
			location.reload()
		}
	})
})

 $(".lbClose").on("click", function(){
        	modal.style.display = "none";
        	$('html').css("overflow", "scroll");
        	$('html').css("overflow-x", "hidden");
          })

/* $("#btnReply").on("click",function(){
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
}) */

/* $(frm).submit(function(e){
	e.preventDefault();
	if(!confirm("수정하실래요?")) return;
	frm.submit();
	
}); */
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