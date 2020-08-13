<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<br>
   <button id="check_module" type="button">결제하기</button>
<input type=hidden id=successPayment>


   <script>
   
   
$("#check_module").click(function () {
	if($('input[name="gender"]:checked').val() == 2) {
		addr=users_address+"/"+users_addressDetail;
	}
	else{
		if($("#addrList option:selected").val()!=""){
			
			addr=$("#addrList option:selected").val();
		}
		else{
			addr=$("#addr").html();
		}
	}
	
var totPay=$("#tot").html();
var P_email="${uvo_email}";
var IMP = window.IMP; // 생략가능
IMP.init('imp34076568');


IMP.request_pay({
pg: 'danal', // version 1.1.0부터 지원.
/*
'kakao':카카오페이,
html5_inicis':이니시스(웹표준결제)
'nice':나이스페이
'jtnet':제이티넷
'uplus':LG유플러스
'danal':다날
'payco':페이코
'syrup':시럽페이
'paypal':페이팔
*/
pay_method: 'card',
/*
'samsung':삼성페이,
'card':신용카드,
'trans':실시간계좌이체,
'vbank':가상계좌,
'phone':휴대폰소액결제
*/
merchant_uid: 'merchant_' + new Date().getTime(),
/*
merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
참고하세요.
나중에 포스팅 해볼게요.
*/
name: '주문명:결제테스트',
//결제창에서 보여질 이름
amount: 1000,
//가격
buyer_email: P_email,
buyer_name: '구매자이름',
buyer_tel: '010-1234-5678',
buyer_addr: '서울특별시 강남구 삼성동',
buyer_postcode: '123-456',
m_redirect_url: 'https://www.yourdomain.com/payments/complete'
/*
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
var msg = '결제가 완료되었습니다.';
msg += '고유ID : ' + rsp.imp_uid;
msg += '상점 거래ID : ' + rsp.merchant_uid;
msg += '결제 금액 : ' + rsp.paid_amount;
msg += '카드 승인번호 : ' + rsp.apply_num;
	$("#successPayment").val(1);
} else {
var msg = '결제에 실패하였습니다.';
msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);

success();
});
});

function success(){
	var a=$("#successPayment").val();
	var pointU=$("#savePoint").html();
	if($("#selbox").val() == "direct") {
		requirement=$("#selboxDirect").val();
	}
	if(a==1){
		$.ajax({
			type:"post",
			url:"/product/payment/finish",
			data:{"p_no":p_no,"quan":quan,"point":pointU,"requirement":requirement,"addr":addr},
			success:function(){
				location.href="/product/list";
			}
			
		})
	}

}
</script>



</body>
</html>