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


</style>

</head>
<body onload="javascript:window_onload()">
<div class="container">
  <div class="logo"><img src="../img/ok.png"></div>
<div class="shadow"></div>
</div>

<script>
function window_onload(){
    setTimeout('go_url()',5000)
}
    function go_url(){
    	location.href="../shop/main.jsp"    
    }
</script>
</body>
</html>