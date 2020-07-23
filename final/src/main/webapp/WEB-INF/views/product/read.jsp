<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[상품정보]</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>
	<table id=productMenu height=116px>
		<tr>
			<td><a class=menuB href="">BEST</a>&emsp;&emsp;&emsp;<a class=menuB href="">아트굿즈</a>&emsp;&emsp;&emsp;<a class=menuB href="">판매자</a>
		</tr>
	</table>
			<form name="frm" action="update" method="post">
			<input type="hidden" name="bno" value="${read.p_no}">
			
			<table class="tab" border=1>
			<tr>
				<td width=100>제목</td>
				<td><input type="text" name="title" size=50 value="${read.title}"></td>
			</tr>
			<tr>
				<td width=100>이미지</td>
				<td>
					<img src="/display?fileName=${read.image}"/>
				</td>
			</tr>
			<tr>
				<td width=100>내용</td>
				<td>
					<textarea rows="10" cols="52" name="content">${read.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" readonly size=10 value="${read.id}"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>
					<fmt:formatDate value="${read.date}" pattern="yyyy년 MM월 dd일"/>
				</td>
			</tr>
			</table>
			<input type="submit" value="수정">
			<input type="button" value="삭제" id="btnDelete">
			<input type="reset" value="취소">
			<input type="button" value="목록" id="btnList">
		</form>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>