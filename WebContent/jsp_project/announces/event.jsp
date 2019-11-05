<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<title>이벤트</title>
		<link rel="shortcut icon" href="../img/favicon.ico">
		<link rel="icon" href="../img/favicon.ico">
	
	<style>
	.eventdiv {
	  width:1300px;
	  height: 400px; 
	  margin: auto;
	  border:10px solid white;
	  box-shadow:5px 5px 5px 5px gray;  
	  margin-top:40px;
	}
	
	
	
	.bgimg {
	  background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('../img/tomato.jpg');
	  height: 100%;
	  background-position: center;
	  background-size: cover;
	  position: relative;
	  color: white;
	  font-family: "Courier New", Courier, monospace;
	  font-size: 25px;
	}
	
	
	.middle {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  text-align: center;
	}
	
	hr {
	  margin: auto;
	  width:70%;
	}
	</style>
	<script type="text/javascript">
	
	
	function parse(str) {
	    var y = str.substr(0,4),
	        m = str.substr(5,2) - 1,
	        d = str.substr(8,2);
	    return new Date(y,m,d);
	}
	
	
	function helpmepls(){
		var countdownfunction=new Array(getElementsByClassName("eventTimer").length);
		for(var i=0;i<document.getElementsByClassName("eventTimer").length;i++){
			countdownfunction[i] = setInterval(
				function() {
					var countDownDate=parse(document.getElementsByClassName("event_endtime")[i].innerHTML);
					var now = new Date().getTime();
					var distance = countDownDate - now;
					var days = Math.floor(distance / (1000 * 60 * 60 * 24));
					var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
					var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
					var seconds = Math.floor((distance % (1000 * 60)) / 1000);
					document.getElementsByClassName("eventTimer")[i].innerHTML = days + "d " + hours + "h "
					+ minutes + "m " + seconds + "s ";
					if (distance < 0) {
						document.getElementsByClassName("eventTimer")[i].innerHTML = "종료된 이벤트";
					}
			}, 1000);
		}
	}
	</script>
</head>
<body>
<%@include file="../general_included/topbar.jsp"%>

<div class="eventdiv" onclick="helpmepls()">
	<div class="bgimg">
		<div class="middle">
			<h1>유기농 토마토 나눔</h1>
			<hr>
			<p class="eventTimer" style="font-size:30px"></p>
		</div>
		<div class="bottomleft">
			<p style="float:left">2019-10-29 ~&nbsp;</p><p style="float:left" class="event_endtime">2019-11-31</p>
		</div>
	</div>
</div><div class="eventdiv">
	<div class="bgimg">
		<div class="middle">
			<h1>유기농 토마토 나눔</h1>
			<hr>
			<p class="eventTimer" style="font-size:30px"></p>
		</div>
		<div class="bottomleft">
			<p style="float:left">2019-10-29 ~&nbsp;</p><p style="float:left" class="event_endtime">2019-11-05</p>
		</div>
	</div>
</div>

<%@include file="../general_included/footer.jsp"%>
</body>
</html>
