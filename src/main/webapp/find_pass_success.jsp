<%@ page language="java" import="java.util.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserInfo user = (UserInfo)request.getSession().getAttribute("answer");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'find_pass_success.jsp' starting page</title>
    
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
	    <td align="center">
	    	<jsp:include page="top.jsp"></jsp:include>
	    </td>
	  </tr>
	  <tr>
	    <td align="center" height="0px"></td>
	  </tr>
	  <tr>
	    <td align="center">
	    	<table width="960" border="1" align="center" bordercolor="#C5E4FF">
  <tr>
    <td align="center"><img src="img/top_success.png" width="960" height="33" /></td>
  </tr>
  <tr>
    <td align="center"><table width="960" border="0">
      <tr>
        <td align="center" valign="middle" height="60px"><img src="img/haha.gif" width="40" height="40" /> 
        &nbsp;&nbsp;<font size="+2">查询到您的密码为：<font color="#990000"><%=user.getUserpass() %></font></font></td>
      </tr>
      <tr>
        <td align="center" valign="middle" height="40px"><font size="4">请您妥善保管好您的密码</font></td>
      </tr>
      <tr>
        <td align="center" valign="middle" height="40px"><font size="4">系统将在【5】秒内跳转到登录页面</font></td>
      </tr>
      <tr>
        <td align="center" valign="middle" height="80px"><img src="images/times.gif" width="100" height="70" /></td>
      </tr>
    </table>
    <% 
	response.setHeader("refresh","4.5;url='login.jsp?type=top'");
	%>
    </td>
  </tr>
</table>
	    </td>
	  </tr>
	  <tr>
	    <td align="center" height="20px"></td>
	  </tr>
	  <tr>
	    <td align="center">
	    	<jsp:include page="footer.jsp"></jsp:include>
	    </td>
	  </tr>
	</table>
	
</body>
</html>