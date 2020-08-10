<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css" />
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<title>마이페이지</title>
<style>


</style>
</head>
<body>
   <form name="frm" method="post" action="update">
      <table width=600>
         <tr id=id_row>
            <td><input type="hidden" id=idChk value=-1></td>
         </tr>
         <tr>
            <td>
            	<input type="text" name="id" placeholder="ID" value="" required>
            	<input type="button" id="btnId" value="아이디 확인">
            </td>
         </tr>
         <tr>
            <td><span id=getEmail></span></td>
         </tr>

         <tr id="email_row">
            <td><input class="form-control" type="text" name="email" id="email" placeholder="email" value="" />
             <input type="button" id="sendMessage" value="이메일 인증">
              <span id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다.</span>
         </tr>

         <tr id="chkEmail" style="display: none">
            <td><input type="hidden" id=dice>
                              인증번호 입력 : <input type="number" name="emailPass_injeung" placeholder="인증번호를 입력하세요. ">
               <button name="emailPass_injeung_btn">확인</button> <input type="hidden" id="injeung" value=0></td>
         </tr>
         
         <tr class="showPass">
	         <td>새로운 비밀번호:&nbsp;&nbsp;&nbsp;
	         <input type="password" name="pass" placeholder="PassWord" value="" required></td>
       	 </tr>
       	 <tr class="showPass">
	         <td>새로운 비밀번호 확인:
	         <input type="password" name="pass" placeholder="PassWord" value="" required>
	         <input type="submit" id="passUpdate" value="비밀번호 변경">
	         </td>
       	 </tr>
      </table>
      <button type="button" onclick="history.go(-1);">Cancel</button>
   </form>
   <jsp:include page="../chat.jsp" />
   <br>
   <br>
</body>
<script>
$(".showPass").hide();


   $(frm).on("click", " #btnId", function() {
      var id = $(frm.id).val();
      $.ajax({
         type:"post",
         url:"/find_email/read",
         data:{"id":id},
         dataType:"json",
         success:function(data) {
            if (data == 1) {
               $.ajax({
                  type:"post",
                  url:"/find_email/readEmail",
                  data:{"id":id},
                  dataType:"json",
                  success:function(data) {
                     $(frm.email).val(data.email);
                  }
               })
            } else {
               alert("존재하지 않는 아이디 입니다.");

            }
         }
      });
   });

   //이메일 인증번호 전송 
   $(frm).on("click", "#email_row #sendMessage", function(e) {
      e.preventDefault();
      var email = $(frm.email).val();
      if (email != "") {
         $.ajax({
            type:"post",
            url:"/memberPass/auth.do",
            data:{"e_mail":email},
            success:function(data) {
               alert("인증번호를 발송하였습니다.");
               $("#dice").val(data);
               $("#chkEmail").show();
               
            }
         })

      } else {
         alert("Email을 입력해주세요");
      }
   });

   $(frm.emailPass_injeung_btn).on("click", function(e) {
	   e.preventDefault();
      var dice = $("#dice").val();
      var chkNum = $(frm.emailPass_injeung).val();
      if (chkNum != "") {
         $.ajax({
            type:"post",
            url:"/memberPass/join_injeung.do",
            data:{"emailPass_injeung":chkNum,"dice":dice},
            dataType:"json",
            success:function(data) {
               if (data == 1) {
                  alert("인증이 성공되었습니다.");
                  $("#injeung").val(1);
                  $(".showPass").show();	                                 
               } else {
                  alert("인증이 실패하였습니다.");
               }
            }
         })
      } else {
         alert("인증번호를 입력해주세요");
      }
   })
   
   $("#passUpdate").click(function(e){
	   e.preventDefault();
	   var id = $(frm.id).val();
	   var pass = $(frm.pass).val();
    if(!confirm("비밀번호를 변경하시겠습니까?")) return;
                  
  	$.ajax({
  		type:"post",
  		url:"/login/passFind/update",
  		data:{"id":id,"pass":pass},
  		success:function(){
  			alert("비밀번호가 변경되었습니다.");
  			location.href="/login/login";
  		}
  		
  	});   
   })
</script>

</html>