<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'friend.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">  
a {   
    color: #000;   
    font-size: 12px;   
    text-decoration: none   
}   
  
a:hover {   
    color: #900;   
    text-decoration: underline   
}   
  
</style> 
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 1px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #4AA3D8;
}
html { overflow-x: ; overflow-y: ; border:0;} 
-->
</style>
<script language="javascript">  
<!--   
  var xmlhttp;
			var flag=false;
			function createXmlHttpRequest() {
				if (window.XMLHttpRequest) {// code for all new browsers
					xmlhttp = new XMLHttpRequest();
				} else if (window.ActiveXObject) {//code for IE5 and IE6
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				return xmlhttp;
			}
			
 window.onerror = function(){}    
 //短信提示使用(asilas添加)    
 var divTop,divLeft,divWidth,divHeight,docHeight,docWidth,objTimer,i = 0;    
    
 function getMsg()    
 {    
    try{   
        divTop = parseInt(document.getElementById("eMeng").style.top,10);    
        divLeft = parseInt(document.getElementById("eMeng").style.left,10);    
        divHeight = parseInt(document.getElementById("eMeng").offsetHeight,10);    
        divWidth = parseInt(document.getElementById("eMeng").offsetWidth,10);    
        docWidth = document.body.clientWidth;    
        docHeight = document.body.clientHeight;    
        document.getElementById("eMeng").style.top = parseInt(document.body.scrollTop,10) + docHeight + 10;// divHeight    
        document.getElementById("eMeng").style.left = parseInt(document.body.scrollLeft,10) + docWidth - divWidth;    
        document.getElementById("eMeng").style.visibility="visible";    
        objTimer = window.setInterval("moveDiv()",10);    
    }    
    catch(e){}    
 }    
    
 function resizeDiv()    
 {    
    //i+=1;   
    //if(i>5000) closeDiv();    
    try{    
        divHeight = parseInt(document.getElementById("eMeng").offsetHeight,10);    
        divWidth = parseInt(document.getElementById("eMeng").offsetWidth,10);    
        docWidth = document.body.clientWidth;    
        docHeight = document.body.clientHeight;    
        document.getElementById("eMeng").style.top = docHeight - divHeight + parseInt(document.body.scrollTop,10);   
        document.getElementById("eMeng").style.left = docWidth - divWidth + parseInt(document.body.scrollLeft,10);   
    }    
    catch(e){}    
 }    
    
 function moveDiv()    
 {   
    try{    
        if(parseInt(document.getElementById("eMeng").style.top,10) <= (docHeight - divHeight + parseInt(document.body.scrollTop,10))){    
            window.clearInterval(objTimer);    
            objTimer = window.setInterval("resizeDiv()",1);   
        }    
        divTop = parseInt(document.getElementById("eMeng").style.top,10);   
        document.getElementById("eMeng").style.top = divTop - 1;   
    }    
    catch(e){}    
 }    
     
 function closeDiv()    
 {    
    document.getElementById('eMeng').style.visibility='hidden';   
    if(objTimer) window.clearInterval(objTimer);   
 }    
  function getDD(){
    	createXmlHttpRequest();
		xmlhttp.onreadystatechange=onready;
		xmlhttp.open("post","searchDDnum",true);
		xmlhttp.send(null);
  }
  function onready(){
				if(xmlhttp.readyState==4){
					if(xmlhttp.status==200){
						var number=xmlhttp.responseText;
						alert(number);
		                 if(number>0){
		                   document.getElementById("tipMsg").innerHTML="<EMBED NAME='CS1130222724267' SRC='music.wav' LOOP=false AUTOSTART=true MASTERSOUND HIDDEN=true WIDTH=0 HEIGHT=0></EMBED>";   
                           document.getElementById("btCommand").innerHTML="您有<font color='red'>"+number+"</font>条新的订单待发货<BR><BR><a href='searchDD' target='I2' onclick='closeDiv();'><font color=#FF0000>点击查看</font></a>";   
                           closeDiv();   
                           getMsg(); 
                           parseResults(); 
		                 }
					}
				}
			}
			
//-->      
</script>  
  </head>
  
  <body onload="getDD()">
        <span><img src="<%=path %>/images/welcome.gif" width="768" height="536" /></span>  
         <DIV id=eMeng style="BORDER-RIGHT: #455690 1px solid; BORDER-TOP: #a6b4cf 1px solid; Z-INDEX:99999; LEFT: 0px; VISIBILITY: hidden; BORDER-LEFT: #a6b4cf 1px solid; WIDTH: 180px; BORDER-BOTTOM: #455690 1px solid; POSITION: absolute; TOP: 0px; HEIGHT: 116px; BACKGROUND-COLOR: #c9d3f3">    
        <TABLE style="BORDER-TOP: #ffffff 1px solid; BORDER-LEFT: #ffffff 1px solid" cellSpacing=0 cellPadding=0 width="100%" bgColor=#cfdef4 border=0>    
            <TBODY>    
                <TR>    
                    <TD style="FONT-SIZE: 12px; BACKGROUND-IMAGE: url(images/msgTopBg.gif); COLOR: #0f2c8c" width=30 height=24 valign='middle'>  
                        <img src='<%=path %>/UploadImages/gif-0193.gif' hspace='5' vspace='1'/>  
                    </TD>    
                    <TD style="FONT-WEIGHT: bold; FONT-SIZE: 12px; BACKGROUND-IMAGE: url(images/msgTopBg.gif); COLOR: #1f336b; PADDING-TOP: 4px;PADDING-left: 4px" vAlign=middle width="100%"> 消息提醒</TD>    
                    <TD style="BACKGROUND-IMAGE: url(images/msgBottomBg.jpg); PADDING-TOP: 2px;PADDING-right:2px" vAlign=middle align=right width=19><IMG title=关闭 style="CURSOR: hand" onclick=closeDiv() hspace=3 src="<%=path %>/UploadImages/gif-0130.gif" id="btSysClose"></TD>    
                </TR>    
                <TR>    
                    <TD style="PADDING-RIGHT: 1px; BACKGROUND-IMAGE: url(images/msgBottomBg.jpg);BACKGROUND-REPEAT:repeat-y;PADDING-BOTTOM: 1px" colSpan=3 height=90>    
                        <DIV style="BORDER-RIGHT: #b9c9ef 1px solid; PADDING-RIGHT: 13px; BORDER-TOP: #728eb8 1px solid; PADDING-LEFT: 13px; FONT-SIZE: 12px; PADDING-BOTTOM: 13px; BORDER-LEFT: #728eb8 1px solid; WIDTH: 100%; COLOR: #1f336b; PADDING-TOP: 18px; BORDER-BOTTOM: #b9c9ef 1px solid; HEIGHT: 100%"><span id="tipMsg"></span>    
                            <DIV align=center style="word-break:break-all" id="btCommand"></DIV >  
                        </DIV>    
                    </TD>    
                </TR> 
                <tr><td><input type="hidden" id="ba"/></td></tr>   
            </TBODY>    
        </TABLE>    
    </DIV>
 
  </body>
</html>
