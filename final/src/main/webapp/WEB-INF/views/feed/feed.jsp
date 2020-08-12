<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta charset="UTF-8">
<title>Exhibition List</title>
<style>
#tbl{overflow:hidden;width:1200px; margin:auto;}
	#tbl .row{}

html {
	font-family: Noto Sans KR
}

#exBody {
	background-color: #e9ecef;
	z-index: 1;
	
}

#exCenter {
	background-color: white;
	width: 1186px;
	margin: auto;
	z-index: 2;
	padding: 45px;
}


#eTitle {
	font-family: Noto Sans KR;
	font-weight: bold;
	font-size: 70px;
	height: 80px;
	color:#373e45;
	/* margin-top:5px; */
	margin-left:-2px; 
	letter-spacing:-1.5px
}

#eContent {
	font-size: 30px;
	font-weight: 300;
	width: 600px;
	color:#373e45;
	
}

.tbl{
	margin-top:10px;
}	
</style>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp" />
	<div id=exBody>
		<div id=exCenter>
			<div id=eTitle>Feed</div>
  			<div id=eContent>팔로우중인  Artist의 작품이에요 </div>
  			
			<div id=tbl>
			<c:forEach items="${Flist}" var="fvo">	
				<table class=ftbl>
					<tr>
						<td colspan=4><img src="../display?fileName=${fvo.image}" width=1180 height=500></td>
					</tr>
					<tr>
						<td width=45><img src="../display?fileName=${fvo.u_image}" width=40 height=40 style="border-radius: 50%;"></td>
						<td>${fvo.nickname}<br>${fvo.introduce}</td>
					<tr>
					<tr>
						<td colspan=2>${fvo.title}</td>
					</tr>
					<tr>
						<td colspan=2>${fvo.content}</td>
					</tr>
					<tr>
						<td colspan=2 style="text-align:right;">뷰=${fvo.view} /좋아요=${fvo.b_like} /댓글수=${fvo.r_cnt}</td>
					</tr>
					</table>
			<!-- 댓글 입력 하는곳  -->
					<table class=rtbl>
					<tr class=Rrow>
						<td>
							<input type="hidden" class="b_no" value="${fvo.b_no}">
							<input type="hidden" class="replyer" value="${id}">
							<input type="text" class="content" size=50>
							<input type="button" class="btnInsert" value="입력">
						</td>			
					</tr>
					</table>
				
				
				<!-- 댓글 출력 하는곳  -->
					<table class=tbl1>
						<tr>
							<td width=100>댓글번호</td>
							<td width=100>작성자</td>
							<td width=200>내용</td>
							<td width=170>날짜</td>
							<td width=50></td>
						</tr>
					<c:forEach items="${Rlist}" var="rvo">
						<c:if test="${fvo.b_no==rvo.b_no}">
							<tr class="row">
								<td class="r_no" >${rvo.r_no}</td>
								<td class="replyer" >${rvo.replyer}</td>	
								<td class="content" >${rvo.content}</td>
								<td>${rvo.date}</td>
								
								<c:if test="${id eq rvo.replyer}">
								<td><button class="rbtnDelete">삭제</button></td>
								</c:if>	
							</tr>							
						</c:if>
					</c:forEach>
					</table>
				
			</c:forEach>
			</div>
			<br> <br> <br> <br> <br> <br> <br>
			<br>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
<script>
	var id="${id}";

	$(".rtbl").on("click",".Rrow .btnInsert",function(){
		var row=$(this).parent().parent();
		var b_no=row.find(".b_no").val();
		var replyer=row.find(".replyer").val();
		var content=row.find(".content").val();
		
		if(content==""){
			alert("내용을 입력해주세요");
		}else{
			if(!confirm("입력하시겠습니까?")) return;
			
			$.ajax({
				type:"post",
				url:"/b_reply/insert",
				data:{"b_no":b_no,"replyer":replyer,"content":content},
				success:function(){
					location.reload();
					}
			})
		 }
	})
	
	$(".tbl1").on("click",".row .rbtnDelete",function(){
		
		var row=$(this).parent().parent();
		var r_no=row.find(".r_no").html();
		$.ajax({
		      type:"post",
		      url:"/b_reply/delete",
		      data:{"r_no":r_no},
		      success:function(){
		    	  location.reload();
		      }
		   });
		
	})
</script>
</html>