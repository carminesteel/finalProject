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

#eTitle {
	font-family: Noto Sans KR;
	font-weight: bold;
	font-size: 50px
}

#eButton {
	position: relative;
	z-index: 50;
	left: 1100px;
}

#eTable {
	margin: auto;
	border-collapse: collapse;
	padding: 20px;
}

#eTable td {
	width: 300px;
	height: 500px;
	padding: 20px;
}
      .box{width:318px;float:left;text-align:center; margin:auto;}
      .image{width:280px; height:320px; margin:auto; margin-bottom:5px;}
</style>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp" />
	<div id=exBody>
		<div id=exCenter>
			<div id=eTitle>Exhibition</div>
			<div id=eContent>현재 진행중인 전시에요</div>
				<c:if test="${id!=null}">		
					<a href="/exh/insert" class=more><img id=eButton src="/display?fileName=eButton.png" /></a> <br>
				</c:if>	
				<table id=eTable border=1>
				<c:forEach items="${list}" var="vo">
					<tr class="box">				
						<td>
							<input type="hidden" value="${vo.e_no}" class="e_no">	
							<img class="image" src="/display?fileName=${vo.image}">
							<br>
							<br>
							<br>
							<br>
							${vo.title}
							<br>
							기간 :${vo.date}
							<br>
							장소 :${vo.addr_detail}
							<br>
						</td>
					</tr>
				</c:forEach>
				</table>
			
			<br> <br> <br> <br> <br> <br> <br>
			<br>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
<script>
	var e_no;
	
	$(".box").on("click",function(e){
		e.preventDefault();
		var e_no= $(this).find(".e_no").val();
		location.href="read?e_no="+e_no;
	});
</script>
</html>