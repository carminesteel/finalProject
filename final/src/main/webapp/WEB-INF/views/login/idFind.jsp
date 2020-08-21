<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<style>
#bg {
   margin-top: 10px;
   position: fixed;
   left: 0;
   position: absolute;
   z-index: -1; /* Preserve aspet ratio */
   width: 1920px;
   height: 1018px;
}

* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
}

body {
   font-family: 'Noto Sans KR', sans-serif;
   display: flex;
   justify-content: center;
   align-items: center;
   background-size: cover;
   overflow: hidden;
}

body::before {
   content: "";
   position: absolute;
   z-index: 1;
   top: 0;
   right: 0;
   buttom: 0;
   left: 0;
}

#tlqkf {
   position: relative;
   z-index: 2;
   background: white;
   padding: 50px;
   height: 720px;
   width: 423px;
   border-radius: 20px;
}

section {
   height: 100%;
}
.int-area {
   width: 315px;
   position: relative;
}

.int-area:first-child {
   margin-top: 0;
}

.int-area input {
   width: 100%;
   padding: 20px 10px 10px;
   border-radius: 25px;
   border: 1px solid #999;
   font-size: 20px;
   color: black;
   outline: none;
   height:38px;
}

.btn-area {
   margin-top: 30px;
}

.btn-area button {
   width: 80px;
   height: 40px;
   background: #2b4163;
   color: #fff;
   font-size: 16px;
   border: none;
   border-radius: 8px;
   cursor: pointer;
   margin-bottom: 6px;
   outline: none;
   padding-bottom:4px;
   float:right;
   margin-right:8px;
}
.caption {
   margin-top: 280px;
   text-align: left;
}

.caption a {
   font-size: 15px;
   color: #2b4163;
   text-decoration: none;
}


</style>
</head>
<body>
   <img src="../display?fileName=loginback.png" id="bg">
   <section class="login-form">
      <div>
         <div style="font-family: Helvetica33-ExtendedThin; font-size: 110px; text-align: left; color: #fff; display: inline-block; margin-top: 50px;">Artists</div>
      </div>
      <div id=tlqkf>
         <span style="font-size: 30px; font-weight: 500; letter-spacing: -2">아이디 찾기</span>
         <br>
         <br>         
            <form name="frm">
            <div class="int-area">
               <h5 style="text-align: left; margin-left: 8px; margin-bottom:4px;">이메일</h5>
               <input type="hidden" id=emailchk value=-1>
               <input type="text" id="word" name="email" value="${email}" autocomplete="off" required>
               <h5 style="margin-left: 40px; margin-top:4px; color:red;">회원가입 당시 입력했던 이메일을 입력해주세요.</h5>      
            </div>
            <div class="btn-area" style="text-align: center;">
               <button class="btn" id="btnId" >찾기</button>
               <br>
            </div>
            <br>
            <br>
            <div class="int-area">
               <input type="text" name="id" id="getId" autocomplete="off" required>
               <h5 style="margin-left: 88px; margin-top:4px; color:blue;">회원가입 당시 입력했던  아이디 입니다.</h5>               
            </div>                                                      
         </form>
         <div class="caption">
            <a href="passFind">비밀번호 찾기</a><br>
            <a href="login">Login Page</a><br>
         </div>
      </div>
   </section>
</body>
<script>
   $(frm).on("click", " #btnId", function() {
      var email = $(frm.email).val();
      $.ajax({
         type : "post",
         url : "/find_id/read",
         data : {"email" : email},
         dataType : "json",
         success : function(data) {
            if (data == 1) {
               $.ajax({
                  type:"post",
                  url:"/find_id/readid",
                  data:{"email" : email},
                  dataType:"json",
                  success : function(data) {
                     $("#getId").val(data.id);
                     $("#getId").prop("readonly","true");
                     alert(id);
                  }
               })
            } else {
               alert("존재하지 않는 이메일 입니다.");

            }
         }

      });
   });
</script>

</html>