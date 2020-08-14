<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<style>
   
   #menu{background-color:white;width:100%;text-align:center;font-family:YDIYGO330;font-size:21px;margin:auto;vertical-align:middle;position:fixed;top:0;left:0;right:0;z-index:999;}
   #logo{font-family:Helvetica83-ExtendedHeavy;font-size:30px;}
   .menuA{text-decoration:none;color:black;}
</style>
</head>
<body style=background-color:white;>

<table id=menu style="height:80px;width:100%;box-shadow:0 5px 15px rgba(0, 0, 0, 0.5);">
   <tr>
      <td id=logo style="margin-top:16px;padding-left:65px;width:150px;"><a class=menuA href="/">Artists</a></td>
      <td>
      	<a class=menuA href="/feed/list" style="margin-left:380px;">피드</a>&emsp;&emsp;&emsp;
      	<a class=menuA href="/board/list">탐색</a>&emsp;&emsp;&emsp;
      	<a class=menuA href="/product/list">아트굿즈</a>&emsp;&emsp;&emsp;
      	<a class=menuA href="/exh/list">전시</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
      </td>
      <c:if test="${position==null}">
      		<td style="width:450px;"><a class=menuA href="/login/login">로그인</a></td>
      </c:if>
      <c:if test="${position==1 || position==2}">
      		<c:if test="${position==1}">
      		
      			<td style="width:450px;">
      			<span style=margin-right:30px;>${id}</span>
      				<c:if test="${position==1 || position==2}">
      					<a class=menuA href="/login/mypage" id=myPage style="margin-right:30px">MyPage</a>
      				</c:if>
      				<a class=menuA href="/login/logout">로그아웃</a>
      			</td>
      		</c:if>
      		<c:if test="${position==2}">
      		
      			<td style=float:right;padding-right:65px;>관리자님&nbsp;&nbsp;<a class=menuA href="/login/logout">로그아웃</a></td>
      		</c:if>
      </c:if>
   </tr>
</table>

</body>
</html>