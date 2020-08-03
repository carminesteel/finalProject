<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" 	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"	charset="utf-8"></script>
<title>Insert title here</title>
</head>

<script type="text/javascript">
	var naver_id_login = new naver_id_login("mqYaOfp45EbLfF5Ed8in","http://localhost:8088/login/naverlogin");
	// 접근 토큰 값 출력
	alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	function naverSignInCallback() { // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		alert(naver_id_login.getProfileData('email')); //
		//alert(naver_id_login.getProfileData('nickname')); //
		location.href = "/loginNaverResult?email="+ naver_id_login.getProfileData('email');
	}
</script>
</html>