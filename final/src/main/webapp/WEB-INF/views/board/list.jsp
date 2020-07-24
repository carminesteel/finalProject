<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[작품]</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<h1>[작품]</h1>
	<table border=1 id="tbl">
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>제목</td>
			<td>내용</td>
			<td>이미지</td>
			<td>날짜</td>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr class="row">
				<td class="b_no">${vo.b_no}</td>
				<td class="id">${vo.id}</td>
				<td class="title">${vo.title}</td>
				<td class="content">${vo.content}</td>
				<td><img src="display?fileName=${vo.image}" width=100></td>
				<td><fmt:formatDate value="${vo.date}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
<script>
	$(".row").on("click", function(){
		var b_no=$(this).find(".b_no").html();
		alert(b_no);
		location.href="read?b_no="+ b_no;
	});
</script>
</html>