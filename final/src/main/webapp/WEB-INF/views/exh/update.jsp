<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전시회</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
	.image {margin:auto; padding:50px;}
	</style>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<h1>[전시작품]</h1>
		<input type="hidden" name="e_no" value="${vo.e_no}">
		<table id="tbl2" border=1 width=1000>
			<tr>
				<td class="image" width=400><img src="/display?fileName=${vo.image}"></td>	
				<td width=500>
					<h3><input type="text" value="${vo.title}"></h3>
					<br>
					<br>
					<br>
					<h4>기간&nbsp;&nbsp;<input type="text" value="${vo.date}"></h4>
					<h4>연락처&nbsp;&nbsp;<input type="text" value="${vo.tel}"></h4>
					<h4>장소&nbsp;&nbsp;<input type="text" value="${vo.detail}">&nbsp;&nbsp;<a href="">전시장소</a></h4>
				</td>		
			</tr>
		</table>
		<button>수정</button>
	<hr>
		<span id="infoMenu">상세정보</span>
		<span id="MapMenu">장소/전시장 도면</span>
		<span id="Menu">리뷰(${re})</span>
	<hr>
	<br>
	<div>
		<div id="info">
			<h3>상세정보</h3>
			<div width=500>${vo.content}</div>
			<div class="image" width=400>						
				<c:forEach items="${images}" var="image">
					<img src="/display?fileName=${image}">
				</c:forEach>
			</div>
		</div>
			<div id="map" style="width: 600px; height: 400px;">			
				<jsp:include page="map.jsp"/>
			</div>
		</div>
		<div id="reply">
			<jsp:include page="../e_reply/reply.jsp"/>
		</div>

	<jsp:include page="../footer.jsp"/>
</body>
<script>
	$("#reply").hide();
	$("#map").hide();
	
	$("#Menu").on("click",function(){
		$("#reply").show();
		$("#info").hide();
		$("#map").hide();
	});
	$("#MapMenu").on("click",function(){
		$("#map").show();
		$("#info").hide();
		$("#reply").hide();
	});
	$("#infoMenu").on("click",function(){
		$("#info").show();
		$("#reply").hide();
		$("#map").hide();
	});
	$("#tbl2").on("click","a",function(e){
		$("#map").show();
		$("#info").hide();
		$("#reply").hide();
		e.preventDefault();
	});
</script>
</html>