<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'evaluationMain.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<table width="960" border="0" align="center">
  <tr>
    <td colspan="2" align="center">
    	<jsp:include page="top.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td align="center" valign="top">
    	<jsp:include page="left.jsp"></jsp:include>
    </td>
    <td width="750" align="center" valign="top">
    	<jsp:include page="evaluation.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
    	<jsp:include page="footer.jsp"></jsp:include>
    </td>
  </tr>
</table>
</body>
</html>