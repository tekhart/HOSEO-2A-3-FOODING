<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
<link rel=stylesheet type=text/css
	href="../../daumeditor/css/editor.css" charset=utf-8 />
<script type=text/javascript charset=utf-8
	src="../../daumeditor/js/editor_loader.js"></script>
<script type="text/javascript" src="script.js"></script>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<script type="text/javascript">
			
		</script>




</head>
<body id="writebody">
	<%@include file="../general_included/topbar.jsp"%>

	<div id="maindiv">
		<%
			int num = 0;
			String strV = "";
			try {
				if (request.getParameter("num") != null) {
					num = Integer.parseInt(request.getParameter("num"));
				}
				if (session.getAttribute("idlogin") == null) {
					out.println("<script>alert('로그인을 먼저 하셔야합니다.');</script>");
					response.sendRedirect("../mains/main.jsp");
				}
				idlogin = (String) session.getAttribute("idlogin");
		%>
		<div class="writetitle1">레시피 작성</div>

		<div id="space">



			<form method="post" name="writeform" action="writePro.jsp"
				onsubmit="return writeSave()">
				<input type="hidden" name="num" value="<%=num%>"> <input
					type="hidden" name="writerid" value="<%=idlogin%>">
				<center>
					<table id="writetable" align="center" border-spacing="10px">
						<tr>
							<td align="right" colspan="2"></td>
						</tr>
						<tr>
							<td width="180" align="center" id="writespace">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
							<td width="330" align="left"><input type="text" size="40"
								maxlength="50" name="title" class="signupinputblack"
								style="ime-mode: normal;"></td>
						</tr>
						<tr>
							<td align="center" id="writespace">요리&nbsp;&nbsp;분류</td>
							<td align="left"><select name='contury'
								style="ime-mode: inactive; ime-mode: inactive; padding: .8em .5em; border-radius: 3px; border-color: #c0c0c0; font-size: 12pt; color: #6f6f6f; font-family: Bauhaus ITC;">
									<option value='' selected disabled hidden>-- 선택 --</option>
									<option value='한식'>한식</option>
									<option value='양식'>양식</option>
									<option value='일식'>일식</option>
									<option value='중식'>중식</option>
									<option value='퓨전'>퓨전</option>
									<option value='기타'>기타</option>
							</select> <select name='foodtype'
								style="ime-mode: inactive; ime-mode: inactive; padding: .8em .5em; border-radius: 3px; border-color: #c0c0c0; font-size: 12pt; color: #6f6f6f; font-family: Bauhaus ITC;">
									<option value='' selected disabled hidden>-- 선택 --</option>
									<option value='밥류'>밥류</option>
									<option value='빵류'>빵류</option>
									<option value='반찬류'>반찬류</option>
									<option value='면류'>면류</option>
									<option value='국류'>국류</option>
									<option value='디저트'>디저트</option>
									<option value='기타'>기타</option>
							</select> <select name='difficulty'
								style="ime-mode: inactive; ime-mode: inactive; padding: .8em .5em; border-radius: 3px; border-color: #c0c0c0; font-size: 12pt; color: #6f6f6f; font-family: Bauhaus ITC;">>
									<option value='' selected disabled hidden>-- 선택 --</option>
									<option value='1'>초급</option>
									<option value='2'>중급</option>
									<option value='3'>상급</option>
							</select></td>
						</tr>
						<tr>
							<td align="center" id="writespace">필요한 재료</td>
							<td align="left"><input type="text" size="100" maxlength="100"
								name="ingredients" class="signupinputblack"
								style="ime-mode: normal;"></td>
						</tr>
						<tr>
							<td align="center" id="writespace">사용되는 도구</td>
							<td align="left"><input type="text" size="100" maxlength="100"
								name="tools" class="signupinputblack" style="ime-mode: normal;"></td>
						</tr>
						<tr>
							<td align="center" id="writespace">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
							<td align="left"><jsp:include
									page="../../daumeditor/editor_frame.jsp"></jsp:include>
						</tr>

						<tr>
							<td></td>
							<td align="center">
								<input type="button" id="button123" value="확인" onclick="writeEnd()">
								<input type="reset" id="button123" value="다시 작성">
								<input type="button" id="button123" value="글목록" OnClick="window.location='../recipes/list.jsp'">
							</td>
						</tr>


					</table>
					<%
						} catch (Exception e) {
						}
					%>
				
			</form>
		</div>
	</div>


	<%@include file="../general_included/footer.jsp"%>

	<script type="text/javascript">
		var check_confirm_write=false;
		var checkUnload=true;
		
		$(window).on("beforeunload",function(){
			if(checkUnload){
				if(document.getElementById("upload_path")!=null){
					if(document.getElementById("upload_path").value !=''){
						var upload_path_value=document.getElementById("upload_path".value);
						var save_file_name_value=document.getElementById("save_file_name".value);
						$.post("/nonActionDeleteImage.do",{upload_path:upload_path_value,save_file_name_value}
						);
					}
				}
			}else{}
		});
		var config = {
			txHost: '', 
			txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */ 
			txService: 'sample', /* 수정필요없음. */
			txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */ 
			initializedId: "", /* 대부분의 경우에 빈문자열 */ 
			wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */ 
			form: 'writeform'+"", /* 등록하기 위한 Form 이름 */ 
			txIconPath: "${ pageContext.request.contextPath }/resources/daumOpenEditor/images/icon/editor/", /* 에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */ 
			txDecoPath: "${ pageContext.request.contextPath }/resources/daumOpenEditor/images/deco/contents/", /* 본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */ 
			canvas: { 
				exitEditor:{ /* desc:'빠져 나오시려면 shift+b를 누르세요.', hotKey: { shiftKey:true, keyCode:66 }, nextElement: document.getElementsByTagName('button')[0] */ 
					
				}, 
				styles: { color: "#123456", /* 기본 글자색 */ 
					fontFamily: "굴림", /* 기본 글자체 */ 
					fontSize: "10pt", /* 기본 글자크기 */ 
					backgroundColor: "#fff", /*기본 배경색 */ 
					lineHeight: "1.5", /*기본 줄간격 */ 
					padding: "8px" /* 위지윅 영역의 여백 */ 
				}, 
				showGuideArea: false 
			}, 
			events: { 
				preventUnload: false 
			}, 
			sidebar: { 
				attachbox: { 
					show: true, confirmForDeleteAll: true 
				} 
			}, 
			size: { 
				contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */ 
			} 
		}; 
		EditorJSLoader.ready(function(Editor) { 
			var editor = new Editor(config); 
		});
		function validForm(editor) { 
			var validator = new Trex.Validator(); 
			var content = editor.getContent(); 
			if (!validator.exists(content)) { 
				alert('내용을 입력하세요'); return false; 
			} return true; 
		}
		
		function setForm(editor) { 
			var i, input; 
			var form = editor.getForm(); 
			var content = editor.getContent(); // 본문 내용을 필드를 생성하여 값을 할당하는 부분 
			var textarea = document.createElement('textarea'); 
			textarea.name = 'content'; //name값 수정 
			textarea.value = content; 
			form.createField(textarea);
			return true; 
		}
		var checkload = true;
		jQuery(document).ready(function($) {
		    $("#btn_submit").click(function () {
		        checkload = false;
		    });
		    $(window).on("beforeunload", function () {
		        if (checkload == true) return "정말로 나가시겠습니까?";
		    });
		});
		function writeEnd(){
			checkload=false;
			Editor.save();
		}
			
		</script>
</body>
</html>