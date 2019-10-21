var emailexp=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
var nknameexp=/^[가-힣a-zA-Z][가-힣a-zA-Z0-9]+$/;
var idexp = /^[a-zA-Z][a-zA-Z0-9]+$/;  
var pwexp = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

function sendingaddr(addrnum,address){
	register.addrnum.value=addrnum;
	register.address.value=address;
	document.register.detailaddr.focus();
}
function AllcheckNotice(){
	Nknamecheck();
	Idcheck();
	Emailcheck();
	Passwdcheck();
	document.register.nkname.focus();
}

function Nknamecheck() {
	var checked=0;
	if (window.event.keyCode == 13) {
		Signupcross();
    }
	if(register.nkname.value.length<3||register.nkname.value.length>16){
		document.getElementById('nknamecheck').innerHTML = "문자로 시작하고 공백과 특수문자 없이 3-16자";
		document.getElementById('nknameimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
	}else{
		if(nknameexp.test(register.nkname.value)==true){
			i=0;
			while(i<=arraylength){
				if(DBnkArray[i]==register.nkname.value){
					checked=1;
					document.getElementById('nknameimg').innerHTML="<img src='../img/no2.png' height='30px' width='30px' align='middle'>"
					document.getElementById('nknamecheck').innerHTML="중복된 닉네임 입니다"
				}
				i++
			}
			if(checked==0){
				document.getElementById('nknameimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
				document.getElementById('nknamecheck').innerHTML="사용 가능한 닉네임 입니다";
			}
		}else{
			document.getElementById('nknamecheck').innerHTML = "문자로 시작하고 공백과 특수문자 없이 3자이상";
			document.getElementById('nknameimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
		}
		
	}
	if(register.nkname.value=='운영자바보'){
		document.getElementById('nknamecheck').innerHTML = "그런건 안대!";
		document.getElementById('nknameimg').innerHTML = "<img src='../img/angry.png' height='30px' width='30px' align='middle'>";
	}
	
	
};

function Idcheck() {
	var checked=0;
	if (window.event.keyCode == 13) {
		Signupcross();
    }
	if(register.id.value.length<8){
		document.getElementById('idcheck').innerHTML = "문자로 시작하고 공백과 특수문자 없이 8자이상";
		document.getElementById('idimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
	}else{
		if(idexp.test(register.id.value)==true){
			i=0;
			while(i<=arraylength){
				if(DBidArray[i]==register.id.value){
					checked=1;
					document.getElementById('idcheck').innerHTML="중복된 아이디 입니다"
						document.getElementById('idimg').innerHTML="<img src='../img/no2.png' height='30px' width='30px' align='middle'>"
				}
				i++
			}
			if(checked==0){
				document.getElementById('idcheck').innerHTML="사용 가능한 아이디 입니다";
				document.getElementById('idimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
			}
		}else{
			document.getElementById('idcheck').innerHTML="문자로 시작하고 공백과 특수문자 없이 8자이상";
			document.getElementById('idimg').innerHTML="<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
		}
	}
};
function Emailcheck() {
	var checked=0;
	if (window.event.keyCode == 13) {
		Signupcross();
    }
	if(emailexp.test(register.email.value)==""){
		document.getElementById('emailcheck').innerHTML = "이메일 형식으로 작성해 주십시오.";
		document.getElementById('emailimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
	}else if(emailexp.test(register.email.value)==false){
		document.getElementById('emailcheck').innerHTML = "이메일 형식이 맞지 않습니다";
		document.getElementById('emailimg').innerHTML = "<img src='../img/no2.png' height='30px' width='30px' align='middle'>";
	}else{
		i=0;
		while(i<=arraylength){
			if(DBemailArray[i]==register.email.value){
				checked=1;
				document.getElementById('emailcheck').innerHTML="중복된 이메일 입니다"
					document.getElementById('emailimg').innerHTML="<img src='../img/no2.png' height='30px' width='30px' align='middle'>"
			}
			i++
		}
		if(checked==0){
			document.getElementById('emailcheck').innerHTML="사용 가능한 이메일 입니다";
			document.getElementById('emailimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
		}
	}
};

function Passwdcheck() {
	if (window.event.keyCode == 13) {
		Signupcross();
    }
	if(pwexp.test(register.passwd.value)==false){
		document.getElementById('passwdcheck').innerHTML = "8자 이상, 영문/특수문자/숫자가 하나 이상";
		document.getElementById('passwdimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
	}else{
		document.getElementById('passwdcheck').innerHTML="사용 가능한 비밀번호 입니다";
		document.getElementById('passwdimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
	}
	Repasswdcheck();
};

function Repasswdcheck() {
	if (window.event.keyCode == 13) {
		Signupcross();
    }
	if(register.repasswd.value==""){
		document.getElementById('repasswdcheck').innerHTML="비밀번호와 같아야 합니다";
		document.getElementById('repasswdimg').innerHTML="<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
	}else if(register.passwd.value==register.repasswd.value){
		document.getElementById('repasswdcheck').innerHTML="비밀번호가 같습니다";
		document.getElementById('repasswdimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
	}else{
		document.getElementById('repasswdcheck').innerHTML="비밀번호가 다릅니다";
		document.getElementById('repasswdimg').innerHTML="<img src='../img/no2.png' height='30px' width='30px' align='middle'>";
		
	}
};

function ZipPopup() { 
	window.open("ZipFinder/ZipinputForm.jsp", "a", "width=400, height=300, left=100, top=50"); 
	document.register.detailaddr.focus();
}
	
function Signupcross(){	
	var register=document.register;

		if(register.nkname.value==""||document.getElementById('nknamecheck').innerHTML!="사용 가능한 닉네임 입니다"){
			alert("닉네임을 확인해주세요");
			register.nkname.focus();
			return;
		}
		if(register.id.value==""||document.getElementById('idcheck').innerHTML!="사용 가능한 아이디 입니다"){
			alert("아이디를 확인해주세요");
			register.id.focus();
			return;
		}
		if(register.passwd.value==""||document.getElementById('passwdcheck').innerHTML!="사용 가능한 비밀번호 입니다"){
			alert("비밀번호를 입력해주세요");
			register.passwd.focus();
			return;
		}
		if(register.repasswd.value==""){
			alert("비밀번호확인을 입력해주세요");
			register.repasswd.focus();
			return;
		}
		if(register.passwd.value!=register.repasswd.value){
			alert("비밀번호가 다릅니다.");
			register.repasswd.focus();
			return;
		}
		if(register.email.value==""){
			alert("이메일을 입력해주세요.");
			register.email.focus();
			return;
		}
		else if(emailexp.test(register.email.value)==false){
			alert("이메일 형식이 올바르지 않습니다.");
			register.email.focus();
			return;
		}
		if(register.addrnum.value==""){
			alert("우편번호를 입력해주세요");
			register.addrnum.focus();
			return;
		}
		if(register.detailaddr.value==""){
			alert("상세주소를 입력해주세요");
			register.detailaddr.focus();
			return;
		}

		register.submit();
	
	
}

function Signupclear(){
	var register=document.register;
	
	register.nkname.value="";
	register.id.value="";
	register.passwd.value="";
	register.repasswd.value="";
	register.email.value="";
	register.addrnum.value="";
	register.address.value="";
	register.detailaddr.value="";
}