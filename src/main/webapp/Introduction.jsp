<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Introduction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
    <table>
    	<tr>
    		<td width="150"  height="150"><font color="#404040" size="2">
    			为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想。
    			为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想。
    		</font></td>
    	</tr>
    </table>
  </body>
</html>
