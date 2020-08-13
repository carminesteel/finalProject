<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta charset="UTF-8">
<title>Feed List</title>
<style>

.ftbl{
	width:1166px;height:714px; margin:auto;text-align:center;border:1px solid #eeeeee;margin-bottom:27px
}

.icons{
	width:17px;height:17px;
}

	
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
	width: 1280px;
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
	margin-bottom:20px;
	letter-spacing:-1px;
	
}

.tbl{
	margin-top:10px;
}	

#lightBottom{
	width:1166px;
	margin:auto;
}

.btnInsert:hover{
	cursor:pointer;
}


</style>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp" />
	<div id=exBody>
		<div id=exCenter>
			<div id=eTitle>Feed</div>
			<div id=eContent>팔로우 중인 작가들의 소식입니다.</div>

			<div id=lTbl>
				<c:forEach items="${Flist}" var="fvo">
					<div class=ftbl>
						<img class=fimg style="height: 100%; object-fit: contain;"
							src="../display?fileName=${fvo.image}">
					</div>
					<div style="width: 1130px; margin: auto;">
						<span style="display: inline-block; float: left;"> <img
							style="border-radius: 50%;" width=90px height=90px
							src="../display?fileName=${fvo.u_image}" />
						</span> <span
							style="display: inline-block; float: left; margin-left: 18px; margin-top: 18px;">
							<b style="font-size: 20px">${fvo.nickname}</b>&nbsp;&nbsp;<a
							style="all: unset; font-size: 14px; cursor: pointer;">팔로우</a><br>
							<b style="all: unset; color: #93a1a2; font-size: 15px;">${fvo.introduce}</b>
						</span><br>
						<br>
						<br>
						<br>
						<div style="display: inline-block; width: 825px;font-size:33px;margin-bottom:12px">${fvo.title}</div>
						<div style="display: inline-block; width: 100%;font-size:20px;">${fvo.content}</div>
					</div>

					<div id=lightBottom>
						<br>
						<div style="text-align: left; display: inline-block; float: left;">
							<form name="frm" method="post" action="update"
								enctype="multipart/form-data">

								<c:if test="${id==vo.id}">
									<!-- <input style="border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;width:55px;height:28px;font-size:15px;" type="submit" value="수정"> -->
									<input
										style="border: none; background: #2b4163; border-radius: 5px 5px 5px 5px; color: white; width: 55px; height: 28px; font-size: 15px;"
										type="button" value="삭제" id="btnDelete">
								</c:if>
								<input type="button" value="신고하기" id="report"
									style="border: none; background: #2b4163; border-radius: 5px 5px 5px 5px; color: white; width: 75px; height: 28px; font-size: 15px;margin-left:25px;">
							</form>
						</div>


						<div
							style="text-align: right; display: inline-block; float: right;margin-right:25px;margin-bottom:30px;font-size:18px;">
							<img class=icons src="../display?fileName=views.png" />${fvo.view}&nbsp;
							<img class=icons id="LikeBtn" src="../display?fileName=likes.png" /> ${fvo.b_like}&nbsp;
							<img class=icons src="../display?fileName=comment.png" /> ${fvo.r_cnt}
						</div>

						<hr style="width: 1127px;border:solid 1px #b3c6e6;">

						<!-- 댓글 출력 하는곳  -->
						<table class=tbl1 style="margin-top:30px;margin-left:60px;">
							<c:forEach items="${Rlist}" var="rvo">
								<c:if test="${fvo.b_no==rvo.b_no}">
									<tr class="row" style="height:100px;">
										<td><img src="../display?fileName=${rvo.u_image}" style="width:65px;height:65px;border-radius:50%"></td>
										<td class="replyer">${rvo.replyer}</td>
										<td class="content">${rvo.content}</td>
										
										<c:if test="${id eq rvo.replyer}">
											<td><button class="rbtnDelete">삭제</button></td>
										</c:if>
										
									</tr>
								</c:if>
							</c:forEach>
						</table>
						<br>
						<!-- 댓글 입력 하는곳  -->
						<table class=rtbl>
							<tr class=Rrow>
								<td>
								<img width=70 height=70 style="border-radius:50%;float:left;margin-left:20px;" src="../display?fileName=${u_image}"/>
								<input type="hidden" class="b_no" value="${fvo.b_no}">
									<input type="hidden" class="replyer" value="${id}"> 
									<textarea name="content" id=content style=width:1010px;height:80px;resize:none;margin-left:16px;padding:10px; onfocus="this.value='';">댓글을 입력하세요.</textarea>
									<input style="float:right;width:136px;height:38px;border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;margin-right:18px;" type="button" class="btnInsert" value="댓글 남기기"></td>
							</tr>
						</table>

						<br><br>
					</div>
				</c:forEach>
				
			</div>
			<br> <br> <br> <br> <br> <br> <br>
			<br>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />

	<%-- <!-- 댓글 입력 하는곳  -->
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
					</table> --%>
</body>
<script>
	var id="${id}";

	$(".rtbl").on("click",".Rrow .btnInsert",function(){
		var row=$(this).parent().parent();
		var b_no=row.find(".b_no").val();
		var replyer=row.find(".replyer").val();
		var content=row.find("#content").val();
		alert(b_no + replyer + content)
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