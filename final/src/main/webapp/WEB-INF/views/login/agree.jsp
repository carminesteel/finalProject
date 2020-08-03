<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_imptdcit-1.0.3.js"
	charset="utf-8"></script>

<style>
.btn-area button {
	width: 100%;
	height: 50px;
	background: #166cea;
	color: #fff;
	font-size: 20px;
	border: none;
	cursor: pointer;
	margin-left:2px;
	margin-bottom:6px;
	outline: none;
}
*{margin: 0;padding: 0;box-sizing: border-box}
body{background-color: #f7f7f7;}
td{padding:10px;}
a{text-decoration: none;}
#joinForm{width: 460px;margin: 0 auto;}
button{width:400px;height:100px;font-size:35px;}
#tab{background:#fff;}
</style>
		
</head>
<body>
	<div  style="">
			<h1 style="font-family:Helvetica33-ExtendedThin; font-size:80px; 
			text-align:left; margin-left:40px; color:black;">Artists</h1>
		</div>
		<br><br>
	<form action="" id="joinForm">
		<table id="tab">
			<tr>
				<td>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두
					동의합니다.</td>
				<td><input type="checkbox" name="chkAll" id="chkAll"></td>
			</tr>
			<tr class="row">
				<td>이용약관 동의(필수)</td>
				<td><input type="checkbox" name="chk" class="chk"></td>
			</tr>
			<tr>
				<td><textarea rows="5" cols="55">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea></td>
			</tr>
			<tr class="row">
				<td>개인정보 수집 및 이용에 대한 안내(필수)</td>
				<td><input type="checkbox" name="chk" class="chk"></td>
			</tr>
			<tr>
				<td><textarea rows="5" cols="55">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea></td>
			</tr>
			<tr class="row">
				<td>위치정보 이용약관 동의(선택)</td>
				<td><input type="checkbox" name="chk" class="chk"></td>
			</tr>
			<tr>
				<td><textarea rows="5" cols="55">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea></td>
			</tr>
			<tr class="row">
				<td>이벤트 등 프로모션 알림 메일 수신(선택)</td>
				<td><input type="checkbox" name="chk" class="chk"></td>
			</tr>
			<tr class="btn-area" style="text-align:center;">
				<td><button id="btn" type="submit">동의</button></td>			
			</tr>
		</table>
	</form>
</body>
<script>
	//전체선택 버튼을 클릭했을때
	$("#tab").on("click", "#chkAll", function() {
		if ($(this).is(":checked")) {
			$("#tab .row .chk").each(function() {
				$(this).prop("checked", true);
			});
		} else {
			$("#tab .row .chk").each(function() {
				$(this).prop("checked", false);
			});
		}
	});
	
	 //회원가입 버튼을 눌렀을 때
	   $("#btn").on("click" , function(){
		   window.open("/login/insert","","width=600, height=800");
		   window.close();
	   })
</script>
</html>