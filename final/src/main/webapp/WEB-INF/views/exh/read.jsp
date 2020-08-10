<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전시회</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
	.image {margin:auto; padding:50px;}
	#infoMenu,#MapMenu,#Menu {width:376px;}

	#infoMenu:hover,#MapMenu:hover,#Menu:hover {
         background-color: #373e46;
          color: white;
          cursor: pointer;
      }
    #exBody {
	background-color: #e9ecef;
	z-index: 1;
	}
	
	#exCenter {
		background-color: white;
		width: 1276px;
		margin: auto;
		z-index: 2;
	}  
	</style>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div id=exBody>
		<div id=exCenter>
			<h1>[전시작품]</h1>
			<form action="delete" name="frm" method="post">
				<input type="hidden" name="e_no" value="${vo.e_no}">
				<input type="hidden" value="${id}" name="id">
				<table id="tbl2" style="width:1130px;margin:auto;border-collapse:collapse;">
					<tr>
						<td class="image"><img src="/display?fileName=${vo.image}" width=300 height=500></td>	
						<td width=500>
							<h3>${vo.title}</h3>
							<br>
							<br>
							<br>
							<h4>기간&nbsp;&nbsp;${vo.date}</h4>
							<h4>연락처&nbsp;&nbsp;${vo.tel}</h4>
							<h4>장소&nbsp;&nbsp;${vo.addr_detail}&nbsp;&nbsp;<a href="">전시장소</a></h4>							
							<br><br><br><br><br><br>
							<div style="float:right;"><input type="button" value="목록으로" onClick="location.href='list'"></div>
						</td>		
					</tr>
				</table>
				<c:if test="${id==vo.id}">
					<div id="Allbtn" style="float:right;margin-right:6%; margin-bottom:10px;">
						<input type="button" value="수정" id="eUpdate">
						<input type="button" value="삭제" id="eDelete">
						
					</div>
				</c:if>
			</form>
			<table style="width:1130px;margin:auto;border-collapse:collapse;">
				<tr style="height:100px;border-top:1px solid black;border-bottom:1px solid black;text-align:center;font-family:Noto Sans KR;font-size:25px">
			      <td id="" colspan=3>베스트상품리뷰</td>
			   </tr>
			   <c:forEach items="${review}" var="list" varStatus="status" begin="0" end="2">
				   <tr>
				   <td></td>
				   		<td style="border-bottom:none;font-size:17px;letter-spacing:-1px; margin-auto; margin:50px; magin-bottom:5px; padding:20px; width:500px; text-align:left; border-bottom:1px solid black;">	
				   			<div width=700><b>${list.replyer} : </b>${list.content}</div>
				   			<br>				   		
				   		</td>
				   		<td></td>
				   </tr>
			   </c:forEach>
			   <tr style="padding:10px; margin:10px; height:100px;border-top:1px solid black;border-bottom:1px solid black;text-align:center;font-family:Noto Sans KR;font-size:25px">
			      <td id="infoMenu">상세정보</td>
			      <td id="MapMenu">장소/전시장 도면</td>
			      <td id="Menu">리뷰(<span id="re">${re}</span>)</td>
			   </tr>
			   <tr>
			   		<td colspan=3>
						<div id="info">
							<h3>상세정보</h3>
							<div><pre><c:out value="${vo.content}"/></pre></div>
							<div class="image" width=400>						
								<c:forEach items="${images}" var="image">
									<img src="/display?fileName=${image}">
								</c:forEach>
							</div>
						</div>
						<br>						
						<div id="mapPage">			
							<h3>전시장 주소</h3><h5> ${vo.addr},${vo.addr_detail}</h5>
							<div id="map" style="width: 1100px; margin: auto;"><jsp:include page="map.jsp"/></div>								
						</div>
						<div id="reply">
							<h3>리뷰쓰기</h3><jsp:include page="../e_reply/reply.jsp"/>
						</div>
			   		</td>
			   </tr>
			</table>
			<br>
		</div>
	</div>		
	<jsp:include page="../footer.jsp"/>
</body>
<script>

	$("#reply").hide();
	$("#mapPage").hide();

	$("#Menu").on("click",function(){
		$("#reply").show();
		$("#info").hide();
		$("#mapPage").hide();
	});
	
	$("#MapMenu").on("click",function(){
		$("#mapPage").show();
		$("#info").hide();
		$("#reply").hide();
	});
	$("#infoMenu").on("click",function(){
		$("#info").show();
		$("#reply").hide();
		$("#mapPage").hide();
	});
	$("#tbl2").on("click","a",function(e){
		$("#mapPage").show();
		$("#info").hide();
		$("#reply").hide();
		e.preventDefault();
	});
	//게시글 수정
	$("#eUpdate").on("click",function(){
		location.href="update?e_no="+e_no;
	});
	
	//게시글 삭제
	$("#eDelete").on("click",function(){
		if(!confirm("삭제하시겠습니까?")) return;
		frm.submit();
	});
</script>
</html>