<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
#tbl {
	overflow: hidden;
}

#tbl .row {
	float: left;
	margin: 20px;
}

#tbl .row img {
	width: 200px;
	height: 200px;
}

#tbl .row .date {
	text-align: right;
}
</style>
<meta charset="UTF-8">
<title>[작품]</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>
	<h1>[작품]</h1>
	<div border=1 id="tbl">

		<c:forEach items="${list}" var="vo">
			<div class="row">
				<div class="id">${vo.id}</div>
				<img src="display?fileName=${vo.image}" width=100>
		
				<input type="hidden" class="b_no" value="${vo.b_no}">
				<div class="date">
					<fmt:formatDate value="${vo.date}" pattern="yyyy-MM-dd" />
				</div>


				<div class="title">${vo.title}</div>
				<div class="content">${vo.content}</div>

			</div>
		</c:forEach>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	$("#tbl").on("click",".row img", function() {
		var b_no = $(this).parent().find(".b_no").val();
		location.href = "read?b_no=" + b_no;
	});
</script>
</html>