<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">
	   function show(){
	   		document.getElementById("message").style.visibility = "visible";
	   }	
	   function hidden(){
	   		document.getElementById("message").style.visibility = "hidden";
	   }
	   function show(){
	   		document.getElementById("message2").style.visibility = "visible";
	   }	
	   function hidden(){
	   		document.getElementById("message2").style.visibility = "hidden";
	   }
	</script>
	
	</head>
	<body>
	
	<a href="a.html" onmouseover="show()"  onmouseout="hidden()">sdfsdfsdf</a>
	<div id="message" style="visibility:hidden"><img src="image/dongdei.gif"/></div>
	<a href="#" onmouseover="show()"  onmouseout="hidden()">aaaaa</a>
	<div id="message2" style="visibility:hidden"><img src="logo.gif"/></div>	
  </body>
</html>
