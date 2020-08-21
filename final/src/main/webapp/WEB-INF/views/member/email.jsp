<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
</style>
</head>
<body>	
      <form action="auth.do" method="post">
       <div>
                            이메일 :<input type="email" name="e_mail" placeholder="이메일주소를 입력하세요.">
       </div>
      <br>
     <input type="hidden" name="id" value="${id}">
     <input type="hidden" name="pass" value="${pass}">
     <input type="hidden" name="name" value="${name}">
     <input type="hidden" name="nickname" value="${nickname}">
     <input type="hidden" name="phone" value="${phone}">
     <input type="hidden" name="email" value="${email}">

      <button type="submit" name="submit">이메일 인증받기 (이메일 보내기)</button>
     
      </form>       
</body>
</html>