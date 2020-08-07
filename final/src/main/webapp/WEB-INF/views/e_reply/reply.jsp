<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰작성</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
	.reply1{margin:5px; padding:10px; width:450px;}
	</style>
</head>
<body>
	<input type="hidden" value="${id}" id="id">
	<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
		<div class="reply1">
			<div class="replydate">
				<b>{{replyer}}</b>
				<a>{{date}}</a>
				<button r_no={{r_no}} style="{{printStyle replyer}}">삭제</button>
			</div>
			<div class="content">{{content}}</div>
		</div>
		{{/each}}
	</script>
	<br><br>
	<c:if test="${re==0}">
		<div style="text-align:center;color:gray;" id="reviewcnt">
			<h4>아직 작성 된 리뷰가 없습니다.</h4>
		</div>
	</c:if>
	<div>
		<br><br>
		<input type="text" id="txtReply" size=100>&nbsp;&nbsp;
		<button id="btnInsert">입력</button>
	</div>
	<br>
</body>
<script>
	var e_no="${vo.e_no}";
	var id=$("#id").val();
	var page=1;
	getList();

	Handlebars.registerHelper("printStyle",function(replyer){
	var src;
	if(id!=replyer){
		src="display:none;";
	}else if(id==replyer){
		src="color:red;";
	}
	return src;
});
	
	function getList(){
		$.ajax({
			type:"get",
			url:"/reply/list",
			data:{"e_no":e_no},
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
	var re = "${re}";
	$("#btnInsert").on("click",function(){
		var content=$("#txtReply").val();
		
		if(id==""){
			if(confirm("로그인이 필요합니다.") == true){    //확인눌렀을때
				location.href="/login/login";
				}else{   //취소 눌렀을때
			 	   return;
				}
			}else if(content==""){
				alert("댓글을 입력하세요");
				return;
				}else if(id!=""){
					$.ajax({ 
						type:"post",
						url:"/reply/insert",
						data:{"e_no":e_no,"replyer":id,"content":content},
						success:function(){
							alert("댓글을 등록하였습니다.");
							$("#txtReply").val("");		
							$("#re").html(++re);
							getList();
							$("#reviewcnt").hide();
						}
					});
			}	
	});
	
	$("#tbl").on("click",".replydate button",function(){
		var r_no=$(this).attr("r_no");
		if(!confirm("삭제하시겠습니까?")) return;
		$.ajax({
			type:"post",
			url:"/reply/delete",
			data:{"r_no":r_no},
			success:function(){				
				alert("댓글이 삭제되었습니다");				
				$("#re").html(--re);
				getList();
			}
		});
	});
</script>
</html>