<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의하기</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
	#btnQnA{
	all: unset;
	margin-right:3px;
	float:right;
	background: #2b4163; 
	width: 70px; 
	height: 30px;
	margin-left:3px; 
	color: white; 
	border-radius: 5px 5px 5px 5px;
	text-align:center;
	}
	
	#btnQnA:hover{
	cursor:pointer;
	}
	
	#btnReset{
	all: unset;
	margin-left:3px;
	float:right;
	background: #2b4163; 
	width: 70px; 
	height: 30px;
	margin-right:280px; 
	color: white; 
	border-radius: 5px 5px 5px 5px;
	text-align:center;
	}
	
	#btnReset:hover{
	cursor:pointer;
	}
	
	#btnClose{
	all: unset;
	float:right;
	margin-right:1px;
	margin-left:1px; 
	background: #2b4163; 
	width: 50px; 
	height: 30px; 
	color: white; 
	border-radius: 5px 5px 5px 5px;
	text-align:center;
	}
	
	#btnClose:hover{
	cursor:pointer;
	}
	
 	body{
	width:800px;
	margin:auto;
	padding-top:30px;
	}
	</style>
</head>
<body>
	<h1>문의하기</h1>
	
	<form name="frm" method="post" action="insert">
	<input type="hidden" name="p_no" value="${param.p_no}">
	<%-- <input type="hidden" name="id" value="${id}"> --%>
	<input type="hidden" name="id" value="${id}">
	<table>		
		<tr>		
			<td><b>TITLE : </b><input style=width:732px;height:20px;margin-top:20px;resize:none; type="text" name="title" size=50></td>
		</tr>
		<tr>
			<td><b>문의 내용</b><textarea style=width:790px;height:150px;margin-bottom:15px;margin-top:3px;resize:none; name="content" value="${vo.content}"></textarea></td>
		</tr>		
	</table>
	<input id="btnClose" type="button" value="창닫기" onclick="javascript:self.close();">
	<input id="btnQnA" type="submit" value="문의하기" >
	</form>
</body>
<script>
var p_no="${param.p_no}";
var qe="${qe}";
/*$(frm).submit(function(e) {
	e.preventDefault();
	if (!confirm("문의하시겠습니까?"))
		return;
	window.close();
	frm.submit();
	location.href="/product/read?p_no="+p_no;
	
});*/

$(frm).submit(function(e){
	e.preventDefault();
	if(!confirm("문의하시겠습니까?")) return;
	var content =$(frm.content).val();
	var id=$(frm.id).val();
	var title=$(frm.title).val();
	if(content==""){
		alert("내용을입력해주세요");
	}else{
		$.ajax({
			type:"post",
			url:"/qna/insert",
			data:{"p_no":p_no,"id":id,"title":title,"content":content},
			success:function(){
				location.reload();
				$("#qe").html(++qe);			
				window.close();	
			}	
		});
	}
});


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
	
</script>
</html>