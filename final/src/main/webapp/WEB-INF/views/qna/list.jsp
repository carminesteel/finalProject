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

</head>
<body>
	<input type="hidden" value="${id}" id="id">
	<input type="hidden" value="${param.p_no}" id="p_no">

<div id="tbl1"></div>
	<script id="temp1" type="text/x-handlebars-template">
	
		{{#each list}}
		<div class="qna1">		
			<div class="replydate">
				<b>{{q_no}}</b>
				<b>{{id}}</b>
				<b>{{title}}</b>
				<b>{{content}}</b>
				<b>{{date}}</b>
				<button q_no={{q_no}} style="{{printStyle id}}" class="btnDelete">삭제</button>
				<button q_no={{q_no}} class="btnReply">답글</button>	
				<input type="text" class="txtReply" size=100 style="display:none;">&nbsp;&nbsp;
   				<button q_no={{q_no}} class="btnInsert2" style="display:none;">입력</button>
				<span >{{printValue cnt}}</span>
			</div>
			
		</div>
		{{/each}}

	</script>
<%-- 	<c:forEach items="${vo}" var="v">
		<div class="reply1" >
				<div class="replydate1">
					<b>${v.replyer}</b>
					<a>${v.writedate}</a>
					<a class="q_no">${v.q_no}</a>
					<button qr_no="${v.qr_no}" class="btnDelete2">삭제</button>
				</div>
			<div class="content">${v.content}</div>
			</div>
	</c:forEach>
		 
		<div class="tbl2" ></div>
		<script id="temp2" type="text/x-handlebars-template">
		{{#each list1}}
			<div class="reply1">
				<div class="replydate1">
					<b>{{replyer}}</b>
					<a>{{writedate}}</a>
					<a class="q_no">{{q_no}}</a>
					<button qr_no={{qr_no}} style="{{printStyle replyer}}" class="btnDelete2">삭제</button>
				</div>
			<div class="content">{{content}}</div>
			</div>
		{{/each}}
	</script>--%>
	<button id="btnInsert3">문의하기</button>
	<br><br>
	
	<div id="pagination2"></div>
</body>
<script>

var p_no="${param.p_no}";
var id=$("#id").val();
var page=1;
var qe="${qe}";

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




/*답글하기*/

/*문의하기*/
$("#btnInsert3").on("click", function(){
	window.open("/qna/insert?p_no="+p_no,"","width=500px, height=400px");
});

/*답글목록띄우기*/
$("#tbl1").on("click",".replydate .btnReply", function(){
	var q_no=$(this).attr("q_no");
	window.open("/qna/read?q_no="+q_no,"","width=500px, height=400px");

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
		
		getList();
	});
	/*문의하기 삭제*/
	$("#tbl1").on("click",".btnDelete",function(){
		var q_no=$(this).attr("q_no");
		if(!confirm("삭제 기기?")) return;
		alert(q_no);
		$.ajax({
			type:"post",
			url:"/qna/delete",
			data:{"q_no":q_no},
			success:function(){
				alert("댓글이 삭제되었당!");
				$("#qe").html(--qe);
				getList2();
			}
		});
	});
	/*답글삭제*/
	$(".tbl2").on("click",".btnDelete2",function(){
		var qr_no=$(this).attr("qr_no");
		if(!confirm("삭제 할래??")) return;
		alert(qr_no);
		$.ajax({
			type:"post",
			url:"/qna/delete2",
			data:{"qr_no":qr_no},
			success:function(){
				alert("답글삭제완료!!");
			}
		});
	});
	
		
</script>
</html>