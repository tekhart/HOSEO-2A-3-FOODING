<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<title>
자주하는 질문
</title>
<style>

</style>
</head>
<body id="body">
<%@include file="../general_included/topbar.jsp"%>
     
<div id="maindiv">

<div class="writetitle1">
자주하는 질문</div>



<br><br><br><br><br><br>
<table style="width:1400px; margin:auto;"><tr><td>
<button class="accordion">대량 구매 관련 문의를 하고 싶습니다.</button>
<div class="panel">
  <p>보다 자세한 답변을 위해 물량, 배송처, 배송 기간 등의 확인이 필요하오니 메일(fooding2019_2a03@naver.com)이나 02-1212-2323 로 문의해주시면 감사하겠습니다.</p>
</div>

<button class="accordion">개인정보 변경은 어디서 하나요?</button>
<div class="panel">
  <p>로그인 후 화면 상단에 있는 마이페이지에서 [개인정보 관리] 버튼을 클릭하면 회원 정보를 변경하실 수 있습니다.</p>
</div>

<button class="accordion">포크가 뭔가요?</button>
<div class="panel">
  <p>푸딩 온라인쇼핑몰에서 상품 구입 , 각종 커뮤니티 활동 등을 통해 쌓게 되는 온라인 활동지수로 상품 할인 혜택을 받을 수 있는 활동 포인트입니다.</p>
</div>

<button class="accordion">메인화면의 레시피는 어떤 기준으로 보여지나요?</button>
<div class="panel">
  <p>상단의 슬라이드 화면에서는 조회수가 50 이상인 인기레시피가 보여집니다. 인기레시피 밑의 '오늘의 레시피'에는 최신 레시피 8개가 보여집니다.</p>
</div>
<button class="accordion">포크가 적립되는 시점은 언제인가요?</button>
<div class="panel">
  <p>포크는 제품 구매 시 금액의 1%씩 적립되며,  레시피 작성 시 5포인트씩 적립됩니다. </p>
</div>
<button class="accordion">맞춤 레시피의 기준은 무엇인가요?</button>
<div class="panel">
  <p>4개 이하를 체크했을 시, 그와 하나라도 관련된 모든 레시피를 보여줍니다. 4개 이상 체크시, 보다 정확한 결과를 얻으실 수 있습니다.</p>
</div>

</td></tr></table>

</div>
<br><br><br><br><br><br>
<script>
var acc = document.getElementsByClassName("accordion");
var i;
 
for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active1");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>
<%@include file="../general_included/footer.jsp"%>
</body>
</html>
