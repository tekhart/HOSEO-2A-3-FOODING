<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
			function sendingthumb(thumbname){
                $("#thumbnail").css("background-image","url("+thumbname+")");
                $("#thumbnail").innerhtml="";
                $("#inputthumbnail").val(thumbname);

			}
			function thumbnailupload(){
				window.open("thumbUpload/fileForm.jsp", "a", "width=400, height=300, left=100, top=50"); 
			}
		</script>
		<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="admincss.css">
</head>
<body>
	<%@include file="../general_included/topbar.jsp"%>
	<br><br><br><br>
	<form method="post" action="shopuploadpro.jsp">
		<input type="hidden" id="inputthumbnail" name="productThumb">
		<table class="goodsuptb">
			<tr>
				<td>
					제품명
				</td>
				<td>
					<input type="text" name="productName" class="whiteinput">
				</td>
			</tr>
			<tr>
				<td>
					도구/재료
				</td>
				<td>
					<select name="isTool">
						<option value='1'>도구1</option>
						<option value='2'>재료2</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					타입
				</td>
				<td>
					<select name="productType">
						<option value='1'>과일</option>
						<option value='2'>채소</option>
						<option value='3'>정육/계란</option>
						<option value='4'>수산물/건어물</option>
						<option value='5'>과자/초콜릿/시리얼</option>
						<option value='6'>면/통조림/가공식품</option>
						<option value='7'>가루/조미료/오일</option>
						<option value='8'>장/소스/드레싱/식초</option>
						<option value='9'>유제품/아이스크림</option>
						<option value='10'>냉장/냉동/간편식</option>
						<option value='11'>주방가전</option>
						<option value='12'>냄비/프라이팬</option>
						<option value='13'>칼/도마</option>
						<option value='14'>테이블웨어</option>
						<option value='15'>밀폐용기</option>
						<option value='16'>주방수납/정리</option>
						<option value='17'>주방조리도구</option>
						<option value='18'>주방잡화</option>
						<option value='19'>일회용품</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						가격
					</td>
					<td>
						<input type="text" name="price" class="whiteinput">
					</td>
				</tr>
				<tr>
					<td>
						할인률
					</td>
					<td>
						<input type="text" name="discountRate"  class="whiteinput">%
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<div id="thumbnail" onclick="thumbnailupload()" class="goodsthumb">썸네일</div>
					</td>
				</tr>
			</table>
				
				<table style="width:200px; margin:auto;">
				<tr>
					<td>
						<input type="submit" value="입력완료" class="findbutton">
					</td>
					<td>
						<input type="button" value="뒤로가기" onclick="location.href='goods.jsp'" class="findbutton">
					</td>
					</tr>
				</table>
				
	</form>
	<%@include file="../general_included/footer.jsp"%>
</body>
</html>
