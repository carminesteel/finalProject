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

	html{font-family:Noto Sans Kr}
	#tbl{
		margin:auto;
	}
	.btnLike:hover{
		cursor:pointer;
	}
	.delBtn:hover{
		cursor:pointer;
	}

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
	<div id="reviewcnt" style="text-align:center;color:gray;display:none;">
				아직 작성 된 리뷰가 없습니다.
	</div>	
	<table id="tbl" width=500></table>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
			<tr class=reRow style="height:100px;">
			<td class="u_image" width=70>				
				<img width=65px height=65px; style="border-radius:50%;" src="../display?fileName={{u_image}}">
			</td>
			<td  width=700 style="text-align:left;">
				<b class="replyer" style="font-size:22px;margin-left:15px;">{{nickname}}</b>
				<br>
				<b class="content" style="font-weight:300;font-size:13px;margin-left:15px;">{{content}}</b>				
				<input class=hId type="hidden" value=${id}>
				<input class=rId type="hidden" value={{replyer}}>
				<input class=r_no type="hidden" value={{r_no}}>
				<span style="display:inline-block;float:right;">
				<img class="btnLike" style="width:13px;height:13px;" src=../display?fileName=likes.png/> {{cnt}}<span>
			</td>
			<td width=50>
				<img width=20 height=20 r_no={{r_no}} class="delBtn" style="{{printStyle replyer}}" src=/display?fileName=xicon.png></img>	
			</td><br>
		</tr>
		{{/each}}
	</script>
	<br><br>					
	<div style="display:inline-block; width:500px;">
		<div style="margin:auto;">
			<span style="display:inline-block;padding-bottom:30px;float:left;margin-bottom:-4px;letter-spacing:-1px;font-size:14px;">리뷰 작성</span><br>
			<textarea style=" width:495px;height:60px;resize:none;padding:0" id="txtReply" ></textarea><br>
			<button id="btnInsert" style="font-family:Noto Sans Kr;float:right;width:60px;height:30px;background:#2b4163;border:none;border-radius:5px 5px 5px 5px;color:white;font-size:16px;margin-left:15px;">입력</button>	
		</div>	
	</div>	
	<div id="pagination"></div>
	<br>
	
</body>
<script>
	var p_no="${param.p_no}";
	var id=$("#id").val();
	var page=1;
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
		getList();
	});
	
	//댓글등록
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
				$("#re").html(++re);
				$('#tbl').load(document.URL +  ' #tbl');
				location.reload();
			}
		});
	});
	//댓글삭제
	$("#tbl").on("click",".reRow .delBtn",function(){
		var r_no=$(this).attr("r_no");
		if(!confirm("삭제 하시겠습니까?")) return;
		$.ajax({
			type:"post",
			url:"/p_reply/delete",
			data:{"r_no":r_no},
			success:function(){
				alert("댓글이 삭제되었습니다!");
				$("#re").html(--re);
				$('#tbl').load(document.URL +  ' #tbl');
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
	$("#tbl").on("click",".reRow .btnLike",function(){	
		var r_no=$(this).parent().parent().find(".r_no").val();
		$.ajax({
			type:"post",
			url:"/p_reply/like/update",
			data:{"id":id,"r_no":r_no},
			success:function(){
				getList();
			}
		})
	});
</script>
</html>