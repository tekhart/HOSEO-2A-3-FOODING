<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>이벤트</title>
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
.bgimg1 {
  background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('../img/herb.jpg');
  height: 100%;
  background-position: center;
  background-size: cover;
  position: relative;
  color: white;
  font-family: "Courier New", Courier, monospace;
  font-size: 25px;
}
.bgimg2 {
  background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('../img/jam2.jpg');
  height: 100%;
  background-position: center;
  background-size: cover;
  position: relative;
  color: white;
  font-family: "Courier New", Courier, monospace;
  font-size: 25px;
}
.bgimg3 {
  background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('../img/strawberry.jpg');
  height: 100%;
  background-position: center;
  background-size: cover;
  position: relative;
  color: white;
  font-family: "Courier New", Courier, monospace;
  font-size: 25px;
}
.bgimg4 {
  background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('../img/coffee.jpg');
  height: 100%;
  background-position: center;
  background-size: cover;
  position: relative;
  color: white;
  font-family: "Courier New", Courier, monospace;
  font-size: 25px;
}
.bgimg5 {
  background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('../img/icecream.jpg');
  height: 100%;
  background-position: center;
  background-size: cover;
  position: relative;
  color: white;
  font-family: "Courier New", Courier, monospace;
  font-size: 25px;
}
.bgimg6 {
  background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('../img/autumn.jpg');
  height: 100%;
  background-position: center;
  background-size: cover;
  position: relative;
  color: white;
  font-family: "Courier New", Courier, monospace;
  font-size: 25px;
}
.bgimg7 {
  background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('../img/matzip.jpg');
  height: 100%;
  background-position: center;
  background-size: cover;
  position: relative;
  color: white;
  font-family: "Courier New", Courier, monospace;
  font-size: 25px;
}
.bgimg8 {
  background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('../img/bread.jpg');
  height: 100%;
  background-position: center;
  background-size: cover;
  position: relative;
  color: white;
  font-family: "Courier New", Courier, monospace;
  font-size: 25px;
}
.bgimg9 {
  background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('../img/kebab.jpg');
  height: 100%;
  background-position: center;
  background-size: cover;
  position: relative;
  color: white;
  font-family: "Courier New", Courier, monospace;
  font-size: 25px;
}

.topleft {
  position: absolute;
  top: 0;
  left: 16px;
}

.bottomleft {
  position: absolute;
  bottom: 0;
  left: 16px;
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
<body>
<%@include file="../general_included/topbar.jsp"%>


<div class="eventdiv">
<div class="bgimg">
  <div class="middle">
    <h1>유기농 토마토 나눔</h1>
    <hr>
    <p id="demo" style="font-size:30px"></p>
  </div>
  <div class="bottomleft">
    <p>2019.10.29 ~ 2019.12.07</p>
  </div>
</div>
</div>

<div class="eventdiv">
<div class="bgimg1">
  <div class="middle">
    <h1>허브 지식 퀴즈</h1>
    <hr>
    <p id="demo1" style="font-size:30px"></p>
  </div>
  <div class="bottomleft">
    <p>2019.10.21 ~ 2019.12.12</p>
  </div>
</div>
</div>

<div class="eventdiv">
<div class="bgimg2">
  <div class="middle">
    <h1>잼 만들기 대회</h1>
    <hr>
    <p id="demo2" style="font-size:30px"></p>
  </div>
  <div class="bottomleft">
    <p>2019.08.31 ~ 2019.12.31</p>
  </div>
</div>
</div>

<div class="eventdiv">
<div class="bgimg3">
  <div class="middle">
    <h1>딸기로 할 수 있는<br>모든 것</h1>
    <hr>
    <p id="demo3" style="font-size:30px"></p>
  </div>
  <div class="bottomleft">
    <p>2019.10.01 ~ 2019.11.01</p>
  </div>
</div>
</div>

<div class="eventdiv">
<div class="bgimg4">
  <div class="middle">
    <h1>커피 전문가를 찾습니다</h1>
    <hr>
    <p id="demo4" style="font-size:30px"></p>
  </div>
  <div class="bottomleft">
    <p>2019.10.21 ~ 2019.12.07</p>
  </div>
</div>
</div>

<div class="eventdiv">
<div class="bgimg5">
  <div class="middle">
    <h1>여행지에 가서 먹은<br>특별한 디저트</h1>
    <hr>
    <p id="demo5" style="font-size:30px"></p>
  </div>
  <div class="bottomleft">
    <p>2019.09.20 ~ 2019.12.20</p>
  </div>
</div>
</div>

<div class="eventdiv">
<div class="bgimg6">
  <div class="middle">
    <h1>'가을' 하면 생각나는<br>음식은?</h1> 
    <hr>
    <p id="demo6" style="font-size:30px"></p>
  </div>
  <div class="bottomleft">
    <p>2019.08.01 ~ 2019.10.12</p>
  </div>
</div>
</div>

<div class="eventdiv">
<div class="bgimg7">
  <div class="middle">
    <h1>우리동네 맛집 소개</h1>
    <hr>
    <p id="demo7" style="font-size:30px"></p>
  </div>
  <div class="bottomleft">
    <p>2019.07.01 ~ 2019.08.31</p>
  </div>
</div>
</div>

<div class="eventdiv">
<div class="bgimg8">
  <div class="middle">
    <h1>가장 좋아하는 빵은?</h1>
    <hr>
    <p id="demo8" style="font-size:30px"></p>
  </div>
  <div class="bottomleft">
    <p>2019.09.21 ~ 2019.11.22</p>
  </div>
</div>
</div>

<div class="eventdiv">
<div class="bgimg9">
  <div class="middle">
    <h1>나만의 요리 스킬</h1>
    <hr>
    <p id="demo9" style="font-size:30px"></p>
  </div>
  <div class="bottomleft">
    <p>2019.09.01 ~ 2020.03.07</p>
  </div>
</div>
</div>



<script>
var countDownDate = new Date("dec 7, 2019 23:59:59").getTime();
	var countdownfunction = setInterval(function() {
	  var now = new Date().getTime();
	  var distance = countDownDate - now;
	  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	  document.getElementById("demo").innerHTML = days + "d " + hours + "h "
	  + minutes + "m " + seconds + "s ";
	  if (distance < 0) {
	    clearInterval(countdownfunction);
	    document.getElementById("demo").innerHTML = "종료된 이벤트";
	  }
	}, 1000);
	
	var countDownDate1 = new Date("dec 12, 2019 23:59:59").getTime();
	var countdownfunction1 = setInterval(function() {
	  var now1 = new Date().getTime();
	  var distance1 = countDownDate1 - now1;
	  var days1 = Math.floor(distance1 / (1000 * 60 * 60 * 24));
	  var hours1 = Math.floor((distance1 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes1 = Math.floor((distance1 % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds1 = Math.floor((distance1 % (1000 * 60)) / 1000);
	  document.getElementById("demo1").innerHTML = days1 + "d " + hours1 + "h "
	  + minutes1 + "m " + seconds1 + "s ";
	  if (distance1 < 0) {
	    clearInterval(countdownfunction1);
	    document.getElementById("demo1").innerHTML = "종료된 이벤트";
	  }
	}, 1000);
	
	var countDownDate2 = new Date("dec 31, 2019 23:59:59").getTime();
	var countdownfunction2 = setInterval(function() {
	  var now2 = new Date().getTime();
	  var distance2 = countDownDate2 - now2;
	  var days2 = Math.floor(distance2 / (1000 * 60 * 60 * 24));
	  var hours2 = Math.floor((distance2 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes2 = Math.floor((distance2 % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds2 = Math.floor((distance2 % (1000 * 60)) / 1000);
	  document.getElementById("demo2").innerHTML = days2 + "d " + hours2 + "h "
	  + minutes2 + "m " + seconds2 + "s ";
	  if (distance2 < 0) {
	    clearInterval(countdownfunction2);
	    document.getElementById("demo2").innerHTML = "종료된 이벤트";
	  }
	}, 1000);
	
	var countDownDate3 = new Date("dec 11, 2019 23:59:59").getTime();
	var countdownfunction3 = setInterval(function() {
	  var now3 = new Date().getTime();
	  var distance3 = countDownDate3 - now3;
	  var days3 = Math.floor(distance3 / (1000 * 60 * 60 * 24));
	  var hours3 = Math.floor((distance3 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes3 = Math.floor((distance3 % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds3 = Math.floor((distance3 % (1000 * 60)) / 1000);
	  document.getElementById("demo3").innerHTML = days3 + "d " + hours3 + "h "
	  + minutes3 + "m " + seconds3 + "s ";
	  if (distance3 < 0) {
	    clearInterval(countdownfunction3);
	    document.getElementById("demo3").innerHTML = "종료된 이벤트";
	  }
	}, 1000);
	
	var countDownDate4 = new Date("dec 7, 2019 23:59:59").getTime();
	var countdownfunction4 = setInterval(function() {
	  var now4 = new Date().getTime();
	  var distance4 = countDownDate4 - now4;
	  var days4 = Math.floor(distance4 / (1000 * 60 * 60 * 24));
	  var hours4 = Math.floor((distance4 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes4 = Math.floor((distance4 % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds4 = Math.floor((distance4 % (1000 * 60)) / 1000);
	  document.getElementById("demo4").innerHTML = days4 + "d " + hours4 + "h "
	  + minutes4 + "m " + seconds4 + "s ";
	  if (distance4 < 0) {
	    clearInterval(countdownfunction4);
	    document.getElementById("demo4").innerHTML = "종료된 이벤트";
	  }
	}, 1000); 

    var countDownDate5 = new Date("dec 20, 2019 23:59:59").getTime();
    var countdownfunction5 = setInterval(function() {
      var now5 = new Date().getTime();
      var distance5 = countDownDate5 - now5;
      var days5 = Math.floor(distance5 / (1000 * 60 * 60 * 24));
      var hours5 = Math.floor((distance5 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes5 = Math.floor((distance5 % (1000 * 60 * 60)) / (1000 * 60));
      var seconds5 = Math.floor((distance5 % (1000 * 60)) / 1000);
      document.getElementById("demo5").innerHTML = days5 + "d " + hours5 + "h "
      + minutes5 + "m " + seconds5 + "s ";
      if (distance5 < 0) {
        clearInterval(countdownfunction5);
        document.getElementById("demo5").innerHTML = "종료된 이벤트";
      }
    }, 1000);
	
	var countDownDate6 = new Date("oct 12, 2019 23:59:59").getTime();
	var countdownfunction6 = setInterval(function() {
	  var now6 = new Date().getTime();
	  var distance6 = countDownDate6 - now6;
	  var days6 = Math.floor(distance6 / (1000 * 60 * 60 * 24));
	  var hours6 = Math.floor((distance6 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes6 = Math.floor((distance6 % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds6 = Math.floor((distance6 % (1000 * 60)) / 1000);
	  document.getElementById("demo6").innerHTML = days6 + "d " + hours6 + "h "
	  + minutes6 + "m " + seconds6 + "s ";
	  if (distance6 < 0) {
	    clearInterval(countdownfunction6);
	    document.getElementById("demo6").innerHTML = "종료된 이벤트";
	  }
	}, 1000);
	
	var countDownDate7 = new Date("aug 31, 2019 23:59:59").getTime();
	var countdownfunction7 = setInterval(function() {
	  var now7 = new Date().getTime();
	  var distance7 = countDownDate7 - now7;
	  var days7 = Math.floor(distance7 / (1000 * 60 * 60 * 24));
	  var hours7 = Math.floor((distance7 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes7 = Math.floor((distance7 % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds7 = Math.floor((distance7 % (1000 * 60)) / 1000);
	  document.getElementById("demo7").innerHTML = days7 + "d " + hours7 + "h "
	  + minutes7 + "m " + seconds7 + "s ";
	  if (distance7 < 0) {
	    clearInterval(countdownfunction7);
	    document.getElementById("demo7").innerHTML = "종료된 이벤트";
	  }
	}, 1000);

    var countDownDate8 = new Date("nov 22, 2019 23:59:59").getTime();
    var countdownfunction8 = setInterval(function() {
      var now8 = new Date().getTime();
      var distance8 = countDownDate8 - now8;
      var days8 = Math.floor(distance8 / (1000 * 60 * 60 * 24));
      var hours8 = Math.floor((distance8 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes8 = Math.floor((distance8 % (1000 * 60 * 60)) / (1000 * 60));
      var seconds8 = Math.floor((distance8 % (1000 * 60)) / 1000);
      document.getElementById("demo8").innerHTML = days8 + "d " + hours8 + "h "
      + minutes8 + "m " + seconds8 + "s ";
      if (distance8 < 0) {
        clearInterval(countdownfunction8);
        document.getElementById("demo8").innerHTML = "종료된 이벤트";
      }
    }, 1000);
    
       var countDownDate9 = new Date("mar 7, 2020 23:59:59").getTime();
       var countdownfunction9 = setInterval(function() {
         var now9 = new Date().getTime();
         var distance9 = countDownDate9 - now9;
         var days9 = Math.floor(distance9 / (1000 * 60 * 60 * 24));
         var hours9 = Math.floor((distance9 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
         var minutes9 = Math.floor((distance9 % (1000 * 60 * 60)) / (1000 * 60));
         var seconds9 = Math.floor((distance9 % (1000 * 60)) / 1000);
         document.getElementById("demo9").innerHTML = days9 + "d " + hours9 + "h "
         + minutes9 + "m " + seconds9 + "s ";
         if (distance9 < 0) {
           clearInterval(countdownfunction9);
           document.getElementById("demo9").innerHTML = "종료된 이벤트";
         }
       }, 1000);


	
</script>

<%@include file="../general_included/footer.jsp"%>
</body>
</html>
