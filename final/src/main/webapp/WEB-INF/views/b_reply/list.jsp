<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
   integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
   crossorigin="anonymous">

<style>

	#tbl1,#tbl0{text-align:center;}
	#tbl1{
		width:1073px;
		margin:auto;		
	}
</style>	
</head>
<body>
	<hr>	
<!-- 	<table id=tbl0>
		<tr>
			<td width=100>댓글번호</td>
			<td width=200>작성자</td>
			<td width=200>내용</td>
			<td width=200>날짜</td>
			<td width=50>삭제</td>
		</tr>
	</table> -->
	
	<table id=tbl1></table>
	<script id="temp" type="text/x-handlebars-template">	
		{{#each .}}
	<tr class="row">
			<td class="u_image" width=70><img width=65px height=65px; style="border-radius:50%" src="display?fileName={{u_image}}"</td>
			<td  width=700 style="text-align:left;"><b class="replyer" style="font-size:25px;">{{replyer}}</b><br><b class="content" style="font-weight:300;font-family:Noto Sans Kr;">{{content}}</b></td>	
			<td width=50>
				<input type="button" value="삭제" class="rbtnDelete" style="{{printStyle replyer}};float:right">		
			</td>		
		</tr>
		{{/each}}
	</script> 
	
	<form action="/b_reply/insert" method="post" name="rfrm">
		<input type="hidden" name="b_no" value="${vo.b_no}">
		<input type="hidden" name="replyer" value="${id}">
		<input type="text" name="content" size=50>
		<input type="submit" value="입력">		
	</form>  
*
	<div id="pagination">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:if test="${pm.prev}">
					<li class="page-item"><a class="page-link"
						href="${pm.startPage-1}" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
					<li class="page-item"><a class="page-link" href="${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pm.next}">
					<li class="page-item"><a class="page-link"
						href="${pm.endPage+1}" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	</div>

</body>
<script>
var b_no = "${vo.b_no}";
var page=1;
$("#pagination").on("click", ".page-item .page-link", function(e) {
    e.preventDefault();
    page = $(this).attr("href");
    R_list();  
 });

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
	data:{"b_no":b_no,"page":page},
	dataType:"json",
	success:function(data){
		var temp=Handlebars.compile($("#temp").html());
		$("#tbl1").html(temp(data));
		alert(data.pm.prev);
	}
});
}

$(rfrm).submit(function(e){
	e.preventDefault();
	if($(rfrm.content).val()==""){
		alert("내용을 입력해주세요");
	}else{
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