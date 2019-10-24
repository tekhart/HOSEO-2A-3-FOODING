<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<SCRIPT>
function makeGraph() {
	var line1 = form1.a.value;
	var line2 = form1.b.value;
	var line3 = form1.c.value;
	var line4 = form1.d.value;
	var line5 = form1.e.value;
	if(document.all) {
		grWin = window.open("about:blank","gr","width=300,height=200");
		grWin.document.writeln("<html><head><title>그래프</title></head><body>");
		grWin.document.writeln("<p><b>그래프보기</p>");
		grWin.document.writeln("<div id=n1 style=\"width:20;height:6px;background-color:white;position:absolute;top:50;left:10\">1</div>");
		grWin.document.writeln("<div id=d1 style=\"width:"+line1+";height:6px;background-color:#ff5000;position:absolute;top:50;left:30\"></div>");
		grWin.document.writeln("<div id=n2 style=\"width:20;height:6px;background-color:white;position:absolute;top:70;left:10\">2</div>");
		grWin.document.writeln("<div id=d2 style=\"width:"+line2+";height:6px;background-color:#99ccff;position:absolute;top:70;left:30\"></div>");
		grWin.document.writeln("<div id=n3 style=\"width:20;height:6px;background-color:white;position:absolute;top:90;left:10\">3</div>");
		grWin.document.writeln("<div id=d3 style=\"width:"+line3+";height:6px;background-color:#ffcc00;position:absolute;top:90;left:30\"></div>");
		grWin.document.writeln("<div id=n4 style=\"width:20;height:6px;background-color:white;position:absolute;top:110;left:10\">4</div>");
		grWin.document.writeln("<div id=d4 style=\"width:"+line4+";height:6px;background-color:#5d5d5d;position:absolute;top:110;left:30\"></div>");
		grWin.document.writeln("<div id=n5 style=\"width:20;height:6px;background-color:white;position:absolute;top:130;left:10\">5</div>");
		grWin.document.writeln("<div id=d5 style=\"width:"+line5+";height:6px;background-color:#ff00dd;position:absolute;top:130;left:30\"></div>");
		grWin.document.writeln("</body></html>");
		grWin.document.close();
	}
}
</SCRIPT>
</head>
<body>
<FORM name=form1>
1번값 <INPUT TYPE="text" NAME="a" value=100><br>
2번값 <INPUT TYPE="text" NAME="b" value=80><br>
3번값 <INPUT TYPE="text" NAME="c" value=50><br>
4번값 <INPUT TYPE="text" NAME="d" value=100><br>
5번값 <INPUT TYPE="text" NAME="e" value=20><br>
<p><input type=button onClick="makeGraph()" value="그래프보기">
</p></FORM>
</body>
</html>
