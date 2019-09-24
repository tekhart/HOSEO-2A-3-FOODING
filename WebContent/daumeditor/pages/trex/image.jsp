<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Daum에디터 - 이미지 첨부</title> 
<script src="../../js/popup.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="jquery.form.js"></script>
<link rel="stylesheet" href="../../css/popup.css" type="text/css"  charset="utf-8"/>
<script type="text/javascript">
$(function(){
    $("#saveBtn").click(function(){
        $("#frm").submit();
    })
    //ajax form submit
    $('#frm').ajaxForm({
        beforeSubmit: function (data,form,option) {
	        if($("#image_file").val()==''){
	        	alert('파일을 선택하세요.');
	        	return false;
	        }
            return true;
        },
        success: function(response,status){
            //성공후 서버에서 받은 데이터 처리
            done(response);
        },
        error: function(){
            //에러발생을 위한 code페이지
            alert("error!!");
        }                              
    });
});
function done(response) {
    if (typeof(execAttach) == 'undefined') { //Virtual Function
        return;
    }
    
    var data=$.parseJSON(response);
    
    var _mocjdata={
    		'imageurl':data[0].full_url+data[0].upload_path+'/'+data[0].save_file_name,
    		'filename':data[0].real_file_name,
    		'imagealign':'L',
    		'original':'',
    		'thumburl':''
    };
    execAttach(_mockdata);
    
    var upload_path_object=opener.document.getElementById('upload_path');
    var upload_path_value='';
    var save_file_name_object=opener.document.getElementById('save_file_name');
    var save_file_name_value='';
    for(var i=0;i<data[0].file_count;i++){
    	if(upload_path_object !=null){
    		upload_path_value=upload_path_object.value;
    		save_file_name_value=save_file_name_object.value;
    		if(upload_path_value==''){
    			opener.document.getElementById('upload_path').value=data[i].upload_path;
    			opener.document.getElementById('save_file_name').value=data[i].save_file_name;
    		}else{
    			opener.document.getElementById('upload_path').value=upload_path_value+'.'+data[i].upload_path;
    			opener.document.getElementById('save_file_name').value=save_file_name_value+'.'+data[i].save_file_name;
    		}
    	}
    	else{
    		var form=opener.document.forms[0];
    		var input1='<input type="hidden" id="upload_path" value="'+data[i].upload_path+'"/>';
    		var input2='<input type="hidden" id="save_file_name" value="'+data[i].save_file_name+'"/>';
    		
    		$("form:first",opener.document).append(input1);
    		$("form:first",opener.document).append(input2);
    	}
    }
    
    closeWindow();
}

function changeValue(object){
	var value=$(object).val();
	if(value!=''){
		var ext=value.split('.').pop().toLowerCase();
		
		if($.inArray(ext,['gif','png','jpg','jpeg','bmp','tif'])==1){
			alert('gif,png,jpg,jpeg,bmp,tif 파일만 업로드 할 수 있습니다.');
			$(object).val();
			$("#image_name").val("");
			return;
		}
		var array=value.split("\\");
		var a=0;
		
		if(array.length>1){
			document.getElementById('image_name').value=array[array.length-1];
		}else{
			document.getElementById('image_name').value=value;
		}
	}
}
function initUploader(){
    var _opener = PopupUtil.getOpener();
    if (!_opener) {
        alert('잘못된 경로로 접근하셨습니다.');
        return;
    }
     
    var _attacher = getAttacher('image', _opener);
    registerAction(_attacher);
}


</script>
</head>
<body onload="initUploader();">
<div class="wrapper">
    <div class="header">
        <h1>사진 첨부</h1>
    </div>   
    <div class="body">
        <dl class="alert">
            <dt>사진 첨부 확인</dt>
            <dd>
            <form id="frm" action="fileupload.jsp" method="post">
                <input type="file" name="image_file"/>
            </form>
            </dd>
        </dl>
    </div>
    <div class="footer">
        <ul>
            <li class="submit"><a href="#" id="saveBtn" title="등록" class="btnlink">등록</a> </li>
            <li class="cancel"><a href="#" onclick="closeWindow();" title="취소" class="btnlink">취소</a></li>
        </ul>
    </div>
</div>


</body>
</html>