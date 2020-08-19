<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고신고</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

</head>
<body>

	<h1>신고하기</h1>
	
	<h3>댓글은 이용자 여러분의 자유로운  의견을 나누는 공간입니다.</h3>
	<h6>댓글 삭제 및 글쓰기 제한 대상에 해당되는 경우 댓글 운영자가 사전동의 없이 해당 댓글을 삭제할 수 있으며, 해당 댓글을 게시한 사용자는 일정기간 혹은 영구적으로 댓글 작성이 제한 될 수 있음을 알려드립니다.</h6>
	<form name="frm" method="post" action="updateReport">
	<input type="hidden" name="b_no" value="${param.b_no}">
	<input type="hidden" name="id" value="${id}">
	
		<div>							
			<textarea placeholder="신고 이유를 작성해주세요" name="content" value="${vo.content}"
			style="resize:none;display:inline-block;padding:0px;margin:auto;width:480px;
			height:110px;border:1px solid black;font-size:15px;padding:25px;"></textarea>				
		</div>
		<input type="button" style="text-align:center;" value="취소">
		<input type="submit" style="text-align:center;" value="신고하기">
		<br><br>
		<h4 style="background:black; color:white; text-align:center;">댓글 삭제 및 글쓰기 제한 대상</h4>
		<div style="font-size:10px;">
		<p>➀음란물을 게재 또는 음란 사이트를 링크하거나 유포 등 공공질서 및 미풍양속에 위반되는 경우</p>
		<p>➁다른 회원 또는 제 3자를 비방, 프라이버시 침해, 중상 모략으로 명예를 손상시키는 경우</p>
		<p>➂서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 경우</p>
		<p>➃범죄행위에 관련 된다고 판단되는 경우</p>
		<p>➄타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권 등의 권리를 침해하는 경우</p>
		<p>➅특정제품의 선전 등 기타 상용 목적으로 게시되는 경우</p>
		<p>➆입력된 정보의 무단 개조 및 삭제 할 경우</p>
		<p>➇타 회원의 이용자 ID·비밀번호를 도용 할 경우</p>
		<p>➈사이버 시위 및 게시판 도배 목적으로 같은 글을 반복적으로 올리는 경우</p>
		<p>➉기타 관계 법령에 위반된다고 판단되는 경우</p>
		</div>
	</form>
</body>

<script>
var b_no="${param.b_no}";
 $(frm).submit(function(e){
	e.preventDefault();
	if(!confirm("신고하시겠습니까?")) return;
	var content = $(frm.content).val();
	var id= $(frm.id).val();
	if(content==""){
		alert("내용을 입력해주세요");
	}else{
		$.ajax({
			type:"post",
			url:"reportCnt",
			data:{"b_no":b_no,"id":id},
			success:function(data){
				if(data==0){
					$.ajax({
						type:"post",
						url:"reportInsert",
						data:{"id":id,"b_no":b_no,"content":content},
						success:function(){
							alert("신고되었습니다.");
							window.close();
						}
					})
				}else{
					alert("이미 신고한 게시물 입니다.");
					window.close();
				}
			}
		});
		
	}
 });
</script>
</html>