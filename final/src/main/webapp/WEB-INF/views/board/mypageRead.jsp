<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>[작품정보]</title>
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <style>
  @import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); 
html {
   font-family: Noto Sans Kr;
}



#LikeBtn:hover {
   cursor: pointer;
}

.icons {
   width: 20px;
   height: 20px;
}

body {
   margin: 0;
}

#lightBox {
   display: inline-block;
   width: 100%;
   height:100%;
   position: absolute;
   /*          top:50%;
         left:50%;
         transform:translate(-50%, -50%); */
   z-index: 899;
}

#lightContent {
   background: white;
   width: 1392px;
   margin: auto;
   padding: 0px;
}

#lightInfo {
   width: 1392px;
   margin: auto;
   background: none;
   vertical-align: middle;
}

#image {
   width: 64px;
   height: 64px;
   border-radius: 50%;
   display: inline-block;
   margin-bottom: 20px;
}

#artInfo {
   margin-top: 20px;
   margin-left: 15px;
   display: inline-block;
   height: 65px;
   color: white;
   font-size: 17px;
}

#lightBottom {
   width: 1130px;
   margin: auto;
}
.lbClose{
   width:35px;
   height:35px;
   position:fixed;
   right:50px;
   top:20px;
   
}
</style>
</head>
<body>
   
   <div id=lightBox>   
   
      <div id=lightInfo>   
         <img class=lbClose src="../display?fileName=xiconWhite.png"/>
         <img id="image" src="../display?fileName=${vo.u_image}"/>
         <div id=artInfo>
            <b name=title>${vo.title}</b>
            <br>
            ${vo.nickname}
         </div>
      </div>
      <div id=lightContent>
      <input type="hidden" name="image" value="${vo.image}">
         <br><br><br><br>
         <c:forEach items="${list}" var="image">
            <img src="../display?fileName=${image}" name="files" width="100%"/>
            <br><br><br><br>
         </c:forEach>
          <div id=lightBottom>
            <div style="height:100px;width:100%">
               <span style="display:inline-block;float:left;">
                  <img style="border-radius:50%;" width=90px height=90px src="../display?fileName=${vo.u_image}"/>
               </span>
               <span style="display:inline-block;float:left;margin-left:18px;margin-top:18px;">
                  <b style="font-size:20px">${vo.nickname}</b>&nbsp;&nbsp;
                 <c:if test="${id!=vo.id}">
                  <a style="all:unset;font-size:14px;cursor:pointer;" id="follow">팔로우</a><br>
                  </c:if>
                  <b style="all:unset;color:#93a1a2;font-size:15px">${vo.introduce}</b>
               </span>
            </div>
            <div>
               <b style="font-size:30px;">${vo.title}</b>
               <br>
               <b style="all:unset;font-size:20px;">${vo.content}</b>
               <br>
               <div style="display:inline-block;float:right;"></div>
            </div>
            <br>
            <div style=text-align:left;display:inline-block;float:left;>
            <form name="frm" method="post" action="update" enctype="multipart/form-data">
            
               <input type="hidden" name="b_no" value="${vo.b_no}">
               <input type="hidden" name="id" value="${vo.id}">
               <input type="hidden" name="image" value="${vo.image}">
               <c:if test="${id==vo.id}">
                  <input style="border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;width:55px;height:28px;font-size:15px;" type="submit" value="수정">   
                  <input style="border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;width:55px;height:28px;font-size:15px;" type="button" value="삭제" id="btnDelete">
               </c:if>
               <c:if test="${id!=vo.id}">
               <input type="button" value="신고하기" id="report" style="border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;width:75px;height:28px;font-size:15px;">
           	   </c:if>
            </form>
            </div>
            <table id=tbl1></table>
	<c:if test="${vo.r_cnt!=0}">
	<script id="temp" type="text/x-handlebars-template">	
		{{#each .}}
		<tr class=reRow>
			<td class="u_image" width=70>				
				<img width=65px height=65px; style="border-radius:50%;" src="../display?fileName={{u_image}}">				
			</td>
			<td  width=700 style="text-align:left;">
				<b class="replyer" style="font-size:22px;margin-left:15px;">{{replyer}}</b>
				<br>
				<b class="content" style="font-weight:300;font-size:13px;margin-left:15px;">{{content}}</b>
				<input class=hId type="hidden" value=${id}>
				<input class=rId type="hidden" value={{replyer}}>
				<input class=r_no type="hidden" value={{r_no}}>
			</td>	
			<td width=50>
				<img width=20 height=20 src="../display?fileName=xicon.png" class="rbtnDelete">	
			</td><br><br>
		</tr>
		{{/each}}
	</script>
	</c:if>
	<br>
	<form action="/b_reply/insert" method="post" name="rfrm">
	<img width=70 height=70 style="border-radius:50%;float:left;margin-right:15px;" src="../display?fileName=${u_image}"/>
		<input type="hidden" name="b_no" value="${vo.b_no}">
		<input type="hidden" name="replyer" value="${id}">
		<textarea name="content" style=width:1030px;height:100px;resize:none></textarea>
		<input style="float:right;width:136px;height:38px;border:none;background:#2b4163;border-radius:5px 5px 5px 5px;color:white;margin-right:18px;" type="submit" value="댓글 남기기">		
	</form>
	<br><br><br>
	<div id="pagination" >		
			<ul class="pagination" style="margin-left:380px;">
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
		<br>
	</div>
         </div> 
      </div>   
   </div>
</body>
<script>   
var b_no="${vo.b_no}";
var view="${vo.view}";
var follower="${id}";
var target="${vo.id}";
var id="${id}";

   getFollow();

   $("#btnReply").hide();

   $("#report").on("click", function(){
      var b_no="${vo.b_no}";
      window.open("/board/report?b_no="+b_no,"","width=600px, height=800px");
   });

   $("#follow").on("click",function(){
      $.ajax({
         type:"post",
         url:"/user/followUpdate",
         data:{"follower":follower,"target":target},
         success:function(data){
            $("#follower").html("팔로워: "+data);
            getFollow(); 
          }
      })
   });

$("#LikeBtn").on("click",function(){
   $.ajax({
      type:"post",
      url:"/board/like/update",
      data:{"id":id,"b_no":b_no},
      dataType:"json",
      success:function(data){
         $("#LikeBtn").val("좋아요/"+data);
         location.reload()
      }
   })
})

 $(".lbClose").on("click", function(){
           modal.style.display = "none";
           $('html').css("overflow", "scroll");
           $('html').css("overflow-x", "hidden");
          })


$("#btnDelete").on("click", function(){
   if(!confirm("삭제하실래요?")) return;
   frm.action="delete";
   frm.submit();
});

function getFollow(){
   $.ajax({
      type:"post",
      url:"/user/followChk",
      data:{"follower":follower,"target":target},
      success:function(data){
         if(data==1){
            $("#follow").html("언팔로우");
         }else{
            $("#follow").html("팔로우");
         }
      }
   });
}

</script>

</html>