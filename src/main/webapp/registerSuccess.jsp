<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username = request.getParameter("username");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    <table width="960" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr align="center">
    <td>
    	<jsp:include page="top.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td align="center"><table width="960" border="1" cellpadding="0" cellspacing="0" bordercolor="#C5E4FF" bgcolor="#F2F9FF">
      <tr>
        <td><img src="images/regSuc.png" width="960" height="36" /></td>
      </tr>
      <tr>
        <td align="center">
        	<br/>
        <p><font color="red" size="4">恭喜您，用户名为：<%=username %> &nbsp;&nbsp;注册成功！</font></p>
          <p><img src="images/times.gif" width="100" height="70" /></p>
          <p><font color="red" size="3">系统将在5秒内，自动刷新跳转到首页面</font></p>
          <p><img src="images/Re_zhixiang.png" width="12" height="12" /><font size="2">
          <a href="index.jsp">查看我的个人信息</a></font></p>
          <br/><br/>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr align="center">
    <td>
    	<jsp:include page="footer.jsp"></jsp:include>
    </td>
  </tr>
</table>
	<% 
	response.setHeader("refresh","4.5;url=index.jsp");
	%>
  </body>
</html>
