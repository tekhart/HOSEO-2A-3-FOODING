<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBBean.foodingBean" %>
<%@ page import = "DBBean.BoardDataBean" %>
<%@ page import = "DBBean.commentDataBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.List" %>
<%!
    int commentpageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%		
			
		    
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="list.css">
<link rel="stylesheet" href="style.css?after">


<title>게시판</title>
<script>
function initComparisons() {
  var x, i;
  /*find all elements with an "overlay" class:*/
  x = document.getElementsByClassName("img-comp-overlay");
  for (i = 0; i < x.length; i++) {
    /*once for each "overlay" element:
    pass the "overlay" element as a parameter when executing the compareImages function:*/
    compareImages(x[i]);
  }
  function compareImages(img) {
    var slider, img, clicked = 0, w, h;
    /*get the width and height of the img element*/
    w = img.offsetWidth;
    h = img.offsetHeight;
    /*set the width of the img element to 50%:*/
    img.style.width = (w / 9-3) + "px";
    /*create slider:*/
    slider = document.createElement("DIV");
    slider.setAttribute("class", "img-comp-slider");
    slider.innerHTML="재&nbsp;&nbsp;&nbsp;&nbsp;도<br>료&nbsp;&nbsp;&nbsp;&nbsp;구";
    /*insert slider*/
    img.parentElement.insertBefore(slider, img);
    /*position the slider in the middle:*/
    slider.style.top = (h / 2) - (slider.offsetHeight / 2) + "px";
    slider.style.left = (w / 12) - (slider.offsetWidth / 12) + "px"; 
    /*execute a function when the mouse button is pressed:*/
    slider.addEventListener("mousedown", slideReady);
    /*and another function when the mouse button is released:*/
    window.addEventListener("mouseup", slideFinish);
    /*or touched (for touch screens:*/
    slider.addEventListener("touchstart", slideReady);
    /*and released (for touch screens:*/
    window.addEventListener("touchstop", slideFinish);
    function slideReady(e) {
      /*prevent any other actions that may occur when moving over the image:*/
      e.preventDefault();
      /*the slider is now clicked and ready to move:*/
      clicked = 1;
      /*execute a function when the slider is moved:*/
      window.addEventListener("mousemove", slideMove);
      window.addEventListener("touchmove", slideMove);
    }
    function slideFinish() {
      /*the slider is no longer clicked:*/
      clicked = 0;
    }
    function slideMove(e) {
      var pos;
      /*if the slider is no longer clicked, exit this function:*/
      if (clicked == 0) return false;
      /*get the cursor's x position:*/
      pos = getCursorPos(e)
      /*prevent the slider from being positioned outside the image:*/
      if (pos < 0) pos = 0;
      if (pos > w) pos = w;
      /*execute a function that will resize the overlay image according to the cursor:*/
      slide(pos);
    }
    function getCursorPos(e) {
      var a, x = 0;
      e = e || window.event;
      /*get the x positions of the image:*/
      a = img.getBoundingClientRect();
      /*calculate the cursor's x coordinate, relative to the image:*/
      x = e.pageX - a.left;
      /*consider any page scrolling:*/
      x = x - window.pageXOffset;
      return x;
    }
    function slide(x) {
      /*resize the image:*/
      img.style.width = x + "px";
      /*position the slider:*/
      slider.style.left = img.offsetWidth - (slider.offsetWidth / 2) + "px";
    }
  }
}
</script>
<script type="text/javascript">
	function AnsUpdDelComment(num,content,ref,re_step,
			re_level,counter,selected){
		 var form=document.iregularcommentform;
		 var commentchangeform = document.getElementsByClassName("commentchangeform");
		 
		 form.num.value=num;
		 form.ref.value=ref;
		 form.re_step.value=re_step;
		 form.re_level.value=re_level;
		 form.selected.value=selected;
		 
		 for (i = 0; i < commentchangeform.length; i++) {
			 commentchangeform[i].innerHTML="";
         }
		 commentchangeform[counter].innerHTML="<textarea name='content' size='40' rows='5' cols='40' class='signupinput' style='ime-mode:inactive;'></textarea><input type='submit'  value='답글쓰기' class='bt2'>";
	}
	
	
</script>
</head>

<body id="body">

<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv2">
<%
   try{
	   int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
	    foodingBean dbPro = foodingBean.getInstance();
     	BoardDataBean article =  dbPro.getArticle(num);
		
		foodingBean foodingbean = new foodingBean();

	 	String commnetpageNum = request.getParameter("commnetpageNum");

	    if (commnetpageNum == null) {
	    	commnetpageNum = "1";
	    }
	    int currentPage = Integer.parseInt(commnetpageNum);
	    int startRow = (currentPage - 1) * commentpageSize + 1;
	    int endRow = currentPage * commentpageSize;
	    int count = 0;
	    List<commentDataBean> commentList = null;
	    count = dbPro.getCommentArticleCount(num);
	    
	    if (count > 0) {
	        commentList = dbPro.getCommentsArticles(startRow, commentpageSize,num);
	    }
	    
%>

<table class="contenttable" > 
<tr><td  class="orangeline11" rowspan="2"width="1000px" height="100px" align="center" ><h2><%=article.getTitle()%></h2></td>
<td class="orangeline111"  align="right" style="color:#e0e0e0; font-size:30px;"><%=foodingbean.findnkname(article.getWriterid())%></td></tr>
<tr class="orangeline1"><td align="right" style="color:#e0e0e0; font-size:30px;"><%=article.getReadcount()%> view</td></tr>
<tr   class="orangeline"><td colspan="2"  height="600px" >
<table width="1150px" style="margin:auto; margin-top:15px; margin-bottom:15px; table-layout: fixed; word-wrap:break-word; border-collapse:collapse;">
<tr><td style="vertical-align:text-top;"><pre><%=article.getContent()%></pre></td></tr></table></td></tr>
<tr class="orangeline"><td>
 <%
    if(article.getWriterid().equals((String)session.getAttribute("idlogin"))){
        %>
        	<input type="button" value="글수정" 
           		onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
    	   		&nbsp;&nbsp;&nbsp;&nbsp;
    	  <input type="button" value="글삭제" 
           		onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">	
        <%
        }
        %>
        
        </td><td>일자</td></tr>
        
        <tr  class="orangeline"><td colspan="2" height="400px">

<div align="center" style="margin-bottom:15px;"></div>

<div class="img-comp-container">
  <div class="img-comp-img">
    <div class="divdiv1"><%=article.getIngredients() %></div>
  </div>
  <div class="img-comp-img img-comp-overlay">
   <div class="divdiv2"> <%=article.getTools() %></div>
  </div>
</div>

#<%=article.getContury()%> #<%=article.getFoodtype()%>
      

        
        
        </td></tr>

				</table>

	<br><br><br>
	<form  style="margin:auto;" method="post" name="commentform" 
					action="commentspro.jsp" >
			
		<table style="margin:auto;">	
			<tr><td>
			댓글 수 : <%=count%></td>
			<td class="content1" align="right">
				<input type="submit"  value="댓글쓰기" class="bt2">
			</td>
			</tr>
		</table>
		<%if(session.getAttribute("idlogin")==null){ %>
			로그인을 하셔야 댓글을 쓸수 있습니다.
		<%}else{ %>
		
		 <table width="1010px" style="margin:auto;">
			<input type="hidden" name="num" value="0">
			<input type="hidden" name="rootin" value="<%=num %>">
			<input type="hidden" name="pageNum" value="<%=pageNum %>">
			<input type="hidden" name="writerid" value="<%=idlogin %>">
			<input type="hidden" name="ref"  value="1">
			<input type="hidden" name="re_step"  value="0">
			<input type="hidden" name="re_level"  value="0">
			<input type="hidden" name="selected" value="0">
			
			<tr>
				<td colspan="3" width="0" style="margin:auto;">
					<textarea name="content" size="40" rows="5" cols="40" class="signupinput2"
							style="ime-mode:inactive;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3" width="150">
							
				</td>
			</tr>
			
		</table>
	<%} %>
	</form>

	<% if (count == 0) { %>
	
	 <table>
			<tr>
			    <td align="center">
			             댓글이 없습니다.
			    </td>
			</tr>
	</table>
	
	<% } else {%>
	
	<form method="post" name="iregularcommentform" 
			action="commentspro.jsp" >
		<input type="hidden" name="num" value="0">
		<input type="hidden" name="rootin" value="<%=num %>">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<input type="hidden" name="writerid" value="<%=idlogin %>">
		<input type="hidden" name="ref" value="1">
		<input type="hidden" name="re_step" value="0">
		<input type="hidden" name="re_level" value="0">
		<input type="hidden" name="selected" value="0">
	<%  
		for (int i = 0 ; i < commentList.size() ; i++) {
			commentDataBean comments = commentList.get(i);
	
		int wid=0; 
		if(comments.getRe_level()>0){
		   wid=30*(comments.getRe_level());
		}
	
	%>

	<table style="margin:auto;" class="commment">
		<tr>
		<td width=<%=wid %> align="right">
				<%if(comments.getRe_level()>0){%>
					ㄴ<br><br><br>
				<%} %>
		</td>
		<td>
		
		<table class="commentbase">
		
			<tr height="30">
				<td width="353"><%=foodingbean.findnkname(comments.getWriterid())%></td>
			    <td width="353"><%= sdf.format(comments.getReg_date())%></td>
			</tr>
			<tr height="70">
				<td colspan="2" width="600" >
					<p style="width:900px; word-break:break-all"><%=comments.getContent()%></p>
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2">
									<input type="button" value="답글" class="bt2" onclick=
							"AnsUpdDelComment('<%=comments.getNum()%>','<%=comments.getContent()%>',
							'<%=comments.getRef()%>','<%=comments.getRe_step()%>',
							'<%=comments.getRe_level()%>',<%= i %>,'tagged')">
						<%if(idlogin!=null){ %>
							<input type="button" value="변경" class="bt2" onclick=
								"AnsUpdDelComment('<%=comments.getNum()%>','<%=comments.getContent()%>',
								'<%=comments.getRef()%>','<%=comments.getRe_step()%>',
								'<%=comments.getRe_level()%>',<%= i %>,'changed')">
							<input type="button" value="삭제" class="bt2" onclick=
								"AnsUpdDelComment('<%=comments.getNum()%>','<%=comments.getContent()%>',
								'<%=comments.getRef()%>','<%=comments.getRe_step()%>',
								'<%=comments.getRe_level()%>',<%= i %>,'deleted')">
						<%} %>
						<div class="commentchangeform" id="testid"></div>
				</td>
			</tr>
			 <hr width="790" size="8px" color="white">
		 </table>
		 </td>
		 </tr>
		 </table>
	 

<%
				}
%>
	</form>
	
<%
			}
		}catch(Exception e){} 
 %>

 
</div>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
<pre>
Create by FOODING
고객문의 1544-XXXX
JSP Project 2019 2A03</pre>
</div>

<script>
/*Execute a function that will execute an image compare function for each element with the img-comp-overlay class:*/
initComparisons();
</script>

</body>
</html>