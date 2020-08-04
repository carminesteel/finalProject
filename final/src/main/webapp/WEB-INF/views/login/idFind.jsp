<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>아이디 찾기</title>
<style>

</style>
</head>
<body>
  
	<form name="frm">
		<table width=600>
			<tr id=email_row>
				<td>
				<input type="hidden"id=emailchk value=-1>
				<input type="text"  id="word" name="email"  placeholder="E-Mail"  value="${email}" required>
				<span id=getid></span>			
				</td>
			</tr>	
		
		</table>
		<button type="button" id="btnId" >find</button>
		<button type="button" onclick="history.go(-1);">Cancel</button>	
	</form>
	<jsp:include page="../chat.jsp"/>
	<br><br>
</body>
<script>
	$(frm).on("click" ," #btnId" , function(){
		var email=$(frm.email).val();
		$.ajax({
			type:"post",
			url: "/find_id/read",
			data:{"email":email},
			dataType:"json",
			success:function(data) {
				if(data==1) {
					$.ajax({
						type:"post",
						url: "/find_id/readid",
						data:{"email":email},
						dataType:"json",
						success:function(data) {
							$("#getid").html(data.id);

						}
					})	
				}else{
					alert("존재하지 않는 이메일 입니다.");
					
				}
			}
			
		});		
	});


	

</script>
</html>