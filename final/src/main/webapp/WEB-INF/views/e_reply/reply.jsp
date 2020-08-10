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
	.reply1{margin:5px; padding:10px; width:1120px;}
	.replydate #btnDel{float:right;}
	.replydate #btnlike{float:right;}
	</style>
</head>
<body>
	<input type="hidden" value="${id}" id="id">
	<input type="hidden" value="${re}" id="re">
	<div id="tbl"></div>
	<div id="reviewcnt" style="text-align:center;color:gray;display:none;" >
		아직 작성 된 리뷰가 없습니다.
	</div>
	<script id="temp" type="text/x-handlebars-template">
			
			{{#each list}}
			<div class="reply1">
				<div class="replydate">
					<b>{{replyer}}</b>
					<a>{{date}}</a>
					<button r_no={{r_no}} id="btnDel" style="{{printStyle replyer}}">삭제</button>
					<button r_no={{r_no}} id="btnlike" style="{{BtnStyle e_like}}">좋아요</button>
					<a>좋아요:{{cnt}}</a>
				</div>
				<div class="content">{{content}}</div>
			</div>			
		{{/each}}
	</script>
	<br><br>
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
	getList();
	getCnt();
	
	//댓글이없을때
 	function getCnt(){
		if($("#re").html()==0){
			$("#reviewcnt").show();
		}else{
			$("#reviewcnt").hide();
		}
	} 
	
	//댓글출력
	function getList(){

		$.ajax({
			type:"get",
			url:"/reply/list",
			data:{"e_no":e_no},
			dataType:"json",
			success:function(data){
					var temp=Handlebars.compile($("#temp").html());
					$("#tbl").html(temp(data));
					getCnt(); 
			}
		});		
	}
	
	//좋아요
	$("#tbl").on("click",".replydate #btnlike",function(){
		var r_no=$(this).attr("r_no");
		$.ajax({
			type:"post",
			url:"/like/update",
			data:{"id":id,"r_no":r_no},
			success:function(){
				getList();
			}
		})
	});
	
  	Handlebars.registerHelper("BtnStyle",function(e_like){
		var src;
		if(e_like!=0){
			src="color:black;";
		}else{
			src="color:red;";
		}
		return src;
	});
  	
	//작성자 삭제버튼
	Handlebars.registerHelper("printStyle",function(replyer){
	var src;
	if(id!=replyer){
		src="display:none;";
	}else if(id==replyer){
		src="color:red;";
	}
	return src;
});
	
	
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
	
	$("#tbl").on("click",".replydate #btnDel",function(){
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