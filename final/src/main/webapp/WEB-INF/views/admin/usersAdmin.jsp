<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
html {
	font-family: Noto Sans KR;
}

.myImgs {
	width: 343px;
	height: 272px;
	object-fit: cover;
	border-radius:3px 3px 3px 3px;
}

#confirm {
	all: unset;
	border: 1px solid white;
	color: white;
	margin-left: 10px;
	width: 40px;
	height: 30px;
	border-radius: 5px 5px 5px 5px;
}

#confirm:hover {
	cursor: pointer;
}
#passChk {
	text-align: center;
	width: 800px;
	height: 400px;
	float: center;
	margin: auto;
	padding-top:150px;
}

input[type="password"] {
	height: 30px;
	border-radius: 5px 5px 5px 5px
}

#warning {
	color: white;
	display: inline-block;
	float: left;
	height: 150px;
	width: 400px;
	text-align: left;
	margin-left: 50px;
	font-size: 20px;
	font-weight: 300;
	line-height: 2.0;
}

#btn {
	all: unset;
	background: #2e6cb5;
	width: 200px;
	height: 35px;
	color: white;
	border-radius: 20px 20px 20px 20px;
}

#btn:hover {
	cursor: pointer;
}

#blist {
	width: 1118px;
	height: 886px;
}


/* #userRead {
	border: 2px solid black; width:304px;
	margin-left:10px;
	text-align: center;
	overflow:hidden;
	display:inline-block;
	float:left
} */

#userRead {
	width: 304px;
	height: 478px;
	margin-right: 30px;
	text-align: center;
	overflow: hidden;
	display: inline-block;
	float: left;
	background: white;
	padding: 26px;
	border-radius: 5px 5px 5px 5px;
}

#usertable{
	float:left;
}

#userRead table{margin:auto;}

#userRead td{padding:7px;}

.btn-area button {
	width: 300px;
	height: 38px;
	background: #166cea;
	color: #fff;
	font-size: 15px;
	border: none;
	border-radius: 40px;
	cursor: pointer;
	margin-left: 2px;
	margin-bottom: 6px;
	outline: none;
}

#u_list {display:inline-block;}

.mypageItems:hover{cursor:pointer;}

.mypageItems {
	font-weight: light;
	font-size: 20px;
	margin-right: 10px;
	display: inline-block;
	float: left;
	width: 80px;
	height: 40px
}

/* .creatertab {
   background: white;
   width: 300px;
   height: 100px;
   float: left;
   margin: auto;
} */

#pTitle {
	font-weight: bold;
	font-size: 70px;
	color: white;
}

#pContent {
	font-weight: 200;
	font-size: 30px;
	color: white;
}

.infoC {
	width: 100%;
	text-align: center;
	margin-top:50px;
	
}

.left {
	margin-left:100px;
	margin-right:100px;
	width: 122px;
	display: inline-block;
	height: 35px;
	font-size:30px;
}
.left:hover {
	cursor:pointer;
}



.right {
	width: 122px;
	display: inline-block;
	font-size: 17px;
	height: 35px;
	text-align: right;
}

.creatertab {
	border:1px solid #ededed;
	width: 550px;
	height: 138px;
	float: left;
	margin: auto;
	margin-left:10px;
	margin-bottom:10px;
	border-radius:5px 5px 5px 5px;
}

.imgList {
	display: inline-block;
	float: left;
	margin: 17px
}



</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>마이페이지</title>

</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;height:100%;background:#2b4163;">
	<jsp:include page="../menu.jsp" />
	<div class="infoC">
						<div class=left id=user>유저관리</div>
						<div class=left id=report>신고목록</div>
					</div>
	<div id=userList style="background:#2b4163;height:1080px;padding:80px;padding-top:0px;padding-left:120px;">		
					
		<table style="color:white;margin:auto;padding:50px;height:500px;width:1400px;">
			<tr>
				<td>ID</td>
				<td>Name</td>
				<td>Nick_Name</td>
				<td>Phone</td>
				<td>Address</td>
				<td>Email</td>
				<td>Position</td>
				<td>Edit Position</td>
			</tr>
			<c:forEach items="${user}" var="vo">
			<tr class=row>
				<td class=id>${vo.id}</td>
				<td>${vo.name}</td>
				<td>${vo.nickname}</td>
				<td>${vo.phone}</td>
				<td>${vo.addr}</td>
				<td>${vo.email}</td>
				<c:if test="${vo.position==1}">
					<td>일반 회원</td>
				</c:if>
				<c:if test="${vo.position==2}">
					<td>관리자</td>
				</c:if>
				<c:if test="${vo.position==3}">
					<td>블럭처리</td>
				</c:if>
				<c:if test="${vo.position==4}">
					<td>회원 탈퇴</td>
				</c:if>
				<td>
					<select style="height:26px" class=SelectPosition>
						<c:if test="${vo.position==1}">
							<option value=1 selected disabled>일반 회원</option>
							<option value=2>관리자</option>
							<option value=3>블럭처리</option>
							<option value=4>회원 탈퇴</option>
						</c:if>
						<c:if test="${vo.position==2}">
							<option value=1 disabled>일반 회원</option>
							<option value=2 disabled selected >관리자</option>
							<option value=3 disabled>블럭처리</option>
							<option value=4 disabled>회원 탈퇴</option>
						</c:if>
						<c:if test="${vo.position==3}">
							<option value=1>일반 회원</option>
							<option value=2>관리자</option>
							<option value=3 selected disabled>블럭처리</option>
							<option value=4>회원 탈퇴</option>
						</c:if>
						<c:if test="${vo.position==4}">
							<option value=1>일반 회원</option>
							<option value=2>관리자</option>
							<option value=3>블럭처리</option>
							<option value=4 selected disabled>회원 탈퇴</option>
						</c:if>
					</select>
				</td>
			</tr>
			</c:forEach>
		</table>
		<br><br>
		<div id="pagination" style="text-align:center;">
            <c:if test="${pm.prev}">
               <a href="${pm.startPage-1}">◀</a>
            </c:if>
            <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
               <c:if test="${pm.cri.page == i }">
                [<a href="${i}" class='active' style="color:white;">${i}</a>]
            </c:if>
               <c:if test="${pm.cri.page != i }">
                [<a href="${i}" style="color:white;">${i}</a>]
            </c:if>
            </c:forEach>
            <c:if test="${pm.next}">
               <a href="${pm.endPage+1}">▶</a>
            </c:if>
         </div>
	</div>
	<div id=reportList style="background:#2b4163;height:100%;padding:80px;padding-top:0px;padding-left:120px;">
	<div style="color:white;margin:auto;padding:50px;height:hidden;width:1400px;text-align:center;">
			<c:if test="${cnt!=0}">
				<div>ID/ Title/ Content/ Image/ Date/ Report/ Reason</div>
		
			
			<c:forEach items="${report}" var="vo">
			<div>
				<div>${vo.id}/ ${vo.title}/ ${vo.content}/ 
				<img src="../display?fileName=${vo.image}" width=100 height=100>/ ${vo.date}/ ${vo.report}/ 
				<input type="button" class="reason" value="Reason ↓">
				
				<input type="button"  b_no="${vo.b_no}" class=disable value="제한해제">
				
				</div>
			
			<!-- <tr class="ReportList" style="display:none;"> -->
				
					<c:forEach items="${reportContent}" var="report">
					<c:if test="${vo.b_no==report.b_no}">
					<div class="ReportList" style="display:none;">
							${report.b_no}/////
							${report.id}/
							${report.content}/
							${report.date}
					</div>
					</c:if>
					 </c:forEach>
				
			<!-- </tr> -->
			</div>
			</c:forEach>
			</c:if>
			<c:if test="${cnt==0}">
				<h1>출력이 제한된 게시물이 없습니다.</h1>
			</c:if>
			</div>
			
			
		</div>
	<br>
	<br>
	<br>
	<jsp:include page="../footer.jsp" />
</body>
<script>
$("#reportList").hide();

$(".reason").click(function(){
	var reason=$(this).val();
	
	if(reason=="Reason ↓"){
		$(this).val("Reason ↑");
		$(this).parent().parent().find(".ReportList").prop("style","display:block;");
			}
		
	else{
		$(this).val("Reason ↓");
		$(this).parent().parent().find(".ReportList").prop("style","display:none;");
	}
	
}) 

$(".disable").click(function(){
	var b_no=$(this).attr("b_no");
	var div=$(this).parent();
	if(!confirm("다시 출력 허용하시겠습니까?")) return;
	$.ajax({
		type:"post",
		url:"/admin/boardReportZero",
		data:{"b_no":b_no},
		success:function(){
			alert("해당 게시물의 제한이 풀렸습니다.");
			div.prop("style","display:none");
		}
	})
})

$("#user").click(function(){
	$("#userList").show();
	$("#reportList").hide();
})

$("#report").click(function(){
	$("#userList").hide();
	$("#reportList").show();
})
var page=1;	
$("#pagination").on("click", "a", function(e) {
    e.preventDefault();
    page = $(this).attr("href");
    location.href="/admin/usersAdmin?page="+page;  
 });
 

$(".SelectPosition").change(function(){
	if(!confirm("회원의 포지션을 "+$(this).find("option:selected").text()+"(으)로 변경하시겠습니까?")) return;
	var position=$(this).val();
	var id=$(this).parent().parent().find(".id").text();
	if(position==2){
		if(!confirm("정말로 관리자 권한을 부여하시겠습니까?")) return;
	}
	 $.ajax({
		type:"post",
		url:"/admin/positionChange",
		data:{"id":id,"position":position},
		success:function(){
			alert("포지션이 변경되었습니다.");
			page=${param.page};
			location.href="/admin/usersAdmin?page="+page;
		}
	}) 
})
 
 

</script>
</html>