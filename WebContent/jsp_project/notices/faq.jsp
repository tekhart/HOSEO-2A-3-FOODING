<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="list.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<%@include file="../general_included/topbar.jsp"%>
<%@include file="../general_included/footer.jsp"%>
<style>

</style>
</head>
<body>

<button type="button" class="collapsible">대량 구매 관련 문의를 하고 싶습니다.</button>
<div class="content">
  <p>보다 자세한 답변을 위해 물량, 배송처, 배송 기간 등의 확인이 필요하오니 메일(osulloc.com@amorepacific.com)이나 02-6040-6364 로 문의해주시면 감사하겠습니다.</p>
</div>
<button type="button" class="collapsible">쿠폰이 없어졌습니다.</button>
<div class="content">
  <p>쿠폰이 소멸되는 경우는 기한이 만료되었거나 사용 완료되었을 가능성이 높습니다.</p>
</div>
<button type="button" class="collapsible">개인정보 변경은 어디서 하나요?</button>
<div class="content">
  <p>로그인 후 화면 상단에 있는 마이페이지에서 [회원정보 수정] 버튼을 클릭하면 뷰티포인트 사이트로 이동하여 회원 정보를 변경하실 수 있습니다.</p>
</div>
<button type="button" class="collapsible">찻잎포인트가 뭔가요?</button>
<div class="content">
  <p>오설록 온라인쇼핑몰에서 상품 구입 및 구매 후기 작성, 각종 커뮤니티 활동 등을 통해 쌓게 되는 온라인 활동지수로 이벤트 참여 및 사은품 교환 등 다양한 혜택을 받을 수 있는 활동 포인트입니다.</p>
</div>
<button type="button" class="collapsible">찻잎포인트는 어디에서 쓸 수 있나요?</button>
<div class="content">
  <p>고객님 활동(상품구입, 구매후기,이벤트참여등)으로 적립받으신 찻잎포인트는 사이트에서 진행하는 이벤트 참여 및 쿠폰으로 포인트를 교환하여 사용하실 수 있습니다.</p>
</div>
<button type="button" class="collapsible">포인트가 적립되는 시점은 언제인가요?</button>
<div class="content">
  <p>포인트는 제품 구매 시 상품 별로 정해진 적립 비율에 따라 포인트가 적립되며 마이페이지에서 수취확인을 클릭하거나(당일), 배송 완료 후 7일이 경과한 후에(8일째) 적립됩니다.</p>
</div>

<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active1");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
</script>
</body>
</html>
