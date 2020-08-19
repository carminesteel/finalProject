<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>[장바구니]</title>
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <style>
   html{
   	font-family:Noto Sans Kr
   }
   
#cart {
	margin: auto;
	text-align: center;
	overflow: hidden;
	border-collapse: collapse;
}

.pButton {
	cursor: pointer;
	text-align: center;
	margin: auto;
}

.pButton:hover {
	background-color: #74a4d7;
	color: white;
	border-color: #74a4d7;
}

.pButtons {
	font-size: 20px;
	font-weight: 300;
	text-align: center;
	margin: auto;
}

#divFinal {
	text-align: center;
	padding-left: 185px;
	margin-top: 20px;
	height: 200px;
}

#exBody {
	background-color: #e9ecef;
	z-index: 1;
}

#exCenter {
	background-color: white;
	width: 1186px;
	margin: auto;
	z-index: 2;
	padding: 45px;
}

#eContent {
	font-size: 30px;
	font-weight: 300;
	width: 600px;
	color:black;
	margin-left:115px;
	margin-bottom:35px;
}

#eTitle {
	font-family: Noto Sans KR;
	font-weight: bold;
	font-size: 70px;
	height: 80px;
	color:black;
	margin-left:115px;
}
</style>
</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
   <jsp:include page="../menu.jsp"></jsp:include>
   <div id="exBody">
   	<div id=exCenter>
   		<div id=eTitle>Cart</div>
			<div id=eContent>장바구니</div>
<%--    <table id="cart" border=1>
         <tr>
            <td><input type="checkbox" id="checkAll" checked></td>
            <td>상품정보</td>
            <td>상품금액</td>
            <td>수량</td>
            <td>총액</td>
         </tr>
         <c:forEach items="${list}" var="cart">
         <tr class="row">
            <td width=70><input type="checkbox" class="check" checked></td>
            <td width=488>
               <div class="id" style="display:none;">${cart.id}</div>
               <div class="p_no" style="display:none;">${cart.p_no}</div>
               <img src="/display?fileName=${cart.p_image}" width=150 height=150>
            </td>
            <td width=233 class="price">${cart.price}</td>
            <td width=344>
               <input type="button" value="-" class="minus">
               <input type="text" value="${cart.quantity}" size=2 style="text-align:center;" class="quantity">
               <input type="button" value="+" class="plus">
            </td>
            <td width=235 class="total">${cart.price*cart.quantity}</td>
         </tr>
         </c:forEach>
      </table> --%>
      
      <table id="cart"></table>
      <script id="temp" type="text/x-handlebars-template">
         <tr style="height:50px;background:#2b4163;color:white;">
            <td><input type="checkbox" id="checkAll" checked></td>
            <td>상품이미지</td>
			<td>상품정보</td>
            <td>상품금액</td>
            <td>수량</td>
            <td>총액</td>
         </tr>

         {{#each .}}
            <tr class="row" height=125px style="border-bottom:1px solid #b3c6e6;">
               <td width=30px><input type="checkbox" class="check" checked></td>
               <td width=90px;>
                  <div class="id" style="display:none;">{{id}}</div>
                  <div class="buydate" style="display:none;">{{buydate}}</div>
                  <div class="p_no" style="display:none;">{{p_no}}</div>
                  <div class="p_image" style="display:none;">{{p_image}}</div>
                  <img src="/display?fileName={{p_image}}" height=90px style="object-fit:contain;">
               </td>
				<td width=385px; style="font-weight:500">{{title}}</td>
               <td width=233 class="price">{{price}}원</td>
               <td width=120px>
                  <input style="border:2px solid #b3c6e6;border-radius:10%;background:none;height:22px;width:22px;" type="button" value="-" class="minus">
                  <input style="border:2px solid #b3c6e6;border-radius:10%;background:none;text-align:center;" type="text" value="{{quantity}}" size=2 style="text-align:center;" class="quantity">
                  <input style="border:2px solid #b3c6e6;border-radius:10%;background:none;height:22px;width:22px;" type="button" value="+" class="plus">
               </td>
               <td width=70px class="total">{{sum}}원</td>
            </tr>
         {{/each}}
      </script>
      <input style="float:right;padding-bottom:5px;margin-right:100px;margin-top:15px;background:#2b4163;border:none;width:100px;height:28px;font-weight:600;color:white;border-radius:5px 5px 5px 5px;" type="button" value="선택삭제" id="cartdelete">
      
      <div id="divFinal">
         <div id="divSum">
            <div>
               <h5>상품금액</h5>
               <input type="text" id="totSum" readonly> 원
            </div>
         </div>
         <div id="divOper">
            <div>+</div>
         </div>
         <div id="divShipping">
            <div>
               <h5>배송비</h5>
               <input type="text" value="2500" readonly id="delivery"> 원
            </div>
         </div>
         <div id="divOper">
            <div>=</div>
         </div>
         <div id="divtotSum">
            <div>
            <h5>결제예정금액</h5>
            <input type="text" id="ttotSum" readonly> 원 <br>
            </div>
         </div>
      </div>
      <br>
       <div class="pButton" id="order" style="width:513px;height:51px;border-radius:10px 10px 10px 10px;border:1px solid #2b4163;display:inline-block;margin-top:5px;line-height:49px">
   <t class="pButtons" style="font-size:25px">구매하기</t>
   </div>
   </div>
   
  
   </div>
   <jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>
   var price;
   var quantity;
   var sum;
   var total;
   var delivery;
   var ttotal;
   
   getList();
   $("#cartdelete").on("click", function(){
      var is_check=$("input:checkbox[class=check]:checked").length;
      if(!confirm("선택한 "+is_check+"개의 상품을 장바구니에서 삭제하시겠습니까?")) return;
      $("#cart .row .check:checked").each(function(){
         var id="${id}";
         var p_image=$(this).parent().parent().find(".p_image").html();
         $.ajax({
            type:"get",
            url:"/cart/rest/delete",
            data:{"id":id, "p_image":p_image},
            error:function(){
               alert("xxxx");
            },
            success:function(){
               getList();
            }
         });
      });
      alert("삭제 되었습니다.");
   });
   
	$(".pButtons").on("click", function(){
		var id="${id}";
		var p_images = new Array();
		var tot=$("#ttotSum").val();
		if(!confirm("구매페이지로 이동하시겠습니까?")) return;
		var i =0;
		$("#cart .row .check:checked").each(function(){
			
			p_images[i]=$(this).parent().parent().find(".p_image").html();
			i++;
		});
		
		location.href = "/product/order2?id="+id+"&tot="+tot+"&p_images="+p_images;
	}); 
   
   function getList(){
      var id="${id}";
      $.ajax({
         type:"get",
         url:"/cart/rest/list",
         data:{"id":id},
         success:function(data){
            var temp=Handlebars.compile($("#temp").html());
            $("#cart").html(temp(data));
            
            $("#cart .row").each(function(){
               price=$(this).find(".price").html();
               quantity=$(this).find(".quantity").val();
            });
            
            delivery=$("#delivery").val();
            total=0;
            ttotal=0;
            
            $("#cart .row .check:checked").each(function(){
               var row=$(this).parent().parent();
               price=row.find(".price").html();
               quantity=row.find(".quantity").val();
               sum=price*quantity;
               total=total+sum;
            });
            
            if(total>=50000){
               delivery=0;
               ttotal=parseInt(total)+parseInt(delivery);
               $("#totSum").val(total);
               $("#ttotSum").val(ttotal);
               $("#delivery").val(delivery);
            }else{
               delivery=2500;
               ttotal=parseInt(total)+parseInt(delivery);
               $("#totSum").val(total);
               $("#ttotSum").val(ttotal);
               $("#delivery").val(delivery);
            }
         }
      });
   }
   
   $("#cart").change(".row .check", function(){
      delivery=$("#delivery").val();
      ttotal=0;
      total=0;
      $("#cart .row .check:checked").each(function(){
         var row=$(this).parent().parent();
         price=row.find(".price").html();
         quantity=row.find(".quantity").val();
         sum=price*quantity;
         total=total+sum;
      });
      if(total>=50000){
         delivery=0;
         ttotal=parseInt(total)+parseInt(delivery);
         $("#totSum").val(total);
         $("#ttotSum").val(ttotal);
         $("#delivery").val(delivery);
      }else{
         delivery=2500;
         ttotal=parseInt(total)+parseInt(delivery);
         $("#totSum").val(total);
         $("#ttotSum").val(ttotal);
         $("#delivery").val(delivery);
      }
   });

   $("#cart").on("click", ".row .minus", function(){
      var id=$(this).parent().parent().find(".id").html();
      var p_no=$(this).parent().parent().find(".p_no").html();
      quantity=$(this).parent().find(".quantity").val();
      price=$(this).parent().parent().find(".price").html();
      if(quantity<=1){
         alert("최소수량입니다.");
      }else{
         $.ajax({
            type:"get",
            url:"/cart/minus",
            data:{"id":id, "p_no":p_no},
            success:function(){
               getList();
            }
         });
      }
   });
   
   $("#cart").on("click", ".row .plus", function(){
	  var row=$(this).parent().parent();
      var id=$(this).parent().parent().find(".id").html();
      var p_no=$(this).parent().parent().find(".p_no").html();
      var quantity=$(this).parent().find(".quantity").val();
      var price=$(this).parent().parent().find(".price").html();
      $.ajax({
         type:"get",
         url:"/cart/plus",
         data:{"id":id, "p_no":p_no},
         success:function(){
        	 getList();
         }
      });
   });
   
   $("#cart").on("click", "#checkAll", function(){
      if($(this).is(":checked")){
         $("#cart .row .check").each(function(){
            $(this).prop("checked", true);
         });
      }
      else{
         $("#cart .row .check").each(function(){
            $(this).prop("checked", false);
         });
      }
   });
   
   $("#cart").on("click", ".row .check", function() {
      var isChkAll = true;
         $("#cart .row .check").each(function() {
         if (!$(this).is(":checked")) {
            isChkAll = false;
         }
      });
      if (isChkAll) {
            $("#cart #checkAll").prop("checked", true);
         } else {
            $("#cart #checkAll").prop("checked", false);
      }
   });

</script>
</html>