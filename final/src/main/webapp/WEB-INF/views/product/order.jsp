<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=285177e645b698276895abf188247b00&libraries=services"></script>
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
#selbox {
	text-align: center;
}

body {
	padding-top: 73px;
	margin-left: 0px;
	width: 100%;
}

html {
	font-family: Noto Sans Kr
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
	color: black;
	margin-left: 45px;
	margin-bottom: 35px;
}

#eTitle {
	font-family: Noto Sans KR;
	font-weight: bold;
	font-size: 70px;
	height: 80px;
	color: black;
	margin-left: 45px;
}

#check_module {
	padding-bottom: 5px;
	background: #2b4163;
	border: none;
	width: 200px;
	height: 70px;
	font-weight: 300;
	color: white;
	border-radius: 5px 5px 5px 5px;
	font-size: 25px;
	font-family: Noto Sans Kr;
	margin-top: 30px;
}

#check_module:hover {
	cursor: pointer;
}

#use:hover {
	cursor: pointer;
}

#cancel:hover {
	cursor: pointer;
}
</style>
</head>
<body>

	<jsp:include page="../menu.jsp"></jsp:include>
	<div id="exBody">
		<div id=exCenter>
			<div id=eTitle>Order</div>
			<div id=eContent>주문 상세정보</div>
			<div style="width: 1100px; height: 1000px; margin: auto;">

				<div>
					<table
						style="text-align: center; border-collapse: collapse; border: none">
						<tr
							style="background: #2b4163; border-top: #373e45; border-bottom: #373e45; height: 35px; color: white;">
							<td width=300 colspan=2>상품정보</td>
							<td width=200>판매자</td>
							<td width=200>가격</td>
							<td width=200>배송비</td>
							<td width=100>수량</td>
							<td width=100>할인</td>
							<td width=100>주문금액</td>
						</tr>
						<tr>
							<td width=150 style="padding: 15px;"><img
								src="../display?fileName=${pvo.image}" width=150 height=150></td>
							<td width=150>${pvo.title}</td>
							<td width=200>${pvo.id}</td>
							<td width=200>${pvo.price}</td>
							<td width=200>${shipping_fee}</td>
							<td width=100>${quan}</td>
							<td width=100>${discount}</td>
							<td width=100>${tot}</td>
						</tr>
					</table>
				</div>

				<div
					style="display: inline-block; float: left; width: 800px; padding: 30px; padding-top: 0px;">

					<h2>배송지정보</h2>


					배송지 선택 <input type="radio" name=gender value=1 checked>기본배송지
					<input type="radio" name=gender value=2>신규배송지
					<hr>
					<br> <br> ${uvo.nickname} (${uvo.name}) <br>
					<br> ${uvo.phone} <br>
					<br>
					<div id=userAddr>
						<c:if test="${not empty addrList}">
							<select id=addrList style="height: 28px">
								<c:forEach items="${addrList}" var="addr">

									<option>${addr.addr}</option>

								</c:forEach>
							</select>
						</c:if>
						<c:if test="${empty addrList}">
							<span id=addr>${uvo.addr}</span>
						</c:if>

					</div>

					<div id=addrApi style="display: none;">
						<div>
							<input type="button" class="btn-primary box"
								style="padding-bottom: 5px; background: #2b4163; border: none; width: 100px; height: 28px; font-weight: 600; color: white; border-radius: 5px 5px 5px 5px;"
								onclick="openAddress();" value="우편번호 찾기"><br>
						</div>
						<div>
							<input type="hidden" name="post" class="box" id="users_zipCode"
								placeholder="우편번호" required>
						</div>
						<div>
							<input type="text" name="roadAddress" class="box"
								value="${roadAddress}" id="users_address" placeholder="도로명주소"
								required>
						</div>
						<div>
							<input type="text" name="jibunAddress" class="box"
								value="${jibunAddress}" id="users_addressDetail"
								placeholder="상세주소" required>
						</div>

					</div>
					<hr>

					<br>
					<br> ${pvo.title} <br>
					<br> <select id=selbox style="width: 300px; height: 30px;">
						<option selected disabled=true>요청사항을 선택해 주세요</option>
						<option disabled=true>----------------------------------------------------------</option>
						<option value=direct>요청사항을 직접입력 해주세요</option>
						<option>부재시 경비실에 맡겨주세요</option>
						<option>오시기 전에 연락바랍니다</option>
						<option>문 앞에 두고 가주세요</option>
					</select> <br> <input type="text" id="selboxDirect" name="selboxDirect"
						size=60 placeholder="요청사항을 입력바랍니다." height=100>
					<hr>
					<h3>포인트 사용</h3>
					<br>
					<div>
						사용가능 포인트 / <span id=point>${uvo.point}Point</span>
						<c:if test="${uvo.point<1000}">
							<h6>1000point 부터 사용이 가능합니다.</h6>
						</c:if>
						<c:if test="${uvo.point>=1000}">
							<h3></h3>
						</c:if>
						사용 포인트 / <input type="text" id=usePoint value="" placeholder="0" size="4" maxlength="4">원 
						<input style="padding-bottom: 5px; background: #2b4163; border: none; width: 100px; height: 28px; font-weight: 600; color: white; border-radius: 5px 5px 5px 5px; margin-left: 20px; margin-bottom: 5px;"
							type="button" id=use value="전액사용">
						<input style="padding-bottom: 5px; background: #2b4163; border: none; width: 100px; height: 28px; font-weight: 600; color: white; border-radius: 5px 5px 5px 5px; margin-bottom: 5px;"
							type="button" id=usep value="사용">
						<input type="button" style="padding-bottom: 5px; background: #2b4163; border: none; width: 100px; height: 28px; font-weight: 600; color: white; border-radius: 5px 5px 5px 5px;"
							id=cancel value=취소>
					</div>
					<hr>

				</div>

				<div style="height: 300px;">
					<br>
					<br>
					<h2>주문자 정보</h2>
					<h5>${uvo.name}</h5>
					<h5>${uvo.phone}</h5>
					<h5>${uvo.email}</h5>

				</div>
				<div style="height: 300px">
					<h2>결제 금액</h2>
					<h1>
						<span id=tot>${param.tot}</span>원
					</h1>
					<h5>
						적립 Point // <span id=savePoint>0 </span> Point
					</h5>
					<c:if test="${cnt==0}">
						<h5>할인가 : 배송비를 제외한 금액의 50% 할인!</h5>
					</c:if>
					<c:if test="${cnt==1}">
						<h5>할인가 : 배송비 할인! 그리고 금액의 50% 할인!</h5>
					</c:if>
					<c:if test="${cnt==2}">
						<h5>할인가 : 0원</h5>
					</c:if>
					<c:if test="${cnt==3}">
						<h5>할인가 : 배송비 할인!</h5>
					</c:if>

					<jsp:include page="kakaoPay.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
var p_no="${pvo.p_no}";
var quan="${quan}";
var requirement="";
var users_address="";
var users_addressDetail="";
var addr="";
SavePoint();
$(function(){

      //직접입력 인풋박스 기존에는 숨어있다가

$("#selboxDirect").hide();
$("#selbox").change(function() {
	//직접입력을 누를 때 나타남
		if($("#selbox").val() == "direct") {
			$("#selboxDirect").show();
		}  else {
			$("#selboxDirect").hide();
			requirement=$("#selbox option:checked").text();
		}
	}) 
});

function SavePoint(){
	var ttot=$("#tot").html();
	$("#savePoint").html(ttot/100);
}

var point = "${uvo.point}";
var tot = "${param.tot}";
$("#use").on("click", function() {
	if (point < 1000) {
		alert("포인트는 최소 1000부터 사용가능합니다.");
	} else {
		$("#usePoint").val(point);
		$("#tot").html((tot - 2500) - point + 2500);
		SavePoint();

	}

})
$("#usep").on("click", function(){
	if (point < 1000) {
		alert("포인트는 최소 1000부터 사용가능합니다.");
	}else if($("#usePoint").val()>point){
		alert("보유포인트 이내로 적어주세요.")
		$("#usePoint").val("");
	}else{
		$("#tot").html((tot - 2500) - $("#usePoint").val() + 2500);
		SavePoint();
	}
})

$("#users_addressDetail").keyup(function(){
	users_addressDetail=$("#users_addressDetail").val();
})

$("#cancle").on("click",function(){
	$("#usePoint").html(0);
	$("#tot").html(tot);
	SavePoint();
})


$('input[name="gender"]').change(function(){

	if($(this).val() == 2) {

		$("#addrApi").show();
		$("#userAddr").hide();

	}else {

		$("#addrApi").hide();
		$("#userAddr").show();
	}

});

/*우편번호*/
function openAddress() {
   new daum.Postcode({
      oncomplete : function(data) {
         $("#users_zipCode").val(data.zonecode);
         $("#users_address").val(data.address);
         $("#users_addressDetail").focus();
         users_address=data.address;
      }
   }).open();
}


</script>
</html>