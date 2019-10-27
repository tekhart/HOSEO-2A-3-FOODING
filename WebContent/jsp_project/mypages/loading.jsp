<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
@import url('https://fonts.googleapis.com/css?family=Raleway:200');

body{
  font-family: 'Raleway', sans-serif;
}

.shadow{
  width:60px;
  height:4px;
  background-color:rgba(0,0,0,.1);
  border-radius:3px;
  animation:shadow 5s ease-in-out infinite;
  margin:auto;
  position:absolute;
  bottom:-4px;
  left:0;
  right:0;
  
}

@keyframes shadow{
  0%{
    width:60px;
  }
  10%{
    width:10px;
  }
  20%{
    width:60px;
  }
  30%{
    width:10px;
  }
  40%{
    width:60px;
  }
  50%{
    width:10px;
  }
  60%{
    width:60px;
  }
  70%{
    width:10px;
  }
  92%{
    width:10px;
  }
  100%{
    width:60px;
  }
}


.logo{
  position:absolute;
  bottom:0;
  text-algin:center;
  color:#ffbb00;
  font-size:25px;
  margin-left:-25px;
  opacity:0;
  animation: logo 5s ease-in-out infinite;
}

@keyframes logo{
  0%{
    transform:translateY(0);opacity:0;
  }
  59%{
    transform:translateY(0);opacity:0;
  }
  60%{
    opacity:1;
  }
  70%{
    transform:translateY(-95px);
  }
  92%{
    transform:translateY(-95px);
  }
  100%{
    transform:translateY(0);opacity:1;
  }
}

.container{
  width:60px;
  height:250px;
  position:Relative;
  margin: auto;
  position: absolute;
  top: 50%; left: 50%;
  -webkit-transform: translate(-50%,-50%);
      -ms-transform: translate(-50%,-50%);
          transform: translate(-50%,-50%);
}

.circle{
  width:55px;
  height:55px;
  border:2px solid #2ecc71;
  background-color:#FFFFFF;
  border-radius:50%;
  position:absolute;
  bottom:0;
  animation: circle 5s ease-in-out infinite;
}

@keyframes circle{
  0%{
    transform:translateY(0);
  }
  10%{
    transform:translateY(-190px);
  }
  20%{
    transform:translateY(0) scaleY(1.2);opacity:1;
  }
  20.1%{
    opacity:0;
  }
  100%{opacity:0;}
}

.square{
  width:55px;
  height:55px;
  border:2px solid #f1c40f;
  background-color:#FFFFFF;
  position:absolute;
  bottom:0;
  opacity:0;
  animation: square 5s ease-in-out infinite;
}

@keyframes square{
  0%{
    transform:translateY(0);opacity:0;
  }
  19%{
    transform:translateY(0);opacity:0;
  }
  20%{
    opacity:1;
  }
  30%{
    transform:translateY(-190px) rotate(90deg);
  }
  40%{
    transform:translateY(0) rotate(180deg);opacity:1;
  }
  40.1%{
    transform:translateY(0);opacity:0;
  }
  100%{opacity:0;}
}

.triangle{
  width:0;
  height:0;
  border-left:30px solid transparent;
  border-right:30px solid transparent;
  border-bottom:50px solid #9b59b6;
  position:absolute;
  bottom:0;
  animation: triangle 5s ease-in-out infinite;
  opacity:0;
}

.triangle::after{
  content:"";
  width:0;
  height:0;
  border-left:26px solid transparent;
  border-right:26px solid transparent;
  border-bottom:44px solid white;
  position:absolute;
  bottom:-48px;
  left:-26px;
}


@keyframes triangle{
  0%{
    transform:translateY(0);opacity:0;
  }
  39%{
    transform:translateY(0);opacity:0;
  }
  40%{
    opacity:1;
  }
  50%{
    transform:translateY(-190px) rotate(60deg);
  }
  60%{
    transform:translateY(0) rotate(120deg);opacity:1;
  }
  60.1%{
    transform:translateY(0);opacity:0;
  }
  100%{opacity:0;}
}
</style>

</head>
<body onload="javascript:window_onload()">
<div class="container">
  <div class="circle"></div>
  <div class="square"></div>
  <div class="triangle"></div>
  <div class="logo">FOODING</div>
<div class="shadow"></div>
</div>

<script>
function window_onload(){

    setTimeout('go_url()',5000)

}
    function go_url(){
    	  alert("문의가 전송되었습니다")
    location.href="../mains/main.jsp"
    }
</script>
</body>
</html>
