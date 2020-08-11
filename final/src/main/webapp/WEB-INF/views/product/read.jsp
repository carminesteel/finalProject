<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[상품정보]</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
.images{min-width:100%}

.input-group{
width: 120px;
  margin: 40px auto;
  position:absolute;
  left:1410px;
  top:540px;
}

.btn-danger, .btn-success{
	background-color:#2e6cb5;
	border-color:#2e6cb5;
}

.btn-danger:hover, .btn-success:hover{
	background-color:#2e6cb5;
	border-color:#2e6cb5;
}

.btn-danger:hover, .btn-success:hover{
	background-color:#2e6cb5;
	border-color:#2e6cb5;
}

html {font-family:Noto Sans KR}

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
.information {width:376px;}

.information:hover {
			background-color: #373e46;
		    color: white;
		    cursor: pointer;		    
		}
.review {width:376px;}
.qa {width:376px;}
.review:hover {
			background-color: #373e46;
		    color: white;
		    cursor: pointer;		    
		}
.qa:hover {
			background-color: #373e46;
		    color: white;
		    cursor: pointer;		    
		}		

.pButton{cursor: pointer;}
.pButton:hover{background-color:#74a4d7; color:white; border-color:#74a4d7;}
a:hover{text-decoration:none;color:black;}
#pBody{ width: 1275px; height: 1000px; margin: auto;}
#imgSection{width: 660px; height: 920px; display: inline-block; float: left;overflow:hidden}
#imgSection img{max-height:100%;object-fit:contain;}
#mainImg{width: 574px; height: 572px; margin-left: 67px; margin-top: 102px;}
#thumbImg{text-align:center;margin-left:35px;margin-top:-50px;}
.thumbs{background-color: white;border:1px solid #b3c6e6; display: inline-block; height: 81px; width: 81px; margin-top: 105px;}
#pInfo{width: 611px; height: 920px; display: inline-block; float: left;}
#pTitle{font-size: 40pt; font-family: Noto Sans KR; font-weight: 500; margin-top: 80px; margin-bottom: 0px;margin-left:35px;}
#pPrice, #totPrice{font-size:43px; font-family: Noto Sans KR; font-weight: 700; float: right; margin: 0px;margin-bottom:20px;margin-right:55px;color:#2e6cb5;letter-spacing:-4px}
#pointArea{width: 523px; height: 230px; border: 1px solid #2e6cb5; display: inline-block; float: left;margin-left:32px;padding:20px}
#pMenu{width:1130px;margin:auto;border-collapse:collapse;}
.reviews{border-bottom:1px solid #74a4d7;font-size:17px;letter-spacing:-1px}
.rContent{width:510px;margin:auto}
.pButtons{font-size:20px;font-weight:300}

</style>

</head>
<body style="padding-top: 73px; margin-left: 0px; width: 100%;">
	<jsp:include page="../menu.jsp"></jsp:include>
	<div id=exBody>
		<div id=exCenter>
			<div id=pBody>
				<div id=imgSection>
					<img id=mainImg src="/display?fileName=${read.image}">
					<div id=thumbImg>
							<div class=thumbs><img src="/display?fileName=${read.image}" width=81 height=81></div>
						<c:forEach items="${readimage}" var="readimage">
							<div class=thumbs><img src="/display?fileName=${readimage.detail_images}" width=81 height=81></div>
						</c:forEach>
					</div>
				</div>
				
				<div id="pInfo"><br>
					<h1 id=pTitle>${read.title}</h1>
					<p>
					<h1 id="pPrice">${read.price}원</h1>
					<br>
					<div id="pointArea">
						<div style="display: inline-block; float: left;">
							<t style="font-family:Noto Sans KR;font-size:20px;font-weight:500;">신규고객 전용 혜택</t><br> <t style="font-family:Noto Sans KR;font-size:12px;font-weight:500;">첫 구매시 결제금액의 50%를 할인해드립니다!</t>
							<div style="letter-spacing:-1px;text-align:right;margin-top:20px;border-bottom:1px solid #2e6cb5;font-size:20px;padding-bottom:10px;margin-bottom:20px;font-weight:600"><span style="font-size:25px;font-weight:900;">${read.name}</span>님의 예상 적립 포인트</div>
							<div style="padding:10px;color:white;background-color:#74a4d7;height:41px;width:475px;margin:auto;font-size:16px;font-weight:600">
								<span id="pointCal" ></span>
								<span id="point" style="float:right;">00point00</span>
							</div>
						</div>
					</div>
					<div style="border-bottom: 1px solid #2e6cb5; float: left; width: 523px;height:80px;padding:20px;padding-top:0px;margin-left:32px;">
					<br>
						<span style="font-size:16px;font-weight:500">배송비 : 2500원</span>

							<div class="input-group">
								<span class="input-group-btn">
									<button type="button" class="btn btn-danger btn-number"
										data-type="minus" data-field="quant[2]">
										<span class="glyphicon glyphicon-minus"></span>
									</button>
								</span> <input type="text" name="quant[2]" id="quantity"
									class="form-control input-number" value="1" min="1" max="100" style="text-align:center">
								<span class="input-group-btn">
									<button type="button" class="btn btn-success btn-number"
										data-type="plus" data-field="quant[2]">
										<span class="glyphicon glyphicon-plus"></span>
									</button>
								</span>
							</div>
							<br> <span style="font-size: 12px;">50,000원 이상구매시 배송비
								무료</span>
						</div>
						<div style="display: inline-block; float: left;">
						<div style="text-align:right;margin-bottom:30px;margin-top:20px;height:70px;line-height:70px;">
							<span id=quant style="font-size:16px"></span>&emsp;&emsp;<span style="font-size:25px;margin-right:5px">총 금액 :</span>
							<span id="totPrice" style="font-family: Noto Sans KR; font-size: 30pt;color:#2e6cb5;font-size:45px;letter-spacing:-4px;margin-right:15px">price</span>
							</div>
							<div style="width:523px;height:116px;text-align:center;margin-left:40px;">
								<div class="pButton" id="cart" style="width:254px;height:51px;border-radius:10px 10px 10px 10px;border:1px solid #2b4163;display:inline-block;line-height:49px">
								<t class="pButtons">장바구니</t>
								</div>
								<div class="pButton" id="pMessage" style="width:254px;height:51px;border-radius:10px 10px 10px 10px;border:1px solid #2b4163;display:inline-block;line-height:49px">
								<t class="pButtons">쪽지보내기</t>
								</div>
								<div class="pButton" id="order" style="width:513px;height:51px;border-radius:10px 10px 10px 10px;border:1px solid #2b4163;display:inline-block;margin-top:5px;line-height:49px">
								<t class="pButtons" style="font-size:25px">구매하기</t>
								</div>
							</div>
					</div>
				</div>
				
				<div style="font-family:Noto Sans KR;float:left;margin-left:70px;font-size:20px;"><br>
					리뷰수 <span style="font-size:30px">N</span>&emsp; 평점 <span style="font-size:30px">N/N</span>
				</div>
			</div>
			<div style="border-bottom:1px solid #74a4d7;border-top:1px solid #74a4d7;height:100px;width:1130px;margin:auto;font-family:Noto Sans KR;font-size:25px;font-weight:700;text-align:center;line-height:100px;">베스트 상품리뷰</div>
			<table style="height:475px;width:575px;margin:auto;border-collapse:collapse;">
				<tr><td class=reviews><div class=rContent>[rating]<br>asdofk*** : 아 존나이뻐 미칠거같애여아 존나이뻐 미칠거같애여 아 존나이뻐 미칠거같애여아 존나이뻐 미칠거같애여아 존나이뻐 </div></td></tr>
				<tr><td class=reviews><div class=rContent>[rating]<br>asdofk*** : 만족합니다 두번째 구매해요 사랑해요 작가님 건강하세요 사랑ㄷ해요</div></td></tr>
				<tr><td style="border-bottom:none;font-size:17px;letter-spacing:-1px;"><div class=rContent>[rating]<br>asdofk*** : 너무 맘에 들어서 세번째 구매해요</div></td></tr>
			</table>
			
			<table id=pMenu>
				<tr style="height:100px;border-top:1px solid #74a4d7;border-bottom:1px solid #74a4d7;text-align:center;font-family:Noto Sans KR;font-size:25px;font-weight:700;">
					<td class=information>상세정보</td>
					<td class=review>상품리뷰(<span id="re">${re}</span>)</td>
					<td class=qa>Q&A(<span id="qe">${qe}</span>)</td>
				</tr>
				<tr style="text-align:center">
					<td colspan=3>
					<c:forEach items="${p_image}" var="p_image">
						<div class="images"><img src="display?fileName=${p_image.p_images}"></div>
					</c:forEach>
					<div id="reply2">
						<h3>리뷰쓰기</h3><jsp:include page="../p_reply/reply.jsp"/>
					</div>
					<div id="qna1">
						<h4>Q&A</h4>
						<jsp:include page="../qna/qna.jsp"></jsp:include>					
					</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
$("#reply2").hide();	
$("#qna1").hide();
$(".qa").on("click", function(){
	$("#qna1").show();
	$("#reply2").hide();
	
});


$(".review").on("click", function(){
	$("#reply2").show();
	$("#qna1").hide();
});
	//쪽지확인해보려고 만든거임
	$("#message").on("click",function(){
		location.href="/product/message"
	});
	
	//쪽지보내기
 	$("#pMessage").on("click",function(){
		var p_no="${read.p_no}";
		var receiver="${read.id}";
		var id="${id}";
		window.open("/product/paper?p_no="+p_no + "&receiver=" + receiver,"","width=350px, height=400px");
	});

	$("#imgSection").on("click", "#thumbImg .thumbs img", function(){
		var src=$(this).attr("src");
		$("#mainImg").attr("src",src);
	});

	/* 주소창에 있는 파라미터 값 가져오는 함수임 재밌게쓰세요 */
	function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	var totPrice;
	var quantity;
	
	getTotal();
	quant();

	function quant(){
		quantity = $("#quantity").val(); 
		$("#quant").html("수량 "+quantity+"개");
	}

	function getTotal(){
		var price = $("#pPrice").html();
		var quantity = $("#quantity").val();
		var pr=parseInt(price);
		var quan=parseInt(quantity);
	
		totPrice = pr*quan;
		var point=parseInt(totPrice*0.01);
		$("#pointCal").html("총 상품금액 "+(pr*quan)+"원의 1%");
		$("#point").html(point+" point");
		if(totPrice>=50000){
			$("#totPrice").html(totPrice);
		}else{
			$("#totPrice").html(totPrice+2500);
		}
	}

	/* 수량버튼 관련 스크립트 */
	$('.btn-number').click(function(e){
		e.preventDefault();
	    
		fieldName = $(this).attr('data-field');
		type      = $(this).attr('data-type');
		var input = $("input[name='"+fieldName+"']");
		var currentVal = parseInt(input.val());
		if (!isNaN(currentVal)) {
			if(type == 'minus'){
				if(currentVal > input.attr('min')) {
					input.val(currentVal - 1).change();
				} 
				if(parseInt(input.val()) == input.attr('min')) {
					$(this).attr('disabled', true);
				}
			}else if(type == 'plus'){
				if(currentVal < input.attr('max')) {
					input.val(currentVal + 1).change();
				}
				if(parseInt(input.val()) == input.attr('max')) {
					$(this).attr('disabled', true);
				}
			}
		}else{
			input.val(0);
		}
		quant();
		getTotal();
	});

	$('.input-number').focusin(function(){
		$(this).data('oldValue', $(this).val());
	});

	$('.input-number').change(function() {
		minValue =  parseInt($(this).attr('min'));
		maxValue =  parseInt($(this).attr('max'));
		valueCurrent = parseInt($(this).val());
	    
		name = $(this).attr('name');
		if(valueCurrent >= minValue) {
			$(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
		}else{
			alert('Sorry, the minimum value was reached');
			$(this).val($(this).data('oldValue'));
		}
		if(valueCurrent <= maxValue) {
			$(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
		}else{
			alert('Sorry, the maximum value was reached');
			$(this).val($(this).data('oldValue'));
		}
	});

	$(".input-number").keydown(function (e) {
		// Allow: backspace, delete, tab, escape, enter and .
		if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
			// Allow: Ctrl+A
			(e.keyCode == 65 && e.ctrlKey === true) || 
			// Allow: home, end, left, right
			(e.keyCode >= 35 && e.keyCode <= 39)) {
				// let it happen, don't do anything
			return;
		}
		// Ensure that it is a number and stop the keypress
		if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
			e.preventDefault();
		}
	});
    
	//장바구니버튼
	$("#cart").on("click",function(){
		var id="${id}";
		var p_no="${read.p_no}";
		var p_image="${read.image}";
		var title="${read.title}";
		var price="${read.price}";
		var quantity=$("#quantity").val();
		   
		$.ajax({
			type:"get",
			url:"/cart/insert",
			data:{"id":id, "p_no":p_no, "p_image":p_image, "title":title, "price":price, "quantity":quantity},
			error:function(){
				alert("xxx");
			},
			success:function(){
				if(confirm("상품구매를 위해 장바구니로 이동 하시겠습니까?")==true){
					alert("장바구니로 이동합니다.");
				}else{
					alert("상품을 장바구니에 담았습니다.");
					return;
				}
				location.href="/cart/list?id="+id;
			}
		});
	});
	
	$("#order").on("click",function(){
		var p_no = getParameterByName('p_no');
		var id="${id}";
		quantity = $("#quantity").val(); 
		var tot= $("#totPrice").html();
		location.href="/product/order?id="+id+"&p_no="+p_no+"&quantity="+quantity+"&tot="+tot;
	});
</script>
</html>