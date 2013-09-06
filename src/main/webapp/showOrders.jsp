<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(request.getSession().getAttribute("mycar")!=null){
	request.getSession().setAttribute("mycar", null);
}
if(request.getSession().getAttribute("books")!=null){
	request.getSession().setAttribute("books", null);
}
OrderDAO odao = new OrderDAO();
String orderId = "";
//从首页面得到orderid
String orderid = request.getParameter("orderid");
if(orderid != null) {
	orderId = orderid;
} else {
	orderId = odao.getNewOrderId();
}
ShowOrderDAO show = new ShowOrderDAO();
BookOrder bo = show.getBookOrderById(orderId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单提交成功页面</title>
    
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
    <td align="center" height="10px"></td>
  </tr>
  <tr>
    <td align="center">
    <table width="960" border="1" cellpadding="0" cellspacing="0" bordercolor="#C9E6FE" height="250px">
      <tr>
        <td align="center" bgcolor="#EDF7FF" height="50px">
        <font size="2px" color="#000000"><b>感谢您在本店购物!您的订单已提交成功，请记住您的订单号：</b></font>
        <font color="red" size="2px">
        <%
        	if(orderId != null) {
        		%>
        		<%=orderId %></font></td>
        		<%
        	} else {
        		%>
				您还没有下订单</font></td>        		
        		<%
        	}
        %>
        
      </tr>
      <tr>
        <td align="center"><p><font size="2px" color="#404040">您的配送方式为：<strong><%=bo.getSendmode() %></strong>，您选定的支付方式为：<strong><%=bo.getPaymode() %></strong>。您的应付款余额为：<strong>￥<%=bo.getTotalprice() %>元</strong></font>
          </p>
          <p>
          <font color="#404040" size="2px">银行名称
            收款人信息：全称 ××× ；帐号或地址 ××× ；开户行 ×××。
          注意事项：办理电汇时，请在电汇单"汇款用途"一栏处注明您的订单号。</font></p></td>
      </tr>
      <tr>
      	<td align="center" height="50px">
      		<br/>
      		<font color="#404040" size="2px">您可以<a href="index.jsp">返回首页</a> 或是 <a href="showOrders.jsp?orderid=<%=orderId %>" onclick="window.open('showOrderDetail.jsp?orderid=<%=orderId %>','orderDetail','width=704,height=700,top=0,left=10,scrollbars=1,toolbar=no,location=0,resizable=0,directories=0,status=0');">查看订单详细</a></font><br><br>
      		
      		<a href="fukuan.jsp"><img alt="支付宝" src="image/fast1.gif"></a><br/><br/>
      	</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" height="20px"></td>
  </tr>
  <tr>
    <td align="center">
    	<jsp:include page="xinshoushanglu.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td align="center">
    	<jsp:include page="footer.jsp"></jsp:include>
    </td>
  </tr>
</table>
  </body>
</html>
