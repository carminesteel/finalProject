<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰작성</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
	.reply1{vertical-align:middle;border-bottom:none;font-size:17px;letter-spacing:-1px;margin:auto;magin-bottom:5px;padding:15px;padding-bottom:0px; padding-top:15px; width:500px; text-align:left; border-bottom:1px solid black;}
	#btnInsert{
		font-family:Noto Sans Kr;
		float:right;
		width:60px;
		height:30px;
		
		background:#2b4163;
		border:none;
		border-radius:5px 5px 5px 5px;
		color:white;
		font-size:16px;	
	}
	</style>
</head>
<body>
	<input type="hidden" value="${id}" id="id">
	<input type="hidden" value="${param.p_no}" id="p_no">
	
	<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
		<div class="reply1">
			<div class="replydate">Re
				<b class="replyer">{{replyer}}</b>
				<a>{{date}}</a>
				<input class=r_no type="hidden" value={{r_no}}>
				<img class="listBtn" style="width:20px;height:20px;" src=/display?fileName=likes.png/></img>
				<img width=20 height=20 r_no={{r_no}} class="delBtn" style="{{printStyle replyer}}" src=/display?fileName=xicon.png></img>
			</div>
		<div class="content">{{content}}</div>
		</div>
		{{/each}}
	</script>
	<br><br>					
	<div style=display:inline-block;>
		<span style="display:inline-block;float:left;margin-bottom:-4px;letter-spacing:-1px;font-size:14px;">리뷰 작성</span><br>
		<textarea style="width:495px;height:60px;resize:none;padding:0" id="txtReply" ></textarea><br>
		<button id="btnInsert">입력</button>
	</div>	
	<div id="pagination"></div>
	<br>
</body>
<script>
	var p_no="${param.p_no}";
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
			url:"/p_reply/list",
			data:{"p_no":p_no,"page":page},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				//페이지 리스트 출력
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
	
	//페이지 번호를 클릭했을 경우
	$("#pagination").on("click", "a", function(e){ 
		e.preventDefault();
		page=$(this).attr("href");
		//alert(page);
		getList();
	});
	var re= "${re}";
	$("#btnInsert").on("click", function(){
		var content=$("#txtReply").val();
		if(content==""){
			alert("내용을 입력하세요");
			return;
		}
		var replyer="${id}";
		$.ajax({
			type:"post",
			url:"/p_reply/insert",
			data:{"p_no":p_no,"content":content,"replyer":replyer},
			success:function(){
				alert("띠용");
				$("#re").html(++re);
				location.reload();
			
			}
		});
	});
	$("#tbl").on("click",".replydate .delBtn",function(){
		var r_no=$(this).attr("r_no");
		if(!confirm("삭제 기기?")) return;
		$.ajax({
			type:"post",
			url:"/p_reply/delete",
			data:{"r_no":r_no},
			success:function(){
				alert("댓글이 삭제되었당!");
				$("#re").html(--re);
				location.reload();
			}
		});
	});
	
	Handlebars.registerHelper("printStyle replyer",function(replyer){
		var src;
		if(id!=replyer){
			src="style=display:none";
		}else{
			src="src=/display?fileName=xicon.png";
		}
		return src;
	});
	
	//좋아요
	$("#tbl").on("click",".reply1 .listBtn",function(){	
		var id=$(this).parent().find(".replyer").html();
		var r_no=$(this).parent().parent().find(".r_no").val();
		alert(r_no);
		alert(id);
		$.ajax({
			type:"post",
			url:"/p_reply/like/update",
			data:{"id":id,"r_no":r_no},
			success:function(){
				getList();
				alert("좋아요성공")
			}
		})
	});
</script>
</html>