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

<link rel="stylesheet" href="../css/list.css">



<link rel="stylesheet" href="list.css">
<link rel="stylesheet" href="style.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">

<style>





</style>
<title>게시판</title>


	<script type="text/javascript">
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
					if (clicked == 0){return false};
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
<body id="body" onload="initComparisons()">
<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv2">
<%
   try{
	   int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
	    foodingBean dbPro = foodingBean.getInstance();
     	BoardDataBean article =  dbPro.getcookhelpArticle(num);
		
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
	    count = dbPro.getcookhelpCommentArticleCount(num);
	    
	    if (count > 0) {
	        commentList = dbPro.getcookhelpCommentsArticles(startRow, commentpageSize,num);
	    }
	    
%> 

<table  class="contenttable" >   
	<tr>
		<td width="500px" rowspan="2" height="100px" align="center" class="orangeline11"
			style="text-align:center;"><%=article.getTitle()%></td>
		<td width="100px" class="orangeline111" style="text-align:right;
			color:#e0e0e0; font-size:20px;"><%=foodingbean.findnkname(article.getWriterid()) %></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:right;
			color:#e0e0e0; font-size:20px;"><%=article.getReadcount()%>view</td>
	</tr>

		<tr	class="orangeline">
						<td colspan="2"	height="600px" >
							<table width="1150px"
									style="margin:auto;
									margin-top:15px;
									margin-bottom:15px;
									table-layout: fixed;
									word-wrap:break-word;
									border-collapse:collapse;">
								<tr>
									<td style="vertical-align:text-top;">
										<pre><%=article.getContent()%></pre>
									</td>
								</tr>
							</table>
						</td>
						
	</tr>
    <tr class="orangeline">
		<td align="right" style="text-align:left;">
			 <input type="button" value="글수정" class="smallbt"
				  		onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제" class="smallbt"
				    		onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">	
		</td>
			<%
			    if(article.getWriterid().equals((String)session.getAttribute("idlogin"))){
	        %>
	        	
				
		    <%
		    	}
		    %>
		    <td align="right" style="text-align:left;">일자 <%= sdf.format(article.getReg_date())%>
		   
       		</td>
    </tr>
    <tr	class="orangeline">
						<td colspan="2" height="400px">
						
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
					</td>
				</tr>
	<tr><td></td><!-- <td colspan="2">목록</td></tr>  -->
	
</table>

	<!--    &nbsp;&nbsp;&nbsp;&nbsp;
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"> --> 
    </td>
  </tr>

</table>
	<br>
	<form method="post" name="commentform" action="commentspro.jsp">
	
		
			
		<table>	
			<tr>
				<td>
					
				</td>
				<td>
					
				</td>
			
			</tr>
		</table>
		<%if(session.getAttribute("idlogin")==null){ %>
			로그인을 하셔야 댓글을 쓸수 있습니다.
		<%}else{ %>
		
		
<%
			}
		}catch(Exception e){} 
 %>
</div>



<%@include file="../general_included/footer.jsp"%>

</body>
</html>