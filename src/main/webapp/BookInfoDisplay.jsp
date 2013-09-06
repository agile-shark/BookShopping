<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书籍具体信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
<body>

<!--以下是购物车的代码-->
<table width="960" border="0" align="center">
  <tr align="center">
    <td colspan="2">
    	<jsp:include page="top.jsp"></jsp:include>
    </td>
  </tr>
  <tr valign="top">
    <td valign="top">
    	<jsp:include page="left.jsp"></jsp:include>
    </td>
    <td align="center" valign="top">
    	<jsp:include page="display.jsp"></jsp:include>
    </td>
  </tr>
  <tr align="center">
    <td colspan="2">
    	<jsp:include page="footer.jsp"></jsp:include>
    </td>
  </tr>
</table>
</body>
</html>