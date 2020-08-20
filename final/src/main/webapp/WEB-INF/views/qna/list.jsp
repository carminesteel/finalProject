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

<table id="tbl1" width=1130></table>
	<script id="temp1" type="text/x-handlebars-template">

		{{#each list}}
		<tr class="qna1" style="margin-bottom:110px; border=1px;">
			<td class="u_image" width=70>
				<img width=65px height=65px; style="border-radius:50%;" src="display?fileName={{u_image}}"/>
			</td>
			<td width=100 style="text-align:left; padding:10px;" class="replydate">
				<input type="hidden" value={{q_no}}>
				<b>{{nickname}}</b><br>
				<b>{{date}}</b>
			</td>
			<td width=500 style="text-align:left; padding:10px;"  id="QnATitle">
				<b>{{title}}</b><br>
				<b>문의내용 : </b><a>{{content}}</a>
			</td>		
			<td width=200>
				<span >{{printValue cnt}}</span>
				{{#if ${id=='admin'}}}
					<button q_no={{q_no}} style="{{printResend id}}" class="btnReply">답글</button>	
				{{/if}}
			</td>
			<td width=50 q_no={{q_no}}>
				<img width=20 height=20 style="{{printStyle id}}" class="btnDelete" src=../display?fileName=xicon.png>
			</td>
		</tr>
		<tr>
			<if
		</tr>
		{{/each}}
	</script>

	<button id="btnInsert3">문의</button>
	<br><br>
	
	<div id="pagination2"></div>
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



Handlebars.registerHelper("printStyle",function(id){
	var src;
	if(id!="${id}"){
		src="display:none;";
	}else if(id=="${id}"){
		src="color:red;";
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
 	if(admin){
 		src;
	}else if(admin==false){	
		src="display:none;";
	} 
	return src;
});

/*답글하기 */
  
 
/*  	function getList1(){
		$.ajax({
			type:"get",
			url:"/qna/read",
			data:{"q_no":q_no},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp2").html());
				$("#tbl2").html(temp(data));
			}
		});
	} */
 


/* $("#tbl1").on("click",".qna1 #QnATitle",function(){	
	alert("asdf");
	$.ajax({
		type:"get",
		url:"/qna/read",
		data:{"q_no":q_no},
		dataType:"json",
		success:function(data){
			var temp=Handlebars.compile($("#temp2").html());
			$("#tbl2").html(temp(data));
		}
	});
}); */

/*문의하기*/
$("#btnInsert3").on("click", function(){
	window.open("/qna/insert?p_no="+p_no,"","width=850px, height=450px");
});

/*답글목록띄우기*/
$("#tbl1").on("click",".qna1 .btnReply", function(){
	var q_no=$(this).attr("q_no");
	window.open("/qna/read?q_no="+q_no,"","width=850px, height=450px");

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
						alert("입력!");				
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
		if(!confirm("문의글을 삭제 하시겠습니까?")) return;
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
	});
	/*답글삭제*/
	$(".tbl2").on("click",".btnDelete2",function(){
		var qr_no=$(this).attr("qr_no");
		if(!confirm("답글을 삭제 하시겠습니까?")) return;
		alert(qr_no);
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