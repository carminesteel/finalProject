<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
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
	<h1>환영합니다 싀벌련아!!!!</h1>
	
	<h3>창을 닫고 로그인을 해주세요 싀벌련아!!!</h3>
	<h1>asdasas</h1>
	<span>${name}님 환영합니다</span> 



	<div class="btn-area" style="text-align: center;">
		<button id="btn">메인으로</button>
		<br>
	</div>
</body>
<script>
$(".btn-area").on("click" , "#btn", function(){
	   window.close();
})
</script>
</html>