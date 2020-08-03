<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css" />
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/login.css"/>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=285177e645b698276895abf188247b00&libraries=services"></script>
<style>
/* .help-block 을 일단 보이지 않게 설정 */
#myForm .help-block {
	display: none;
}
/* glyphicon 을 일단 보이지 않게 설정 */
#myForm .glyphicon {
	display: none;
}
</style>

<title>Login Insert</title>
</head>
<body>


	<form name="frm" action="/login/insert" method="post" id="myForm"	enctype="multipart/form-data">
	
		<table width=800 id="signup">
			<tr id=id_row>
				<td><input type="hidden" id=idchk value=-1> <input
					type="text" class="box" placeholder="아이디" name="id" value="${id}" required> 
					<input type="button" id=chkBtn value="중복체크"></td>
			</tr>


			<tr>
				<td><input class="form-control" type="password" name="pass" value="${pass}"
					id="pass" placeholder="비밀번호" /> <span id="pwdRegErr"
					class="help-block">8글자 이상 입력하세요.</span>
			</tr>

			<tr>
				<td><input class="form-control" type="password" name="repass" value="${pass}"
					id="repass" placeholder="비밀번호 확인" /> <span id="rePwdErr"
					class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
			</tr>
			<tr>
				<td><input type="text" class="box" placeholder="이름" name="name" value="${name}"
					required></td>
			</tr>
			<tr>
				<td><input type="text" class="box" placeholder="닉네임" value="${nickname}"
					name="nickname" required></td>
			</tr>

			<tr>
				<td><input type="text" class="box" placeholder="TEL" value="${phone}"
					name="phone" required></td>
			</tr>

			<tr id="email_row">
				<td><input class="form-control" type="text" name="email" id="email" placeholder="email" value="${emali}"/> 
					<input type="button" id="sendMessage" value="이메일 인증">
					<span id="emailErr"	class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
			</tr>

			<tr>
				<td><img id="image" src="http://placehold.it/150x120" width=150 value="${u_image}">
					<input type="file" name="file"></td>
			</tr>
			<tr>
				<td><textarea rows="7" cols="60" name="introduce" value="${introduce}"> 자기를 소개하는 글을 쓰세요 </textarea></td>
			</tr>
			<tr>
				<td><input type="button" class="btn-primary box"
					onclick="openAddress();" value="우편번호 찾기"><br></td>
			</tr>
			<tr>
				<td><input type="hidden" name="post" class="box"
					id="users_zipCode" placeholder="우편번호" required></td>
			</tr>
			<tr>
				<td><input type="text" name="roadAddress" class="box" value="${roadAddress}"
					id="users_address" placeholder="도로명주소" required></td>
			</tr>
			<tr>
				<td><input type="text" name="jibunAddress" class="box" value="${jibunAddress}"
					id="users_addressDetail" placeholder="상세주소" required></td>
			</tr>
			<tr>
				<td><input type="text" name="addr" class="box" value="${addr}"
					id="sample4_jibunAddress" placeholder="주소"></td>
			</tr>
		</table>
		<input type="submit" value="가입"> <input type="reset"
			value="취소">
	</form>
</body>
<script>
	//이메일 인증번호 전송 
	$(frm).on("click", "#email_row #sendMessage", function(){
		frm.action="/member/email";
		frm.method="post";
		frm.submit();
	});

	//아이디 중복체크
	$(frm).on("click", "#id_row #chkBtn", function() {
		var id=$(frm.id).val();
		$.ajax({
			type:"get",
			url:"/insert/read",
			data:{"id":id},
			dataType:"json",
			success:function(data) {
				if (data == 0) {
					$(frm).find("#id_row #idchk").val(data);
					alert("가입 가능한 아이디 입니다.!");
				}else{
					$(frm).find("#id_row #idchk").val(data);
					alert("중복된 아이디가 있습니다.");
				}
			}
		});
	});
	
	//비밀번호 정규식
	$("#repass").keyup(function() {
		var repass=$(this).val();
		var pass=$("#pass").val();
		// 비밀번호 같은지 확인
		if (repass == pass) {//비밀번호 같다면
			$("#rePwdErr").hide();
			successState("#repass");
		} else {//비밀번호 다르다면
			$("#rePwdErr").show();
			errorState("#repass");
		}
	});

	//회원가입 정규식
	$(frm).submit(function(e) {
		e.preventDefault();
		var addr=$(frm.roadAddress).val() + "/" + $(frm.jibunAddress).val();
		$(frm.addr).val(addr);
		var idchk=$(frm).find("#id_row #idchk").val();
		if (idchk == -1) {
			alert("중복체크를 해주세요");
			return;
		} else if (idchk == 1) {
			alert("다른 id를 사용해주세요");
			$(frm.id).focus();
		} else if (idchk == 0) {
			alert("회원가입 완료!!");
			frm.submit();
		}
	});

	//이미지 업로드
	$(frm.file).on("change", function() {
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

	//이메일 정규식
	$("#email")
		.keyup(
				function() {
					var email=$(this).val();
					// 이메일 검증할 정규 표현식
					var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
					if (reg.test(email)) {//정규표현식을 통과 한다면
						$("#emailErr").hide();
						successState("#email");
					} else {//정규표현식을 통과하지 못하면
						$("#emailErr").show();
						errorState("#email");
					}
				});
</script>
<script>
	/*우편번호*/
	function openAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#users_zipCode").val(data.zonecode);
				$("#users_address").val(data.address);
				$("#users_addressDetail").focus();
			}
		}).open();
	}
</script>
</html>