<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/login.css" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=285177e645b698276895abf188247b00&libraries=services"></script>
<style>

</style>
<title>김홍철 시발!!!!</title>
</head>
<body>
	<form name="frm" action="insert" method="post">
		<table width=800 id="signup">
			<tr id=id_row>
				<td><input type="hidden" id=idchk value=-1>
				<input type="text" class="box" placeholder="아이디" name="id" required>
				<input type="button" id=chkBtn value="중복체크"></td>				
			</tr>			
			<tr>
				<td><input type="password" class="box" placeholder="비밀번호" name="pass" required
					></td>
			</tr>
			<tr>
				<td><input type="password" class="box" placeholder="비밀번호 확인" name="passwordConfirm" required></td>
			</tr>
			<tr>
				<td><input type="text" class="box" placeholder="이름" name="name" required></td>
			</tr>
			<tr>
				<td><input type="text" class="box" placeholder="닉네임" name="nickname" required></td>
			</tr>
			
			<tr>
				<td><input type="text" class="box" placeholder="TEL" name="phone" required></td>
			</tr>
			<tr>
				<td><input type="text" class="box" placeholder="이메일" name="email" required></td>
			</tr>
			<tr>
				<td><input type="button" class="btn-primary box"
					onclick="openAddress();" value="우편번호 찾기"><br></td>
			</tr>			
			<tr>
				<td><input type="hidden" name="post" class="box" id="users_zipCode"
					placeholder="우편번호" required></td>
			</tr>
			<tr>
				<td><input type="text" name="roadAddress" class="box"
					id="users_address" placeholder="도로명주소" required></td>
			</tr>
			<tr>
				<td><input type="text" name="jibunAddress" class="box"
					id="users_addressDetail" placeholder="상세주소" required></td>
			</tr>
						<tr>
				<td><input type="text" name="addr" class="box"
					id="sample4_jibunAddress" placeholder="주소"></td>
			</tr>
		</table>
		<input type="submit" value="가입"> 
		<input type="reset"	value="취소">
	</form>
</body>
<script>

$(frm).on("click", "#id_row #chkBtn", function() {
	var id = $(frm.id).val();
	$.ajax({
		type:"get",
		url:"/insert/read",
		data:{"id" : id},
		dataType : "json",
		success : function(data) {
			if (data == 0) {
				$(frm).find("#id_row #idchk").val(data);
				alert("가입 가능한 아이디 입니다.!");
			} else {
				$(frm).find("#id_row #idchk").val(data);
				alert("중복된 아이디가 있습니다.");
			}
		}
	});
});

	$(frm).submit(function(e){
		e.preventDefault();
		var addr=$(frm.roadAddress).val()+"/"+$(frm.jibunAddress).val();
		$(frm.addr).val(addr);
		var idchk=$(frm).find("#id_row #idchk").val();
		if(idchk==-1){
			alert("중복체크를 해주세요");
			return;
		}else if(idchk==1){
			alert("다른 id를 사용해주세요");
			$(frm.id).focus();
		}else if(idchk==0){
			alert("회원가입 완료!!");	
			frm.submit();			
		}
	});

</script>
<script>
/*우편번호*/
function openAddress() {
   new daum.Postcode({
      oncomplete:function(data) {
         $("#users_zipCode").val(data.zonecode);
         $("#users_address").val(data.address);
         $("#users_addressDetail").focus();
         }
   }).open();
}
</script>
</html>