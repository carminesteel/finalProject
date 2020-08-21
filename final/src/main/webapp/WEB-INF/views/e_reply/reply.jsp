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
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	html{font-family:Noto Sans Kr}
	.reply1{margin:5px; padding:10px; width:650px;}
	.replydate #btnDel{float:right;}
	.replydate #btnlike{float:right;}
	.btnLike:hover{
		cursor:pointer;
	}
	.rbtnDelete:hover{
		cursor:pointer;
	}
	</style>
</head>
<body>
	<input type="hidden" value="${id}" id="id">
	<input type="hidden" value="${re}" id="re">
	<div id="reviewcnt" style="text-align:center;color:gray;display:none;">
				아직 작성 된 리뷰가 없습니다.
	</div>
	<table id="tbl" width=500px;></table>	
	<script id="temp" type="text/x-handlebars-template">			
		{{#each list}}
			<tr class=reRow>
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
				<img width=20 height=20 {{printaaa replyer}} class="rbtnDelete">	
			</td><br>
		</tr>
		{{/each}}
	</script>
	<br>
	<div style=display:inline-block;>
	<span style="display:inline-block;float:left;margin-bottom:8px;letter-spacing:-1px;font-size:14px;">리뷰 작성</span>
		<textarea style="width:495px;height:60px;resize:none;padding:0" id="txtReply" ></textarea>
	</div>
	<button id="btnInsert" style="font-family:Noto Sans Kr;float:right;width:60px;height:30px;background:#2b4163;border:none;border-radius:5px 5px 5px 5px;color:white;font-size:16px;margin-left:15px;">입력</button>	
	<br>
	<div id="pagination"></div>
</body>
<script>

	var e_no="${vo.e_no}";
	var id=$("#id").val();
	var page=1;
	getList();
	getCnt();

	Handlebars.registerHelper("printaaa",function(replyer){
		var src;
		if(id!=replyer){
			src="style=display:none";
		}else{
			src="src=../display?fileName=xicon.png";
		}
		return src;
	});
	
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
			data:{"e_no":e_no,"page":page},
			dataType:"json",
			success:function(data){			
					var temp=Handlebars.compile($("#temp").html());
					$("#tbl").html(temp(data));
					getCnt();
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
	
	//좋아요
	$("#tbl").on("click",".reRow .btnLike",function(){
		var r_no=$(this).parent().parent().find(".r_no").val();
		$.ajax({
			type:"post",
			url:"/like/update",
			data:{"id":id,"r_no":r_no},
			success:function(){
				getList();
				alert("좋아요성공")
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
	
	//댓글 입력 엔터,클릭
	$("#txtReply").keydown(function(key) {
		if (key.keyCode == 13) {
			getInsert();
		}
	});
	
 	$("#btnInsert").on("click",function(){
		getInsert();
	});	

	
	function getInsert(){
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
		}
	
	$("#tbl").on("click", ".reRow .rbtnDelete", function(){
		var r_no=$(this).parent().parent().find(".r_no").val();
		var hid=$(this).parent().parent().find(".hId").val();
		var rid=$(this).parent().parent().find(".rId").val();
		if(hid==rid){
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
		 }else if(hid!=rid){
			alert("본인이 작성한 댓글만 삭제가능합니다.") 
		}
		
	});
</script>
</html>