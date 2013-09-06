<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookimage.jsp' starting page</title>
    
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
    <table width="1130" border="10" cellspacing="5" cellpadding="0" bordercolor="#BBDDE5">
  <tr bgcolor="#F4FAFB">
    <td height="36px"> &nbsp;&nbsp;<b>酷星书城管理中心</b> —— <font color="#9CACAF"><b>上传图书图片</b></font></td>
  </tr>
  <tr>
    <td>
    <table width="1126" border="1" cellpadding="0" cellspacing="0" bordercolor="#56A5EE">
      <tr>
        <td align="center"><p>&nbsp;</p>
         <form action="AdminUpload" method="post" enctype="multipart/form-data" >
          <p><input type="file" name="images"/></p>
          <input type="submit" value="上  传"/>
          <p>&nbsp;</p>
         </form>
        </td>
      </tr>
    </table></td>
  </tr>
  
</table>
  </body>
</html>
