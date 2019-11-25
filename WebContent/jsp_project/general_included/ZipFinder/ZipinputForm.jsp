<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소검색</title>

<link rel="stylesheet" href="../../css/common.css">
<script>
	function enterkey() {
		if (window.event.keyCode == 13) {
			searchingaddr();
		}
	}
	function searchingaddr() {
		if (document.zip.dong.value == "" || document.zip.dong.value == " ") {
			alert("입력해 주세요!")
			document.zip.dong.focus();
		} else {
			document.zip.submit();
		}
	}
</script>
</head>
<body>


	<form method="post" action="zipsearch.jsp" name="zip">
		<div width=300>

			<table cellspacing="0" width="100%">
				<tr>
					<td><input type="text" class="zipsearch" placeholder="동/읍/면"
						name="dong" onclick="enterkey()"></td>
					<td width="60px"><input type="button" value="찾기"
						class="zipfinder" onclick="searchingaddr()"></td>
				</tr>
			</table>

			<div class="zipdiv">
					검색할 지역의 동/읍/면의 이름을<br>빈칸없이 입력하세요
			</div>
			
	</form>

</body>
</html>