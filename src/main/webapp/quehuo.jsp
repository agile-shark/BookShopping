<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'quehuo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.ziti{
			font-size: 13px;
		}
	</style>

  </head>
  
  <body>
    <table width="744" border="3" align="left" bordercolor="#F1FAFF" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="736" border="0" align="center" cellpadding="0" cellspacing="0" class="ziti">
      <tr>
        <td align="center" valign="middle" height="40px"><img src="image/quehuo.png" width="728" height="30" /></td>
      </tr>
      <tr>
        <td>
        <table width="736" border="0" cellspacing="0" cellpadding="0" align="center" class="ziti">
          <tr align="center">
            <td>订购商品名</td>
            <td>订购数量</td>
            <td>登记时间</td>
            <td>处理备注</td>
            <td>操 作</td>
          </tr>
          
          
          <tr>
            <td colspan="5" align="center" height="18px"><img src="MyXian.png" width="727" height="5" /></td>
          </tr>
          <tr>
          	<td colspan="5" align="right" height="30px"><font color="#006BD0">总计 0 个记录</font> &nbsp;&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
