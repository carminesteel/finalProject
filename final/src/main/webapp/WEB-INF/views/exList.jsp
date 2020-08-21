<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta charset="UTF-8">
<title>Exhibition List</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
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
}

#eTable td {
	width: 200px;
	height: 200px;
}
</style>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="menu.jsp" />
	<div id=exBody>
		<div id=exCenter>
			<div id=eTitle>Exhibition</div>
			<div id=eContent>현재 진행중인 전시에요</div>
			<a href="" class=more><img id=eButton
				src="/display?fileName=eButton.png" /></a> <br>
			<table id=eTable border=1>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>