<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<style>
#menu {
	background-color: white;
	width: 100%;
	text-align: center;
	font-family: YDIYGO330;
	font-size: 21px;
	margin: auto;
	vertical-align: middle;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 999;
}

#logo {
	font-family: Helvetica83-ExtendedHeavy;
	font-size: 30px;
}

.menuA {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style=background-color:white;>

<table id=menu style="height:80px;width:100%;box-shadow:0 5px 15px rgba(0, 0, 0, 0.5);">
	<tr>
		<td id=logo style=float:left;margin-top:16px;padding-left:65px><a class=menuA href="">Artists</a></td>
		<td><a class=menuA href="">피드</a>&emsp;&emsp;&emsp;<a class=menuA href="">탐색</a>&emsp;&emsp;&emsp;<a class=menuA href="">아트굿즈</a>&emsp;&emsp;&emsp;<a class=menuA href="">전시</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
		<td style=float:right;padding-right:65px;><a class=menuA href="">로그인</a></td>
	</tr>
</table>

</body>
</html>