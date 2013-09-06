<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
boolean message = (Boolean)request.getAttribute("message");
String username=(String)request.getSession().getAttribute("username");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript">
  	var message =<%=message %>;
  	if(message==true){
  		alert("登录成功！");
  	}else{
  		alert("用户名或密码错误，请重新输入！");
  		window.location="login.jsp";
  	}
  </script>
  <body>
    <%=username %>,欢迎您登录！
    <table align="center">
		<tr>
		<jsp:include page="top.jsp"></jsp:include>
		</tr>
		</table>
  </body>
</html>
