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
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	html{
		font-family:Noto Sans Kr;
	}
	
	body{
		overflow-x:hidden;
	}
	.image {margin:auto; padding:30px;text-align:center;border:1px solid gray;width:550px;}
	#infoMenu,#MapMenu,#Menu {width:240px;font-size:18px;}

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
<body style="margin:0">
	<jsp:include page="../menu.jsp"/>
	<div id=exBody>
		<div id=exCenter>
			<h1>[전시작품]</h1>
			<form action="delete" name="frm" method="post">
				<input type="hidden" name="e_no" value="${vo.e_no}">
				<input type="hidden" value="${id}" name="id">
				<table id="tbl2" style="width:1035px;height:352px;margin:auto;border-collapse:collapse;border:1px solid black;margin-top:80px;">
					<tr>
						<td class="image" width=268px style="padding:5px;"><img src="/display?fileName=${vo.image}" style="object-fit:contain;max-width:268px"></td>	
						<td style="padding:0;border-left:1px solid black;width:772px;">
							<div style="display:block;color:#373e45;font-size:26px;font-weight:700;letter-spacing:-1px;text-align:center;margin-bottom:60px;margin-top:0px;">${vo.title}</div>
							<div style="width:520px;margin:auto;vertical-align:middle;font-size:20px;font-weight:300;color:#373e45">							
							<span style="display:inline-block;font-weight:bold;font-size:18px;">기간<br><br>연락처<br><br>장소<!-- <a href="">전시장소</a> --></span>
							<span style="display:inline-block;padding-left:30px;font-size:18px;">${vo.date}<br><br>${vo.tel}<br><br>${vo.addr_detail}</span>						
							</div>
							<!-- <div style="float:right;"><input type="button" value="목록으로" onClick="location.href='list'"></div> -->
						</td>
					</tr>
				</table>
				<br><br><br>
				<c:if test="${id==vo.id}">
					<div id="Allbtn" style="float:right;margin-right:6%; margin-bottom:10px;">
						<input type="button" value="수정" id="eUpdate">
						<input type="button" value="삭제" id="eDelete">
						
					</div>
				</c:if>
			</form>
			<table style="width:850px;margin:auto;border-collapse:collapse;">
				<%-- <tr style="height:100px;border-top:1px solid black;border-bottom:1px solid black;text-align:center;font-family:Noto Sans KR;font-size:25px">
			      <td id="" colspan=3>베스트 리뷰</td>
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
			   </c:forEach> --%>
			   <tr style="padding:10px; margin:10px; height:80px;border-top:1px solid black;border-bottom:1px solid black;text-align:center;font-family:Noto Sans KR;font-size:25px">
			      <td id="infoMenu">상세정보</td>
			      <td id="MapMenu">장소/전시장 도면</td>
			      <td id="Menu">리뷰(<span id="re">${re}</span>)</td>
			   </tr>
				<tr>
					<td colspan=3>
						<div id="info">
							<br>
							<h3 style="text-align: center;">상세정보</h3><br>
							<div
								style="text-align: none; width: 510px; margin: auto;letter-spacing:-1px;font-size:15px; border: 1px solid gray; padding: 50px; white-space: pre-line;">
								<c:out value="${vo.content}" />
							</div>
							<br>
							<div class="image" >
								<c:forEach items="${images}" var="image">
									<img style="max-width: 100%; object-fit: contain; margin: auto;"
										src="/display?fileName=${image}">
								</c:forEach>
							</div>
						</div> <br>
						<div id="mapPage">
							<h3 style="text-align: center;">전시장 주소</h3>
							<h5 style="font-size:17px;text-align:center;font-weight:300">${vo.addr},${vo.addr_detail}</h5>
							<div id="map" style="width: 840px; margin: auto;"><jsp:include
									page="map.jsp" /></div>
						</div>
								
						
						<div id="reply" width=650px>
						<div
							style="padding-bottom:20px;height: 67px;border-bottom: 1px solid black; text-align: center; font-family: Noto Sans KR; font-size: 18px;line-height:67px;font-weight:600;width:530px;margin:auto;">
							베스트 리뷰
					   </div>
					   <c:forEach items="${review}" var="list" varStatus="status"
							begin="0" end="2">						  
						   		<div
									style="vertical-align:middle;border-bottom:none;font-size:17px;letter-spacing:-1px;margin:auto;magin-bottom:5px;padding:15px;padding-bottom:0px; padding-top:15px; width:500px; text-align:left; border-bottom:1px solid black;">	
						   			<div width=700><b style="font-size:20px;">${list.replyer} <br> </b>${list.content}</div>
						   			<br>
						   		</div>						   
					   </c:forEach>
							<h3 style="text-align: center;font-weight:400">리뷰</h3>
							
							<div style="text-align:center;width:500px;margin:auto;"><jsp:include page="../e_reply/reply.jsp" /></div>
						
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

	$("#Menu").on("click", function() {
		$("#reply").show();
		$("#info").hide();
		$("#mapPage").hide();
	});

	$("#MapMenu").on("click", function() {
		$("#mapPage").show();
		$("#info").hide();
		$("#reply").hide();
	});
	$("#infoMenu").on("click", function() {
		$("#info").show();
		$("#reply").hide();
		$("#mapPage").hide();
	});
	$("#tbl2").on("click", "a", function(e) {
		$("#mapPage").show();
		$("#info").hide();
		$("#reply").hide();
		e.preventDefault();
	});
	//게시글 수정
	$("#eUpdate").on("click", function() {
		location.href = "update?e_no=" + e_no;
	});

	//게시글 삭제
	$("#eDelete").on("click", function() {
		if (!confirm("삭제하시겠습니까?"))
			return;
		frm.submit();
	});
</script>
</html>