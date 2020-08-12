<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta charset="UTF-8">
<title>Exhibition List</title>
<style>
html {
	font-family: Noto Sans KR
}

#exBody {
	background-color: #e9ecef;
	z-index: 1;
}

#exCenter {
	background-color: white;
	width: 1186px;
	margin: auto;
	z-index: 2;
	padding: 45px;
}

#eTitle {
	font-family: Noto Sans KR;
	font-weight: bold;
	font-size: 70px;
	height: 80px;
	color:#373e45;
}

#eButton {
	position: relative;
	z-index: 50;
	left: 1100px;
}

.eTable {
	width: 210px;
	height:434px;
	margin: auto;
	border-collapse: collapse;
	padding: 40px;
	display: inline-block;
	text-align:center;
	border:1px solid #eeeeee;
}

.box {
	
	float: left;
	text-align: center;
	margin:0px;
	padding:0px;
	display: inline-block;
	
}

.image {
	width: 210px;
	height: 292px;
	margin: auto;
	margin-bottom: 5px;
}

#eContent {
	font-size: 30px;
	font-weight: 300;
	width: 600px;
	color:#373e45
}
</style>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp" />
	<div id=exBody>
		<div id=exCenter>
			<div id=eTitle>Exhibition</div>
			<div id=eContent>현재 진행중인 전시에요</div>
				
				<c:if test="${id!=null}">		
					<a style="position:absolute;left:340px;top:210px;" href="/exh/insert" class=more>
					<img id=eButton src="/display?fileName=eButton.png" /></a>
				</c:if>
					
				<br>
				<c:forEach items="${list}" var="vo">
					<div class=eTable>
						<div class="box">				
							
								<input type="hidden" value="${vo.e_no}" class="e_no">	
								<img class="image" src="/display?fileName=${vo.image}">
								<div style="all:unset;display:inline-block;width:210px;text-align:left;">
								<span style="font-size:18px;"><b>${vo.title}</b></span><br>
								<span style="color:#9da2a8;font-size:12px">${vo.date}</span><br>
								<span>${vo.addr_detail}</span>
								</div>
						</div>
					</div>
				</c:forEach>
				
			
			<br> <br> <br> <br> <br> <br> <br>
			<br>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
<script>
	var e_no;
	
	mouseExh();
	
	function mouseExh(){
		$(".eTable").mouseover(function(){
			
			$(this).css('cursor','pointer');
			$(this).css('box-shadow','inset 0px 0px 5px 3px #eeeeee');
		})
		
		$(".eTable").mouseout(function(){
			$(this).css('border','1px solid #eeeeee');
			$(this).css('box-shadow','');
		})
	}
	
	$(".box").on("click",function(e){
		e.preventDefault();
		var e_no= $(this).find(".e_no").val();
		location.href="read?e_no="+e_no;
	});
</script>
</html>