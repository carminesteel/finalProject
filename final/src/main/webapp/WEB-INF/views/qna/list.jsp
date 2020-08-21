<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Q&A]</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	.btnReply{
	all: unset;

	background: #2b4163; 
	width: 50px; 
	height: 30px; 
	color: white; 
	border-radius: 5px 5px 5px 5px;
	text-align:center;
	}
	
	.btnReply:hover{
	cursor:pointer;
	}
	.btnReply2{
	all: unset;

	background: #2b4163; 
	width: 70px; 
	height: 30px; 
	color: white; 
	border-radius: 5px 5px 5px 5px;
	text-align:center;
	}
	
	.btnReply2:hover{
	cursor:pointer;
	}
	#btnInsert3{
	all: unset;
	background: #2b4163; 
	width: 50px; 
	height: 30px; 
	color: white; 
	border-radius: 5px 5px 5px 5px;
	text-align:center;
	}
	
	#btnInsert3:hover{
	cursor:pointer;
	}
	</style>
</head>
<body>
	<input type="hidden" value="${id}" id="id">
	<input type="hidden" value="${param.p_no}" id="p_no">
	<div id="QnAcnt" style="text-align:center;color:gray;display:none; padding:20px;">
				아직 문의내용이 없습니다.
	</div>	

<table id="tbl1" width=1130></table>
	<script id="temp1" type="text/x-handlebars-template">
		{{#each list}}
		<tr class="qna1" style="height=200px;">
			<td class="u_image" width=70>
				<input type="hidden" value="${qe}">
				<img width=65px height=65px; style="border-radius:50%;" src="display?fileName={{u_image}}"/>
			</td>
			<td width=150 style="text-align:left;" class="replydate">
				<input type="hidden" value={{q_no}}>
				<b>{{nickname}}</b><br>
				<b>{{date}}</b>
			</td>
			<td width=500 style="text-align:left;"  id="QnATitle">
				<b>{{title}}</b><br>
				<b>문의내용 : </b><a>{{content}}</a>
			</td>		
			<td width=200>
				<span>{{printValue cnt}}</span>
				{{#if ${id=='zzz'}}}
					<button q_no={{q_no}} class="btnReply">답글</button>
				{{/if}}
			</td>
			<td width=30>
				<button cnt={{cnt}} q_no={{q_no}} style="{{printResend id}}" class="btnReply2">답변확인</button>
			</td>
			<td width=50 q_no={{q_no}}>
				<img width=20 cnt={{cnt}} style="{{printStyle id}}" class="btnDelete" src=../display?fileName=xicon.png>
			</td>
		</tr>
		{{/each}}
	</script>

	<button id="btnInsert3">문의</button>
	<br><br>	
	<div id="pagination2"></div>
	<br>
</body>
<script>

var p_no="${param.p_no}";
var id=$("#id").val();
var page=1;
var qe="${qe}";
var admin="${id=='admin'}";
$(".btnInsert2").hide();
$(".txtReply").hide();
getList2();
getQe();

//QnA가없을때
	function getQe(){
	if($("#qe").html()==0){
		$("#QnAcnt").show();
	}else{
		$("#QnAcnt").hide();
	}
} 

Handlebars.registerHelper("printStyle",function(id){
	var src;
	if(id!="${id}"){
		src="display:none;";
	}else if(id=="${id}"){
		$(".btnReply").css("display","block");
	}
	return src;
});
Handlebars.registerHelper("printValue",function(cnt){
	var src;
	if(cnt!=0){
		src="답변완료";
	}else{
		src="답변대기";
	}
	return src;
});
Handlebars.registerHelper("printResend",function(id){
	var src;
	
 	if(id=="${id}"){
		src="display:block;";
	}else{	
		src="display:none;";
	} 
	return src;
});

/*문의하기*/
$("#btnInsert3").on("click", function(){
	window.open("/qna/insert?p_no="+p_no,"","width=850px, height=450px");
});

/*답글목록띄우기*/
$("#tbl1").on("click",".qna1 .btnReply", function(){
	var q_no=$(this).attr("q_no");
	window.open("/qna/read?q_no="+q_no,"","width=850px, height=450px");

});
/*답변확인 띄우기*/
$("#tbl1").on("click",".qna1 .btnReply2", function(){
	var cnt=$(this).attr("cnt");
	if(cnt==0){
		alert("답변 대기중입니다")
	}else{
		var q_no=$(this).attr("q_no");
		window.open("/qna/read?q_no="+q_no,"","width=850px, height=450px");
	}
});

	/* 답글입력하기*/
	$("#tbl1").on("click",".replydate .btnInsert2", function(){;
		var row=$(this).parent();
		var content=row.find(".txtReply").val();
		var q_no=$(this).attr("q_no");
		var replyer="${id}";
		   if(content!=""){
			   $.ajax({
					type:"post",
					url:"/qna/insert2",
					data:{"q_no":q_no,"content":content,"replyer":replyer},
					success:function(){
						alert("입력 되었습니다.");				
					}
				});
		   }else{
			alert("내용을 입력하세요");
		}			
	});	
	
	/*댓글목록띄우기*/
	function getList2(){
		$.ajax({
			type:"get",
			url:"/qna/list",
			data:{"p_no":p_no,"page":page},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp1").html());
				$("#tbl1").html(temp(data));
				var str="";
				if(data.pm.prev){ 
					str += "<a href='" + (data.pm.startPage-1) + "'>◀</a>"
				}
				for(var i=data.pm.startPage; i<= data.pm.endPage; i++){ 
					if(page == i){ 
						str += "[<a href='" + i + "' class='active'>" + i + "</a>]";
					}else{ 
						str += "[<a href='" + i + "'>" + i + "</a>]";
					}
				}
				if(data.pm.next){ 
					str += "<a href='" + (data.pm.endPage+1) + "'>▶</a>" 
				} 
				$("#pagination2").html(str);
			}
		});
	}
	
	$("#pagination2").on("click", "a", function(e){ 
		e.preventDefault();
		page=$(this).attr("href");		
		getList2();
	});
	/*문의하기 삭제*/
	$("#tbl1").on("click",".btnDelete",function(){
		var q_no=$(this).parent().attr("q_no");
		var cnt=$(this).attr("cnt");

		if(!confirm("문의글을 삭제 하시겠습니까?")) return;
		if(cnt!=0){
			alert("답변한 글이 있어 삭제할 수 없습니다.");
		}else{
			$.ajax({
				type:"post",
				url:"/qna/delete",
				data:{"q_no":q_no},
				success:function(){
					alert("댓글이 삭제되었습니다!");
					$("#qe").html(--qe);
					getList2();
				}
			});
		}
	});
	/*답글삭제*/
	$(".tbl2").on("click",".btnDelete2",function(){
		var qr_no=$(this).attr("qr_no");
		if(!confirm("답글을 삭제 하시겠습니까?")) return;
		$.ajax({
			type:"post",
			url:"/qna/delete2",
			data:{"qr_no":qr_no},
			success:function(){
				alert("답글을 삭제했습니다!");
			}
		});
	});
		
</script>
</html>