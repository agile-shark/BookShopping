<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
AlertDAO alert = new AlertDAO();
List<AlertBean> li = alert.getContentList();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'right1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	<!--
	.bg {
		background-image: url(images/bg.jpg);
		background-repeat: no-repeat;
		background-position: left top;
		border: 1px solid #c5e4ff;
	}
	.txt1 {
		font-size: 12px;
		color: #3399FF;
		text-decoration: none;
		padding-left: 5px;
	}
	.bg2 {
		background-image: url(images/xu.jpg);
		background-repeat: no-repeat;
		background-position: left bottom;
	}
	.link1 {
		font-family: "宋体";
		font-size: 12px;
		color: #0099FF;
		text-decoration: none;
		padding-left: 10px;
		background-position: left top;
		padding-right: 0px;
		border-bottom-width: 0px;
		border-bottom-style: none;
		border-top-width: 0px;
		border-right-width: 0px;
		border-left-width: 0px;
		border-top-style: none;
		border-right-style: none;
		border-left-style: none;
	}
	body,td,th {
		font-family: 宋体;
	}
	.border1 {
		border-top-width: 0px;
		border-right-width: 0px;
		border-bottom-width: 1px;
		border-left-width: 0px;
		border-top-style: none;
		border-right-style: none;
		border-bottom-style: dashed;
		border-left-style: none;
		border-bottom-color: #999999;
		padding-right: 30px;
	}
	.padding {
		padding-right: 18px;
	}
	.padding2 {
		padding-right: 30px;
	}
	body {
		background-color: #FFFFFF;
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	a:link {
		text-decoration: none;
		color: blank;
	}
	a:visited {
		text-decoration: none;
		color: #0000CC;
	}
	a:hover {
		text-decoration: none;
		color: #FF3333;
	}
	a:active {
		text-decoration: none;
	}
	-->
	</style>

  </head>
  
  <body>
<table width="265" height="220" border="0" align="center" cellpadding="0" cellspacing="0" class="bg">
  <tr>
    <td align="center" valign="top"><table width="245" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="32" align="left" valign="middle"><img src="images/icon1.jpg" alt="站内快讯" width="149" height="16" /></td>
      </tr>
      <tr>
        <td height="180" align="left" valign="top" bgcolor="#FFFFFF"><table width="245" border="0" cellpadding="0" cellspacing="0" class="padding2">
          <tr>
            <td width="15" height="10">&nbsp;</td>
            <td width="230" class="link1">&nbsp;</td>
          </tr>
          <%
          	for(int i=0;i<6;i++){
          		AlertBean al = li.get(i);
          		%>
          		<tr>
	           <td width="8" height="24" align="right" valign="middle"><img src="images/icon2.jpg" alt="icon" width="3" height="5" /></td>
	            <td align="left" class="border1"><a href="AlertCl?id=<%=al.getContentID() %>" class="link1">[<%=al.getNewTitile() %>] <%=al.getConentTitle() %></a></td>
	          </tr>
          		<%
          	}
          %>
          
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
