<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

OrderDAO odao = new OrderDAO();
//获得登录后的user信息
UserInfo user = (UserInfo)request.getSession().getAttribute("user");
ArrayList<BookOrder> al = odao.getOrderByUserId(user.getUserid()+"");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dingdan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.dingdan{
			font-size: 13px;
		}
	</style>

  </head>
  
  <body>
   <table width="742" border="3" align="center" cellpadding="0" cellspacing="0" bordercolor="#F1FAFF">
  	<tr>
    <td>
    <table width="730" border="0" align="center">
      <tr>
        <td  height="38px"><img src="image/mydingdan.png" width="726" height="28" /></td>
      </tr>
    </table></td>
 	</tr>
  <tr>
    <td>
    <table width="730" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DDDDDD">
      <tr class="dingdan">
        <td align="center" height="30px">订单号</td>
        <td align="center">下单时间</td>
        <td align="center">订单总金额</td>
        <td align="center">订单状态</td>
        <td align="center">操作</td>
      </tr>
      <%
      	for(int i = 0; i < al.size(); i++){
      		BookOrder bo = al.get(i);
      		%>
      		 <tr class="dingdan">
		        <td align="center" height="26px"><a href="chakandingdan.jsp?orderid=<%=bo.getOrderid() %>"><%=bo.getOrderid() %></a></td>
		        <td align="center"><%=bo.getOrderdate() %></td>
		        <td align="center">￥<%=bo.getTotalprice() %>元</td>
		        <td align="center">
		   		<%
		   			if(bo.getIsConfirmed() == 1) {
		   				if(bo.getIspayed() == 1){
		   					if(bo.getSendstatus() == 1){
		   						%>
		   						<font color="red"><b>已经发货，运送中</b></font>
		   						<%
		   					} else {
		   						%>
				   				<font color="red">已确认</font>&nbsp; <font color="red">已付款</font>&nbsp; 未发货
				   				<%
		   					}
		   				} else {
		   					%>
			   				<font color="red">已确认</font>&nbsp; 未付款&nbsp; 未发货
			   				<%
		   				}
		   			} else {
		   				%>
		   				未确认&nbsp; 未付款&nbsp; 未发货
		   				<%
		   			}
		   		%> 
		        <td align="center">
		        <%
		        	if(bo.getIsConfirmed() == 1) {
		        		%>
		        		 <a href="chakandingdan.jsp?orderid=<%=bo.getOrderid() %>">查看订单</a>
		        		<%
		        	} else {
		        		%>
		        		 <a href="PersonalDingDanCl?orderid=<%=bo.getOrderid() %>" onclick="return window.confirm('您确认要取消该订单吗？取消后此订单视为无效订单')">取消订单</a>
		        		<%
		        	}
		        %>
		        </td>
		      </tr>
      		<%
      	}
      %>
    </table></td>
  </tr>
  <tr class="dingdan">
    <td align="right"  height="36px"><font color="#006BD0"><b>总计 <%=odao.getNumOrderByUser(user.getUserid()+"") %> 个记录</b></font>&nbsp;&nbsp;</td>
  </tr>
</table>
</body>
</html>
