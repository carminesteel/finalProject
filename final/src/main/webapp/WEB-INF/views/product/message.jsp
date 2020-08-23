<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쪽지함</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
html {
	font-family: Noto Sans KR
}

#exBody {
	background-color: #2b4163;
	z-index: 1;
}

/* #exCenter {
	width: 1276px;
	margin: auto;
	z-index: 2;
	overflow:hidden;
	position:relative;
} */

 #exCenter #divMenu a {
	display:inline-block;
	text-decoration:none;
	color:black;
	width:200px;
	padding:6px 0px 6px 5px;
	cursor:pointer;
	
}
 
/* #tblMessage {
	position:relative;
	left:7%;
}
#exCenter #divcontent input[type="button"] {
	width:50px;
	padding:3px;
	border-radius:2px 2px 2px 2px;
	background:white;
	outline:none;
	border:0.5px solid gray;
	margin-bottom:10px;
	cursor:pointer;
}
#exCenter #divcontent input[type="button"]:hover {
	color:red;
}
#divcontent #tbl {
	border-collapse:collapse;
}
#divcontent #tbl span {
	margin-left:5px;
}
#divcontent #tbl1 {
	border-collapse:collapse;
}
#divcontent #tbl1 span {
	margin-left:5px;
} */
	.btnreSend{
	all: unset;
	background: #0f4c75; 
	width: 50px; 
	height: 30px; 
	color: white; 
	border-radius: 5px 5px 5px 5px;
	text-align:center;
	}
	
	.btnreSend:hover{
	cursor:pointer;
	}
	.btnDel{
	all: unset;
	background: #0f4c75; 
	width: 50px; 
	height: 30px; 
	color: white; 
	border-radius: 5px 5px 5px 5px;
	text-align:center;
	}
	
	.btnDel:hover{
	cursor:pointer;
	}
</style>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp"></jsp:include>
	<div id=exBody >
		<div id=exCenter style="margin:auto;">
			<div id="tblMessage" style="height:1080px; padding-top:50px; padding-bottom:50px; margin:auto;">
				<div id="divMenu" style="width:1400px;background:white;color:black;margin:auto;border-radius:20px 20px 20px 20px;padding:20px;margin-top:40px;">
					<div>
						<a id="receive" style="text-align:center;background:#0f4c75;margin-right:10px;color:white;border-radius:20px 20px 20px 20px;">받은메세지함</a>
						<a id="send" style="text-align:center;background:#0f4c75;color:white;border-radius:20px 20px 20px 20px;">보낸메세지함</a>
					</div>
				</div>
				<div id="divcontent" style="width:1400px;background:white;color:black; padding-bottom:100px; height:900px;margin:auto;border-radius:20px 20px 20px 20px;padding:20px;margin-top:40px;" >
					<table id="Maintbl" width=1400>
						<tr>
							<td width=40 style="border:0.1px solid black; border-left:none;border-right:none; text-align:center;">
								<input type="checkbox" class="chkAll" style="cursor:pointer;">
							</td>
							<td width=214 style="border:0.1px solid black; border-left:none;border-right:none;">
								<span>보낸날짜</span>
							</td>
							<td width=214 style="border:0.1px solid black; border-left:none;border-right:none; ">
								<span>Title</span>
							</td>
							<td width=214 style="border:0.1px solid black;border-left:none; border-right:none;">
								<span>보낸사람</span>
							</td>
							<td width=214 style="border:0.1px solid black; border-left:none;border-right:none;">
								<span>읽은날짜</span>
							</td>
						</tr>
					</table>
					<!-- 받은메세지 -->
					<table id="tbl" width=1400 style="padding-bottom:20px;"></table>
					<script id="temp" type="text/x-handlebars-template">
						<tr id="button">
							<td></td>
							<td colspan=3>
								<input type="button" class="btnDel" value="삭제" style="float:left; margin-right:5px;">
								<input type="button" class="btnreSend" value="답장" style="float:left; ">
							</td>
						</tr>
						<tr>
							<td width=40 style="text-align:center;height:50px;border:0.5px solid black; border-right:none; text-align:center;">
								<input type="checkbox" class="chkAll" style="cursor:pointer;">
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;border-right:none;">
								<span>보낸날짜</span>
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;border-right:none; ">
								<span>Title</span>
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;border-right:none;">
								<span>보낸사람</span>
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;">
								<span>읽은날짜</span>
							</td>
						</tr>
					{{#each .}}
						<tr class="row">
							<td width=40 style="border:0.1px solid black; border-left:none; text-align:center;">
								<input type="checkbox" class="chk" style="cursor:pointer;">
								<input type="hidden" value={{m_no}} class="m_no">
							</td>
							<td width=214 style="border:0.1px solid black;">
								<span class="sendDate">{{sendDate}}</span>
							</td>
							<td width=214 style="border:0.1px solid black; cursor:pointer;" >
								<span class="title">{{title}}</span>
							</td>
							<td width=214 style="border:0.15px solid black; border-right:none;">
								<span class="sender">{{sender}}</span>
							</td>
							<td width=214 style="border:0.1px solid black; text-align:center;">
							{{#if receiveDate}}
								<span>{{receiveDate}}</span>
								{{else}}
								<b>읽지않음</b>
							{{/if}}
							</td>
						</tr>
					{{/each}}
					</script>
					<!-- 보낸메세지 -->
					<table id="tbl1" width=1400 style="padding-bottom:20px;"></table>
					<script id="temp1" type="text/x-handlebars-template">
						<tr>
							<td></td>
							<td colspan=3>
								<input type="button" class="btnDel" value="삭제" style="float:left; margin-right:5px;">
							</td>
						</tr>
						<tr>
							<td width=40 style="height:50px;border:0.1px solid black;text-align:center;">
								<input type="checkbox" class="chkAll" style="cursor:pointer;">
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;border-right:none; ">
								<span>받는사람</span>
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;border-right:none; ">
								<span>Title</span>
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;border-right:none;">
								<span>보낸날짜</span>
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;">
								<span>읽은날짜</span>
							</td>
						</tr>
					{{#each .}}
						<tr class="row">
							<td width=40 style="height:50px;border:0.1px solid black; text-align:center;">
								<input type="checkbox" class="chk1" style="cursor:pointer;">
								<input type="hidden" value={{m_no}} class="m_no">
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;border-right:none; ">
								<span>{{receiver}}</span>
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;border-right:none; " >
								<span class="title">{{title}}</span>
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;border-right:none; ">
								<span class="sendDate">{{sendDate}}</span>
							</td>
							<td width=214 style="text-align:center;height:50px;border:0.1px solid black;border-left:none;">
							{{#if receiveDate}}
								<span class="receiveDate">{{receiveDate}}</span>
								{{else}}
								<b>읽지않음</b>
							{{/if}}
							</td>
						</tr>
					{{/each}}
					</script>
					<div id="SendMessage" style="width: 1380px; padding: 10px; margin-top: 10px;">
						보낸이: <span class="sender"></span><br> 
						발신일: <span class="sendDate"></span><br> 
						수신일: <span class="receiveDate"></span><br>
						내용: <span class="content"></span><br>
						<input type="button" value="답장" id="resend">
					</div>
					<div id="ReceiveMessage" style="width: 1380px; padding: 10px; margin-top: 10px;">
						받는사람: <span class="receiver"></span><br> 
						발신일: <span class="sendDate"></span><br> 
						수신일: <span class="receiveDate"></span><br>
						내용: <span class="content"></span><br>
					</div>
				</div>
			</div> 
		</div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	var id="${id}";
	$("#tbl1").hide();
	$("#SendMessage").hide();
	$("#ReceiveMessage").hide();

	receive();
	
	//답장하기
 	$("#SendMessage").on("click", "#resend", function(){
 		var receiver=$("#SendMessage .sender").html();
 		var id="${id}";
 		window.open("/product/paper?receiver=" + receiver,"","width=350px, height=400px");
	});
	
	//보낸 메세지 읽기
	$("#tbl1").on("click",".row .title",function(){		
		var m_no=$(this).parent().parent().find(".m_no").val();
		var receiveDate=$(this).parent().parent().find(".receiveDate").html();
		var sendDate=$(this).parent().parent().find(".sendDate").html();
		var title=$(this).parent().parent().find(".title").html();
  		$.ajax({
			type:"get", 
			url:"/message/read", 
			data:{"m_no":m_no},
			dataType:"json",
			success:function(data){
				$("#divMessage").show();				
				$(".sender").html(data.sender);
				$(".receiver").html(data.receiver);
				$(".content").html(data.content);
				$(".sendDate").html(data.sendDate);
				$(".receiveDate").html(data.receiveDate);
				
				$("#Maintbl").show();
				$("#SendMessage").hide();
				$("#ReceiveMessage").show();
				$("#tbl").hide();
				$("#tbl1").hide();
		 	}
		});
	});
	
	//받은 메세지 읽기
 	$("#tbl").on("click",".row .title",function(){		
		var m_no=$(this).parent().parent().find(".m_no").val();
		var title=$(this).parent().parent().find(".title").html();
		var sender=$(this).parent().parent().find(".sender").html();
  		$.ajax({
			type:"get", 
			url:"/message/rRead", 
			data:{"m_no":m_no, "title":title, "sender":sender},
			dataType:"json",
			error:function(){
				alert("xxx");
			},
			success:function(data){
				$("#divMessage").show();				
				$(".sender").html(data.sender);
				$(".receiver").html(data.receiver);
				$(".content").html(data.content);
				$(".sendDate").html(data.sendDate);
				$(".receiveDate").html(data.receiveDate);
				
				$("#Maintbl").show();
				$("#SendMessage").show();
				$("#ReceiveMessage").hide();
				$("#tbl").hide();
				$("#tbl1").hide();				
		 	}
		}); 
	});

	//받은메세지
	$("#receive").on("click",function(){
		receive();
	});
	
	function receive(){
  		$.ajax({
			type:"get", 
			url:"/list/receive", 
			data:{"id":id},
			success:function(data){
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				$("#tbl").show();
				$("#Maintbl").hide();
				$("#tbl1").hide();
				$("#SendMessage").hide();
				$("#ReceiveMessage").hide();
		 	}
		});
	}

	//보낸메세지
	$("#send").on("click",function(){
		send();
	});
	
	function send(){
 		$.ajax({
			type:"get", 
			url:"/list/send", 
			data:{"id":id}, 
			success:function(data){
 				$("#tbl").hide();
 				$("#Maintbl").hide();
 				$("#tbl1").show();
 				$("#SendMessage").hide();
 				$("#ReceiveMessage").hide();
				var temp = Handlebars.compile($("#temp1").html());
				$("#tbl1").html(temp(data));
		 	}
		});
	}
	
	//전체선택 체크박스 클릭 
 	 $(document).ready( function() {
	     $("#tbl1").on("click",".chkAll", function() {
	       $(".chk1").prop('checked', this.checked);
	     });
	   });
	
 	 $(document).ready( function() {
	     $("#tbl").on("click",".chkAll", function() {
		       $(".chk").prop('checked', this.checked);
		 });
	   });
	
	//선택메세지 삭제
	$("#divcontent").on("click",".btnDel",function(){
		if(!confirm("메세지를 삭제 하시겠습니까?")) return;
		$("#tbl1 .row input:checkbox:checked").each(function(){	//보낸메세지
			var m_no=$(this).parent().parent().find(".m_no").val();
			$.ajax({
				type:"get", 
				url:"/message/sdelete", 
				data:{"m_no":m_no}, 
				success:function(data){
					send();
			 	}
			});
		});
		$("#tbl .row input:checkbox:checked").each(function(){	//받은메세지
		var m_no=$(this).parent().parent().find(".m_no").val();
			$.ajax({
				type:"get", 
				url:"/message/pdelete", 
				data:{"m_no":m_no}, 
				success:function(data){
					receive();
			 	}
			});
		});
		alert("삭제되었습니다");
	});
</script>
</html>