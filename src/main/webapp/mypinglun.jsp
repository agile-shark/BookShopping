<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserInfo user = (UserInfo)request.getSession().getAttribute("user");
String userid = user.getUserid()+"";
EvaluationDAO evadao = new EvaluationDAO();
//得到指定用户的评论数
int num = evadao.getEvaluateNumByUserId(userid);
//将指定用户评论的列表得到
ArrayList<Evaluation> al = evadao.getEvaluationListByUserId(userid);

BookInfoDAO bdao = new BookInfoDAO();

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mypinglun.jsp' starting page</title>
    
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
    <table width="740" border="3" align="left" bordercolor="#F1FAFF" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="736" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" valign="middle" height="40px"><img src="image/MyEvaluation.png" width="728" height="30" /></td>
      </tr>
      <tr>
        <td>
        <table width="736" border="0" cellspacing="0" cellpadding="0" align="center" class="ziti">
        <%
        	for(int i = 0; i < al.size(); i++){
        		Evaluation eva = al.get(i);
        		%>
        		 <tr>
		            <td height="30px"> &nbsp;<b>商品评论</b>：<font color="red"><%=bdao.getBookInfo(eva.getBookid()).getBook_name() %></font> &nbsp;&nbsp;(2012-5-21) </td>
		            <td align="right"><a href="MyEvaluateCl?evaid=<%=eva.getEvaid() %>" onclick="return window.confirm('是否真的要删除此条评论?')">删 除</a> &nbsp;&nbsp;</td>
		          </tr>
		           <tr>
		            <td colspan="2"> &nbsp;<b>评论标题</b>：<%=eva.getEvatitle() %></td>
		          </tr>
		           <tr>
		            <td colspan="2"> &nbsp;<b>评论等级</b>：<img src="style/rank<%=eva.getEvarank() %>.png"/></td>
		          </tr>
		          <tr>
		            <td colspan="2"> &nbsp;<b>评论内容</b>：<%=eva.getEvacontent() %></td>
		          </tr>
		          <tr>
		            <td colspan="2" align="center" height="18px"><img src="image/MyXian.png" width="727" height="5" /></td>
		          </tr>
        		<%
        	}
        %>
         
          <tr>
          	<td colspan="2" align="right" height="30px"><font color="#006BD0">总计 <%=num %> 个记录</font> &nbsp;&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
