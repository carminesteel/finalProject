<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>댓글</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
	#tbl1{text-align:center;}
</style>	
</head>
<body>
	<form action="/b_reply/insert" method="post" name="rfrm">
		<input type="hidden" name="b_no" value="${vo.b_no}">
		<input type="hidden" name="replyer" value="${id}">
		<input type="text" name="content" size=50>
		<input type="submit" value="입력">
		
	</form>
	
	
	
	<form action="/b_reply/delete" method="post" name="rfrm1">
	<table id=tbl1 width=600></table>
	<script id="temp" type="text/x-handlebars-template">	
		<tr>
			<td width=70>댓글번호</td>
			<td width=100>작성자</td>
			<td width=200>내용</td>
			<td width=170>날짜</td>
			<td width=30></td>
		</tr>
		{{#each .}}
		<tr class="row">
			<td class="r_no" >{{r_no}}</td>
			<td class="replyer" >{{replyer}}</td>	
			<td class="content" >{{content}}</td>
			<td>{{date}}</td>
			<td class="b_no">{{b_no}}</td>
			<td><input type="button" value="삭제" class="rbtnDelete" style="{{printStyle replyer}}"></td>		
		</tr>
		{{/each}}
	</script>
	
</form>
</body>
<script>
var b_no = "${vo.b_no}";
$("#tbl1").find(".row .b_no").hide();
var id="${id}";
Handlebars.registerHelper("printStyle",function(replyer){
	var src;
	if(id!=replyer){
		src="display:none;";
	}else if(id==replyer){
		src="color:red;";
	}
	return src;
});

R_list();

function R_list(){
$.ajax({
	type:"post",
	url:"/b_reply/read",
	data:{"b_no":b_no},
	success:function(data){
		var temp=Handlebars.compile($("#temp").html());
		$("#tbl1").html(temp(data));
	}
});
}

$(rfrm).submit(function(e){
	e.preventDefault();
	if($(rfrm.content).val()==""){
		alert("내용을 입력해주세요");
	}else if(id==""){
		alert("로그인 화면으로 이동합니다.");
		location.href="/login/login";
	}
	else{
		if(!confirm("입력하시겠습니까?")) return;
		var b_no=$(rfrm.b_no).val();
		var replyer=$(rfrm.replyer).val();
		var content=$(rfrm.content).val();
		$.ajax({
			type:"post",
			url:"/b_reply/insert",
			data:{"b_no":b_no,"replyer":replyer,"content":content},
			success:function(){		
				R_list();
				}
			
		})
	 }
});

$("#tbl1").on("click", ".row .rbtnDelete", function(){
	var r_no=$(this).parent().parent().find(".r_no").html();
	if(!confirm("삭제하시겠습니까?")) return;
	$.ajax({
	      type:"post",
	      url:"/b_reply/delete",
	      data:{"r_no":r_no},
	      success:function(){
	    	  R_list();
	      }
	   });
	
});



</script>
</html>