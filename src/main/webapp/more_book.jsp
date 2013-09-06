<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书籍详细信息显示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css1/style.css" rel="stylesheet" type="text/css">

  </head>
  
  <body>
  <center>
    <table width="960" border="0" align="center">
	  <tr align="left">
	    <td colspan="2">
	    	<jsp:include page="top.jsp"></jsp:include>
	    </td>
	  </tr>
	  <tr>
	    <td align="left">
	    	<jsp:include page="left1.jsp"></jsp:include>
	    </td>
	    <td align="left" valign="top">
	    <jsp:include page="more.jsp"></jsp:include>
	    </td>
	  </tr>
	  <tr align="center">
	    <td colspan="2">
	    	<jsp:include page="footer.jsp"></jsp:include>
	    </td>
	  </tr>
</table>
</center>
  </body>
</html>
