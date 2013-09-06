<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'footer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
	font-size: 12px;
	color: #404040;
}
body {
	background-color: #FFFFFF;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.txt4 {
	font-family: "宋体";
	font-size: 12px;
	line-height: 6px;
	padding-top: 6px;
	padding-left: 10px;
	color: #3366FF;
	padding-bottom: 0px;
	text-align: center;
}
.txt5 {
	padding-top: 0px;
	padding-left: 10px;
}
.footerbg {
	background-image: url(images/footerbg.jpg);
	background-repeat: repeat-x;
	background-position: left top;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: solid;
	border-left-color: #c6e4fe;
	border-bottom-width: 1px;
	border-bottom-color: #c6e4fe;
}
.footerbg1 {
	background-image: url(images/footerbg.jpg);
	background-repeat: repeat-x;
	background-position: left top;
	border-right-width: 1px;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: none;
	border-right-color: #c6e4fe;
	border-bottom-width: 1px;
	border-bottom-color: #c6e4fe;
}
.STYLE1 {font-family: "宋体"; font-size: 14px; color: #404040; font-weight: bold; }
.link1 {
	font-family: "宋体";
	font-size: 12px;
	text-decoration: none;
}
-->
</style>
  </head>
  
  <body>
<table width="960" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="880" height="60" align="left" valign="top"  class="footerbg"><p class="txt4"><a href="#" class="link1">免责条款</a> |<a href="#" class="link1"> 隐私保护</a> | <a href="#" class="link1">咨询热线</a> |<a href="#" class="link1"> 联系我们 </a>|<a href="#" class="link1"> 公司简介</a></p>
    <p class="txt4">Copyright&copy;2012 NSP Software.All Rights Reserved.版权所有：长春大学软件学院09417班梁永星</p></td>
    <td width="60" height="60" align="left" valign="middle"  class="footerbg1"><span class="txt4"><img src="images/bnt_top.gif" alt="top" width="38" height="11" class="footerbg1" /></span></td>
  </tr>
</table>

</body>
</html>
