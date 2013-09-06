<%@ page language="java" import="java.util.*,com.shxt.admin.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//得到传过来的messageid
String messageid = request.getParameter("message_id");
//通过id来得到留言具体的信息
MessageListDAO messlist = new MessageListDAO();
Message message = messlist.getMessageById(messageid);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'answerMessage.jsp' starting page</title>
    
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
    <table width="1130" border="10" cellspacing="5" cellpadding="0" bordercolor="#BBDDE5">
  <tr bgcolor="#F4FAFB">
    <td height="36px"> &nbsp;&nbsp;<font size="4"><b>酷星书城管理中心</b></font> —— <font size="4" color="#9CACAF"><b>回复</b></font></td>
  </tr>
  <tr>
    <td>
    <table width="1120" border="0" align="center" cellpadding="0" cellspacing="0" class="ziti">
       <tr>
        <td width="215" align="right" height="30px"><b>留言类型：</b>&nbsp;&nbsp;</td>
        <td width="905"><%=message.getMessage_type() %></td>
      </tr>
      <tr>
        <td width="215" align="right" height="30px"><b>留言主题：</b>&nbsp;&nbsp;</td>
        <td width="905"><%=message.getMessage_title() %></td>
      </tr>
      <tr>
        <td align="right" height="30px"><b>留言内容：</b>&nbsp;&nbsp;</td>
        <td><%=message.getMessage_context() %></td>
      </tr>
      <tr>
        <td colspan="2" align="center"><img src="admin/img/liuyan.png" width="1080" height="13" /></td>
        </tr>
      <tr>
        <td colspan="2" align="right" height="36px">【用户中心】留言时间：<%=message.getMessage_date() %> 19:36:27&nbsp;&nbsp;&nbsp; </td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    <form action="GetMessageList?messageid=<%=message.getMessage_id() %>" method="post">
    <table width="1120" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      <td colspan="2" height="10px"></td>
      </tr>
      <tr class="ziti">
        <td width="218" align="right" valign="top"><b>回复内容：</b>&nbsp;&nbsp;</td>
        <td width="902"><textarea name="messagecontext" id="textarea" cols="50" rows="6"></textarea></td>
      </tr>
      <tr>
        <td height="36px">&nbsp;</td>
        <td>
        <input type="submit" name="button" id="button" value="提 交" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" name="button2" id="button2" value="重 置" />
          </td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
  </body>
</html>
