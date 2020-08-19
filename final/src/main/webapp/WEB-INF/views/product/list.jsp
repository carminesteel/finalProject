<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[상품목록]</title>
<style>
html {
   font-family: Noto Sans KR
}

#exBody {
   background-color: #e9ecef;
   z-index: 1;
}

#exCenter {
   background-color: white;
   width: 1276px;
   margin: auto;
   z-index: 2;
}

.creatertab .proimage td {
   display: none;
}

.creatertab .proimage td:nth-child(1), .creatertab .proimage td:nth-child(2),
   .creatertab .proimage td:nth-child(3) {
   display: inline-block
}

#productMenu {
   width: 100%;
   font-size: 18px;
   margin: auto;
   height: 60px;
   padding-top: 0px];
   padding-bottom: 0px;
   padding-left: 20px;
   background: white;
   border-radius: 5px 5px 5px 5px;
   margin-bottom:35px;
}

.menuB {
   text-decoration: none;
   color: black;
}

.menuB:hover {
   cursor: pointer;
   border-bottom: 2px solid black
}

.menuS {
   cursor: pointer;
   border-bottom: 2px solid black
}

body {
   width: 1000px;;
}

#besttab, #artgoodstab {
   width: 1375px;
   margin: auto;
   text-align: center;
   overflow: hidden;
}

#creater {
   width: 1275px;
   margin: auto;
   overflow: hidden;
   padding-top: 40px;
   padding-bottom: 40px;
}

.creatertab {
   background: white;
   width: 616px;
   height: 360px;
   float: left;
   margin: auto;
   float: left;
}

.creatertab:hover {
   box-shadow: 1px 1px 8px #98a4b1;

   transition: box-shadow 500ms;
}


.creatertab .creater td:hover{
   cursor:pointer;
   
}

.box {
   margin-left:10px;
   margin-right:10px;
   background: white;
   width: 255px;
   height: 350px;
   float: left;
   text-align: left;
   margin-top: 40px;
   border-radius:10px 10px 0px 0px
}

.box:hover {
   cursor: pointer;
   
}

.image {
   display: block;
   overflow: hidden;
   height: 255px;
   width: 255px;
   border-radius:10px 10px 0px 0px
}

.image img {
   vertical-align: middle;
   display: block;
   max-width: 100%;
   min-height: 255px;
   object-fit: cover
}

.proImg {
   max-width: 100%;
   object-fit: cover;
}

/* 메뉴에 언더바 따라오게 */
nav {
   position: relative;
   display: flex;
   height: 55px;
   padding-left: 790px;
}

nav a {
   display: block;
   padding: .95em 0;
   color: #333;
   text-decoration: none;
   text-align: center;
}

#best, #artgoods {
   padding-bottom: 50px;
}

.price{font-size:24px;float:right;padding-bottom:0px;}
.title{font-size:17px;font-weight:700;margin-top:5px;}
.content{font-size:15px}
.title, .price, .content{padding-left:10px;padding-right:10px;}

#eTitle {
	letter-spacing: -2px;
	font-family: Noto Sans KR;
	font-size: 87px;
	text-align: center;
	font-weight: bold;
	margin-top: 60px;
}

#eContent {
	font-family: Noto Sans KR;
	text-align: center;
	font-weight: light;
	font-size: 30px;
	margin-top: 20px;
}

.more {
	margin-left:1550px;
	font-family: Noto Sans KR;
	text-align: center;
	margin-right: 55px;
	background: #2b4163;
	color: white;
	border: 1px solid black;
	border-radius: 20px 20px 20px 20px;
	width: 160px;
	height: 30px;
	text-decoration:none;
	padding-left:15px;
	padding-right:15px;
	padding-bottom:5px;
}
</style>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
   <jsp:include page="../menu.jsp"></jsp:include>

   <div id=eTitle>Art Goods</div>
   <div id=eContent>현재 판매중인 상품이에요</div>
   <table id=productMenu>   
      <tr>
         <td><nav>
               <a class=menuS id="bestmenu">Best</a>&emsp;&emsp;&emsp; <a
                  class=menuB id="artgoodsmenu">Gallery</a>&emsp;&emsp;&emsp; <a
                  class=menuB id="purchasemenu">Artist</a>
               <div class="nav-underline"></div>
            </nav></td>
      </tr>
   </table>
    <c:if test="${id!=null}">
		<a href="/board/insert" class=more id=bButton style="margin-bottom:35px;">Upload</a>
	</c:if>
	<br><br>
   <div id=exBody style="padding-top:0px;">    
         <div id="best">
            <div id="besttab"></div>
            <script id="besttemp" type="text/x-handlebars-template">
         {{#each .}}
            <div class="box">
               <input type="hidden" value="{{p_no}}" class="p_no">
               <div class="image"><img src="/display?fileName={{image}}"/></div>
               <div class="title" style="width:245px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">{{title}}</div>               
               <div class="content" style="width:245px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">{{content}}</div>
               <div class="price">{{price}}원</div>
               <div class="id" style="display:none">{{id}}</div>
            </div>
         {{/each}}
      </script>
         </div>

         <div id="artgoods" style="display: none">
            <div id="artgoodstab"></div>
            <script id="artgoodstemp" type="text/x-handlebars-template">
         {{#each .}}
            <div class="box">
               <input type="hidden" value="{{p_no}}" class="p_no">
               <div class="image"><img src="/display?fileName={{image}}"/></div>
               <div class="title" style="width:245px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">{{title}}</div>
               <div class="content" style="width:245px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">{{content}}</div>
               <div class="price">{{price}}원</div>
               <div class="id" style="display:none">{{id}}</div>
            </div>
         {{/each}}
      </script>
         </div>

         <div id="creater">
            <c:forEach items="${users}" var="creater">
            	<c:if test="${creater.position!=3 || creater.position!=4}">
               <table class="creatertab" style="margin: 10px; padding: 25px; border-radius: 5px 5px 5px 5px;">
                  <tr class="creater">
                     <td id="creater" width=149 colspan=3 style="padding-bottom: 25px;">
                        <input type=hidden id="c_id" value="${creater.id}">
                        <img src="/display?fileName=${creater.u_image}"   style="float: left; border-radius: 50%;" width=75 height=75 />
                        <span style="text-align: left; width: 200px; float: left; padding-left: 25px;">
                              <p class="createrid" style="font-weight: bold; font-size: 24px; margin: 0;">${creater.nickname}</p>
                              <p style="font-size:15px;margin:0;white-space:nowrap;text-overflow:ellipsis">${creater.introduce}</p>
                        </span>
						<span id="total" style="float: right; background: #e9e9e9; position: relative;
							top: 15px; padding: 5px; border-radius: 20px 20px 20px 20px; font-size: 13px;
							width: 80px; height: 28px; text-align: center;line-height:26px;color:#373e45">
							상품개수 ${creater.cnt}개
						</span>
                     </td>
                  </tr>
                  <tr class="proimage">
                     <c:forEach items="${proimage}" var="image">
                        <c:if test="${creater.id==image.id}">
                           <td width=180 height=190 style="margin: 2px;">
                              <img class=proImg src="/display?fileName=${image.image}" width=100% height=100%>
                              <span class="creater_no" style="display:none;">${image.p_no}</span>
                           </td>
                        </c:if>
                     </c:forEach>
                  </tr>
               </table>
               </c:if>
            </c:forEach>
         </div>
      
   </div>
   <jsp:include page="../footer.jsp"></jsp:include>

</body>

<script>

   getBest();
   artgoods();
   $("#artgoods").hide();
   $("#creater").hide();

   $("#bestmenu").on("click", function() {
      $("#bestmenu").attr("class","menuS")
      $("#artgoodsmenu").attr("class","menuB")
      $("#purchasemenu").attr("class","menuB")
      $("#best").show();
      $("#artgoods").hide();
      $("#creater").hide();
   });

   $("#artgoodsmenu").on("click", function() {
      $("#bestmenu").attr("class","menuB")
      $("#artgoodsmenu").attr("class","menuS")
      $("#purchasemenu").attr("class","menuB")
      $("#best").hide();
      $("#artgoods").show();
      $("#creater").hide();
   });

   $("#purchasemenu").on("click", function() {
      $("#bestmenu").attr("class","menuB")
      $("#artgoodsmenu").attr("class","menuB")
      $("#purchasemenu").attr("class","menuS")
      $("#best").hide();
      $("#artgoods").hide();
      $("#creater").show();
   });

   $("#besttab").on("click", ".image", function() {
      var p_no = $(this).parent().find(".p_no").val();
      var id = $(this).parent().find(".id").html();
      location.href = "/product/read?p_no=" + p_no + "&id=" + id;
   });

   function getBest() {
      $.ajax({
         type : "get",
         url : "/product/rest/bestlist",
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#besttemp").html());
            $("#besttab").html(temp(data));
         }
      });
   }
   
   $("#creater").on("click", ".creatertab .proimage .proImg", function(){
      var id = $(this).parent().parent().parent().find(".createrid").text();
      var p_no=$(this).parent().find(".creater_no").text();
      location.href = "/product/read?p_no=" + p_no + "&id=" + id;
   });

   $("#artgoodstab").on("click", ".image", function() {
      var p_no = $(this).parent().find(".p_no").val();
      var id = $(this).parent().find(".id").html();
      location.href = "/product/read?p_no=" + p_no + "&id=" + id;
   });

   function artgoods() {
      $.ajax({
         type : "get",
         url : "/product/rest/artgoods",
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#artgoodstemp").html());
            $("#artgoodstab").html(temp(data));
         }
      });
   }
   
   //user read
   $(".creatertab").on("click",".creater #creater",function(){
      var id=$(this).find("#c_id").val();
      if("${id}"!=id){
      location.href = "/user/read?id=" + id;}
      else{
         location.href= "/login/mypage";
      }
   })
</script>

</html>