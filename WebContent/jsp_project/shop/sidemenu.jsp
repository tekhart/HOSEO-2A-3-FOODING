<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#mySidenav button {
  position: absolute;
  left: -80px;
  transition: 0.3s;
  padding: 15px;
  width: 100px;
  text-decoration: none;
  font-size: 20px;
  color: white;
  border-style:solid;
  border-radius: 0 5px 5px 0;
}

#mySidenav button:hover {
  left: 0;
}

#about{ 
  top: 20px;
  background-color: gray;
}

#blog {
  top: 80px;
  background-color: orange;
}

#projects{
  top: 140px;
  background-color: hotpink;
}


	

</style>
</head>
<body>

<div class="tab">
<div id="mySidenav" class="sidenav">
  <button id="about" class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">메뉴</button>
  <button id="blog" class="tablinks" onclick="openCity(event, 'Paris')">재료</button>
  <button id="projects" class="tablinks" onclick="openCity(event, 'Tokyo')">도구</button>

</div>


<div id="London" class="tabcontent">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">About</a>
  <a href="#">Services</a>
  <a href="#">Clients</a>
  <a href="#">Contact</a>
</div>

<div id="Paris" class="tabcontent">
  
  <p>Paris is the capital of France.</p> 
</div>

<div id="Tokyo" class="tabcontent">
  
  <p>Tokyo is the capital of Japan.</p>
</div>

   <script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
document.getElementById("defaultOpen").click();
</script>
</body>
</html> 
