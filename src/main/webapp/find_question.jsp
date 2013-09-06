<%@ page language="java" import="java.util.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//得到从servlet传过来的用户信息
UserInfo userinfo = (UserInfo)request.getSession().getAttribute("answer");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'find_quesetion.jsp' starting page</title>
    
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
<table width="920" border="20" align="center" cellpadding="0px" cellspacing="0px" bordercolor="#F2F2F2">
  <tr>
    <td>
    <form action="FindPassword?type=answer" method="post">
    <table width="920" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" height="50px">&nbsp;</td>
        </tr>
      <tr>
        <td colspan="2" align="center" height="30px"><font size="2"><b>请输入您注册时的用户名以取得您的密码提示问题</b></font>
         </td>
      </tr>
      <tr>
        <td width="353" align="right" valign="middle" height="20px"><font size="2">密码提示问题:</font></td>
        <td width="607" height="20px">
          <p>
            <font size="2"><%=userinfo.getPassquestion() %></font>
          </p>
          </td>
      </tr>
      <tr>
        <td width="353" align="right" valign="middle"><font size="2">密码提示答案:</font></td>
        <td width="607">
            <input type="text" name="answer" size="30" height="20" />
          </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;&nbsp;<br />
        <input type="image" src="style/find_tijiao.png" /> &nbsp;&nbsp;&nbsp;
        <a href="find_password.jsp"><img src="style/find_prepage.png" /></a>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="50px">&nbsp;</td>
        </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
</body>
</html>
