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
	<span style="color: green; font-weight: bold;">입력한 이메일로 받은 인증번호를 입력하세요. (인증번호가 맞아야 다음 단계로 넘어가실 수 있습니다.)</span> <br> <br>    
        <br> <br>  
        <form action="join_injeung.do${dice}" method="post"> //받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인                  
            <br>
            <div>
                  	인증번호 입력 : <input type="number" name="email_injeung" placeholder="  인증번호를 입력하세요. ">
            </div>                                        
            <br> <br>
            <input type="hidden" name="id" value="${id}">
      		<input type="hidden" name="pass" value="${pass}">
      		<input type="hidden" name="name" value="${name}">
      		<input type="hidden" name="nickname" value="${nickname}">
      		<input type="hidden" name="phone" value="${phone}">
      		<input type="hidden" name="email" value="${email}">

            <button type="submit" name="submit">인증번호 전송</button> 
        </form>
</body>
</html>