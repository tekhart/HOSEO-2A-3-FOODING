<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">

<meta charset="UTF-8">

<title>맞춤 레시피</title>


<style>


.customcheck{

	
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
	display: none;


}



.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

</style>


</head>
<body id="body">
	<%@include file="../jsp_project/general_included/topbar.jsp"%>
	
	<div id="maindiv">
	<div class="writetitle1">맞춤 레시피</div>

<br>
<br><br>


	<table border="1" class="customtb" >
	<tr><td class="customfirst">상황별 요리</td>
	<td class="customfirst">나라별 요리</td>
	<td class="customfirst">재료별 요리</td>
	<td class="customfirst">조리법별 요리</td>
	<td class="customfirst">도구별 요리</td></tr>
	<tr><td class="customsecond">
		<label id="customcheck"><input type="checkbox" id="customcheck" value="간식">간식<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="야식">야식<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="안주">안주<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="해장">해장<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="접대">접대<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="나들이">나들이<br></label>
						<label class="container">Three
						<input type="checkbox">
						<span class="checkmark"></span>
						</label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="파티">파티<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="명절">명절<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="실생활">실생활<br></label>
</td><td class="customsecond">
		<label id="customcheck"><input type="checkbox" id="customcheck" value="한식">한식<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="중식">중식<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="일식">일식<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="동남아/인도">동남아/인도<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="멕시칸">멕시칸<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="양식">양식<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="퓨전">퓨전<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="이국적인">이국적인<br></label>
</td><td class="customsecond">
		<label id="customcheck"><input type="checkbox" id="customcheck" value="육류">육류<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="채소류">채소류<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="해산물">해산물<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="콩/두부">콩/두부<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="과일">과일<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="달걀/유제퓸">달걀/유제퓸<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="만두">만두<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="밀가루">밀가루<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="김치">김치<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="가공식품">가공식품<br></label>
</td><td class="customsecond">
		<label id="customcheck"><input type="checkbox" id="customcheck" value="밥">밥<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="면">면<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="국물">국물<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="찜/조리/구이">찜/조리/구이<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="볶음/튀김/부침">볶음/튀김/부침<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="나물/샐러드">나물/샐러드<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="김장/절임">김장/절임<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="베이킹/디저트">베이킹/디저트<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="양념/소스/잼">양념/소스/잼<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="음료/차/커피">음료/차/커피<br></label>
</td><td class="customsecond">
		<label id="customcheck"><input type="checkbox" id="customcheck" value="칼">칼<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="믹서기">믹서기<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="가스레인지">가스레인지<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="냄비">냄비<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="오븐">오븐<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="전자레인지">전자레인지<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="냉장고">냉장고<br></label>
		<label id="customcheck"><input type="checkbox" id="customcheck" value="타이머">타이머<br></label>
</td></tr>


<tr><td colspan="4" >
<ul id="myUL">
  
</ul></td><td><input type="submit" value="검색"></td></tr>


<tr><td colspan="5">

<table style="width:465px; margin:auto;"><tr>
	<td>  
		<input type="text" name="myCountry" placeholder="검색..." class="searchbar" id="myInput">
	</td>
								
		<td class="addBtn">
			<div > 
  				<span onclick="newElement()">추가</span>
			</div>
		</td></tr>

</table>

 

</td></tr>
</table>

<script>

//Create a "close" button and append it to each list item
var myNodelist = document.getElementsByTagName("text");
var i;
for (i = 0; i < myNodelist.length; i++) {
var span = document.createElement("SPAN");
var txt = document.createTextNode("\u00D7");
span.className = "close";
span.appendChild(txt);
myNodelist[i].appendChild(span);
}

//Click on a close button to hide the current list item
var close = document.getElementsByClassName("close");
var i;
for (i = 0; i < close.length; i++) {
close[i].onclick = function() {
  var div = this.parentElement;
  div.style.display = "none";
}
}

//Create a new list item when clicking on the "Add" button
function newElement() {
var li = document.createElement("div");
var inputValue = document.getElementById("myInput").value;
var t = document.createTextNode(inputValue);
li.appendChild(t);
if (inputValue === '') {
  alert("You must write something!");
} else {
  document.getElementById("myUL").appendChild(li);
}
document.getElementById("myInput").value = "";

var span = document.createElement("SPAN");
var txt = document.createTextNode("\u00D7");
span.className = "close";
span.appendChild(txt);
li.appendChild(span);

for (i = 0; i < close.length; i++) {
  close[i].onclick = function() {
    var div = this.parentElement;
    div.style.display = "none";
  }
}
}




function autocomplete(inp, arr) {
	  /*the autocomplete function takes two arguments,
	  the text field element and an array of possible autocompleted values:*/
	  var currentFocus;
	  /*execute a function when someone writes in the text field:*/
	  inp.addEventListener("input", function(e) {
	      var a, b, i, val = this.value;
	      /*close any already open lists of autocompleted values*/
	      closeAllLists();
	      if (!val) { return false;}
	      currentFocus = -1;
	      /*create a DIV element that will contain the items (values):*/
	      a = document.createElement("DIV");
	      a.setAttribute("id", this.id + "autocomplete-list");
	      a.setAttribute("class", "autocomplete-items");
	      /*append the DIV element as a child of the autocomplete container:*/
	      this.parentNode.appendChild(a);
	      /*for each item in the array...*/
	      for (i = 0; i < arr.length; i++) {
	        /*check if the item starts with the same letters as the text field value:*/
	        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
	          /*create a DIV element for each matching element:*/
	          b = document.createElement("DIV");
	          /*make the matching letters bold:*/
	          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
	          b.innerHTML += arr[i].substr(val.length);
	          /*insert a input field that will hold the current array item's value:*/
	          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
	          /*execute a function when someone clicks on the item value (DIV element):*/
	          b.addEventListener("click", function(e) {
	              /*insert the value for the autocomplete text field:*/
	              inp.value = this.getElementsByTagName("input")[0].value;
	              /*close the list of autocompleted values,
	              (or any other open lists of autocompleted values:*/
	              closeAllLists();
	          });
	          a.appendChild(b);
	        }
	      }
	  });
	  /*execute a function presses a key on the keyboard:*/
	  inp.addEventListener("keydown", function(e) {
	      var x = document.getElementById(this.id + "autocomplete-list");
	      if (x) x = x.getElementsByTagName("div");
	      if (e.keyCode == 40) {
	        /*If the arrow DOWN key is pressed,
	        increase the currentFocus variable:*/
	        currentFocus++;
	        /*and and make the current item more visible:*/
	        addActive(x);
	      } else if (e.keyCode == 38) { //up
	        /*If the arrow UP key is pressed,
	        decrease the currentFocus variable:*/
	        currentFocus--;
	        /*and and make the current item more visible:*/
	        addActive(x);
	      } else if (e.keyCode == 13) {
	        /*If the ENTER key is pressed, prevent the form from being submitted,*/
	        e.preventDefault();
	        if (currentFocus > -1) {
	          /*and simulate a click on the "active" item:*/
	          if (x) x[currentFocus].click();
	        }
	      }
	  });
	  function addActive(x) {
	    /*a function to classify an item as "active":*/
	    if (!x) return false;
	    /*start by removing the "active" class on all items:*/
	    removeActive(x);
	    if (currentFocus >= x.length) currentFocus = 0;
	    if (currentFocus < 0) currentFocus = (x.length - 1);
	    /*add class "autocomplete-active":*/
	    x[currentFocus].classList.add("autocomplete-active");
	  }
	  function removeActive(x) {
	    /*a function to remove the "active" class from all autocomplete items:*/
	    for (var i = 0; i < x.length; i++) {
	      x[i].classList.remove("autocomplete-active");
	    }
	  }
	  function closeAllLists(elmnt) {
	    /*close all autocomplete lists in the document,
	    except the one passed as an argument:*/
	    var x = document.getElementsByClassName("autocomplete-items");
	    for (var i = 0; i < x.length; i++) {
	      if (elmnt != x[i] && elmnt != inp) {
	        x[i].parentNode.removeChild(x[i]);
	      }
	    }
	  }
	  /*execute a function when someone clicks in the document:*/
	  document.addEventListener("click", function (e) {
	      closeAllLists(e.target);
	  });
	}

	/*An array containing all the country names in the world:*/
	var countries = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua & Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia & Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central Arfrican Republic","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cuba","Curacao","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauro","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","North Korea","Norway","Oman","Pakistan","Palau","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre & Miquelon","Samoa","San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Korea","South Sudan","Spain","Sri Lanka","St Kitts & Nevis","St Lucia","St Vincent","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Turks & Caicos","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States of America","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];

	/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
	autocomplete(document.getElementById("myInput"), countries);
</script>

</body>
</html>
