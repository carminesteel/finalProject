<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>[장바구니]</title>
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <style>
      #cart{
         margin: auto;
         text-align: center;
         overflow: hidden;
         border-collapse:collapse;
      }
      
      .pButton{cursor: pointer; text-align:center; margin:auto;}
      .pButton:hover{background-color:#74a4d7; color:white; border-color:#74a4d7;}
      .pButtons{font-size:20px;font-weight:300; text-align:center; margin:auto;}
      
      #divFinal {
         text-align: center;
         padding-left: 185px;
         margin-top: 20px;
         height: 200px;
      }
   </style>
</head>
<body>
   <jsp:include page="../menu.jsp"></jsp:include>
   <br><br><br><br><br><br><br><br>
   <div id="exBody">
      <table id="cart" border=1>
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
      </table>
      
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
               <input type="text" value="2500" readonly> 원
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
   </div>
   
   <div class="pButton" id="order" style="width:513px;height:51px;border-radius:10px 10px 10px 10px;border:1px solid #2b4163;display:inline-block;margin-top:5px;line-height:49px">
   <t class="pButtons" style="font-size:25px">구매하기</t>
   </div>
   <jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>
	total();
	
	function total(){
		var total=0;
		$("#cart .row .check:checked").each(function(){
			var row=$(this).parent().parent();
			var price=row.find(".price").html();
			var quantity=row.find(".quantity").val();
			var sum=price*quantity;
			total=total+sum;
		});
		$("#totSum").val(total);
	};
	
	$(".check").change(function(){
		total();
	});

   $("#cart").on("click", ".row .minus", function(){
      var id=$(this).parent().parent().find(".id").html();
      var p_no=$(this).parent().parent().find(".p_no").html();
      var quantity=$(this).parent().find(".quantity").val();
      var price=$(this).parent().parent().find(".price").html();
      if(quantity<=1){
         alert("최소수량입니다.");
      }else{
         $.ajax({
            type:"get",
            url:"/cart/minus",
            data:{"id":id, "p_no":p_no},
            success:function(){
               location.href="/cart/list?id="+id;
            }
         });
      }
   });
   
   $("#cart").on("click", ".row .plus", function(){
      var id=$(this).parent().parent().find(".id").html();
      var p_no=$(this).parent().parent().find(".p_no").html();
      var quantity=$(this).parent().find(".quantity").val();
      var price=$(this).parent().parent().find(".price").html();
      $.ajax({
         type:"get",
         url:"/cart/plus",
         data:{"id":id, "p_no":p_no},
         success:function(){
            location.href="/cart/list?id="+id;
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