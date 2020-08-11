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
	<input type="text" value="${id}" id="id">
	<input type="text" value="${param.p_no}" id="p_no">
<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
		<div class="qna1">
			<div class="replydate">
				<b>{{id}}</b>
				<a>{{title}}</a>
				<button q_no={{q_no}} style="{{printStyle id}}">삭제</button>
			</div>
			<div class="content">{{content}}</div>
		</div>
		{{/each}}
	</script>
	<button id="btnInsert">문의하기</button>
	<br><br>
	
	<div id="pagination"></div>
</body>
<script>

var p_no="${param.p_no}";
var id=$("#id").val();
var page=1;
var qe="${qe}";

getList();

Handlebars.registerHelper("printStyle",function(id){
	var src;
	if(id!="${id}"){
		src="display:none;";
	}else if(id=="${id}"){
		src="color:red;";
	}
	return src;
});

$("#btnInsert").on("click", function(){
	window.open("/qna/insert?p_no="+p_no,"","width=500px, height=400px");
});


	
	function getList(){
		$.ajax({
			type:"get",
			url:"/qna/list",
			data:{"p_no":p_no,"page":page},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
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
				$("#pagination").html(str);

			}
		});
	}
	
	$("#pagination").on("click", "a", function(e){ 
		e.preventDefault();
		page=$(this).attr("href");
		
		getList();
	});
	
	$("#tbl").on("click",".replydate button",function(){
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
				getList();
			}
		});
	});
</script>
</html>