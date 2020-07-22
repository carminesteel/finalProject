<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type = "text/javascript" src = "https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
</head>
<body>
	<form name="registerform" method="post" enctype="multipart/form-data" action="./register">
        <div class="fieldlabel"><label for="userId">아이디</label></div>
        <div class="formfield"><input type="text" id="userId" name="userId" maxlength="20" value=""></div>
        <div class="fieldlabel"><label for="userPw">패스워드</label></div>
        <div class="formfield">
<input type="password" id="userPw" name="userpPw" maxlength="20" autocomplete="off">
</div>
        <div class="fieldlabel"><label for="userPwCheck">패스워드확인</label></div>
        <div class="formfield">
<input type="password" id="userPwCheck" name="userPwCheck" maxlength="20" autocomplete="off">
</div>
        <div class="fieldlabel"><label for="userName">이름</label></div>
        <div class="formfield"><input type="text" id="userName" name="userName" maxlength="20" value=""></div>
        <div class="fieldlabel"><label for="nickName">닉네임</label></div>
        <div class="formfield"><input type="text" id="nickName" name="nickName" maxlength="20" value=""></div>

        <div class="fieldlabel"><label for="email01">이메일</label></div>
        <div class="formfield"><input type="text" id="email01" name="email01" size="20" maxlength="20" 
             value="" autocomplete="off"><span>@</span>
            <input id="email02" name="email02" list="domains" placeholder="도메인입력/선택">
            <datalist id="domains">
                <option value="naver.com">
                <option value="daum.net">
                <option value="gmail.com">
                <option value="yahoo.co.kr">
            </datalist>
        </div>
        <div class="fieldlabel"><label for="mPhone1">연락처</label></div>
        <div class="formfield">
            <select id="mPhone1" name="mPhone1">
                <option value="010" selected>010</option>
                <option value="011">011</option>
                <option value="016">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            </select>-
            <input id="mPhone2" name="mPhone2" type="number" value="" size="4" maxlength="4" autocomplete="off">-
            <input id="mPhone3" name="mPhone3" type="number" value="" size="4" maxlength="4" autocomplete="off">
        </div>
        <div class="fieldlabel"><label for="profile">프로필사진</label></div>
        <div class="formfield">
            <input type="file" id="profile" name="profile" required>
        </div>
        <div class="btnfield">
            <input type="submit" value="회원가입">
        </div>
    </form>
</body>
<script>
	$(frm).submit(function(e){
		alert("!");
		e.preventDeafult();
		location.href="home.jsp";
		window.close();
	});
</script>
</html>