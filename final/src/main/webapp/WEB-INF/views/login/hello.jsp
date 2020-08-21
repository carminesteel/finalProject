<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
.btn-area button {
	width: 222px;
	height: 50px;
	background: #166cea;
	color: #fff;
	font-size: 20px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	margin-left:2px;
	margin-bottom:6px;
	outline: none;
}
</style>
</head>
<body>
	<div style="text-align:center;">
	<h1>환영합니다!</h1>
	
	<h3>${name}님, 회원가입을 축하합니다!</h3>
	<h3>Artists를 가입하신 아이디는 </h3>
	<h3 style="color=red;">${id}입니다.</h3>
	
	<h4>저희 Artists는 항상 회원님들의 입장에서 보다 좋은 서비스를 받으실 수 있도록 노력하겠습니다.</h4>

	<div class="btn-area" style="text-align: center;">
		<button id="btn">메인으로</button>
		<br>
	</div>
	</div>
</body>
<script>
$(".btn-area").on("click" , "#btn", function(){
	   window.close();
})
</script>
</html>