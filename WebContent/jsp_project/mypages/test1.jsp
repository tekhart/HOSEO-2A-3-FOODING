<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>


#menu {
    width: 100px;
    margin: 40px auto;
    background: #f3f3f3;
    border: 1px solid #d8d8d8;
    text-align: center;
}
#menu div {
    position: relative;
    display: inline-block;
}

span {
    display: block;
    width: 80px;
    padding: 2px 16px;
    cursor: pointer;
}
.arrow_box {
  display: none;
  position: absolute;
  width: 100px;
  padding: 8px;
  left: 0;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
  font-size: 14px;
}

.arrow_box:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}

span:hover + p.arrow_box {
  display: block;
}
}
</style>
</head>

<body>
<div id="menu">
  <div> <span>メニュー1</span>
    <p class="arrow_box">aaa</p>
  </div>
  <div> <span>メニュー2</span>
    <p class="arrow_box">ふきだし2</p>
  </div>
  <div> <span>メニュー3</span>
    <p class="arrow_box">ふきだし3</p>
  </div>
</div>
</body>
</html>