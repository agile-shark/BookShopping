<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//得到订单的id号 
String orderId = request.getParameter("orderid");

ShowOrderDAO show = new ShowOrderDAO();
UserDAO user = new UserDAO();
BookOrder bo = show.getBookOrderById(orderId);
ArrayList<BookCar> al = show.getBookCar(orderId);

UserInfo bi = (UserInfo)request.getSession().getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单详细列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
	font-size: 12px;
	color: #333333;
}
body {
	background-color: #FFFFFF;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.tableborder {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 4px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #c9e4eb;
	border-right-color: #c9e4eb;
	border-bottom-color: #c9e4eb;
	border-left-color: #c9e4eb;
}
.txt1 {
	font-family: "宋体";
	font-size: 12px;
	font-weight: bold;
	color: #192e32;
	border: 1px solid #bbdde5;
}
.txt2 {
	font-family: "宋体";
	font-size: 12px;
	color: #192e32;
	border: 1px solid #c9e4eb;
	padding-left: 5px;
}
.btnbg {
	background-image: url(img/btnbg.jpg);
	background-repeat: no-repeat;
	height: 19px;
	width: 78px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
}
-->
</style>
</head>

<body>
<table width="742" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="200" align="center" valign="top"><table width="730" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder">
      <tr>
        <td height="30" colspan="4" align="center" bgcolor="#c9e4eb">基本信息</td>
      </tr>
      <tr>
        <td width="100" height="30" align="right" valign="middle" class="txt1">订单号：</td>
        <td width="320" align="left" valign="middle" class="txt2"><%=orderId %></td>
        <td width="100" align="right" valign="middle" class="txt1">订单状态：</td>
        <td width="180" align="left" valign="middle" class="txt2">未确认，未支付，未发货</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle" class="txt1">购货人：</td>
        <td align="left" valign="middle" class="txt2"><%=bi.getUsername() %></td>
        <td align="right" valign="middle" class="txt1">下单时间：</td>
        <td align="left" valign="middle" class="txt2"><%=bo.getOrderdate() %></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle" class="txt1">支付方式：</td>
        <td align="left" valign="middle" class="txt2"><%=bo.getSendmode() %> （备注：N/A） </td>
        <td align="right" valign="middle" class="txt1">付款时间：</td>
        <td align="left" valign="middle" class="txt2">未付款</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle" class="txt1">配送方式：</td>
        <td align="left" valign="middle" class="txt2"><%=bo.getPaymode() %>
          <input name="Submit" type="submit" class="btnbg" value="打印快递单" /></td>
        <td align="right" valign="middle" class="txt1">发货时间：</td>
        <td align="left" valign="middle" class="txt2">未发货</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle" class="txt1">发货单号：</td>
        <td align="left" valign="middle" class="txt2">ESM<%=orderId %></td>
        <td align="right" valign="middle" class="txt1">订单来源：</td>
        <td align="left" valign="middle" class="txt2">酷星网（本站）</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="170" align="center" valign="top"><table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder">
      <tr>
        <td height="30" colspan="4" align="center" bgcolor="#c9e4eb">收货人信息</td>
      </tr>
      <tr>
        <td width="100" height="30" align="right" valign="middle" class="txt1">收货人：</td>
        <td width="320" align="left" valign="middle" class="txt2"><%=bi.getUsername() %></td>
        <td width="100" align="right" valign="middle" class="txt1">电子邮件：</td>
        <td width="180" align="left" valign="middle" class="txt2"><%=bi.getUseremail() %></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle" class="txt1">地址：</td>
        <td align="left" valign="middle" class="txt2"><%=bi.getSendaddress() %></td>
        <td align="right" valign="middle" class="txt1">邮编：</td>
        <td align="left" valign="middle" class="txt2"><%=bi.getUserpostcode() %></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle" class="txt1">QQ号：</td>
        <td align="left" valign="middle" class="txt2"><%=bi.getUserqq() %></td>
        <td align="right" valign="middle" class="txt1">手机：</td>
        <td align="left" valign="middle" class="txt2"><%=bi.getUserphone() %></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle" class="txt1">标志性建筑：</td>
        <td align="left" valign="middle" class="txt2"><%=bi.getUserhothouse() %></td>
        <td align="right" valign="middle" class="txt1">最佳送货时间：</td>
        <td align="left" valign="middle" class="txt2"><%=bi.getBestsendgoodstime() %></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="160" align="center" valign="top"><table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder">
      <tr>
        <td height="30" colspan="4" align="center" bgcolor="#c9e4eb">商品信息</td>
      </tr>
      <%
      	for(int i = 0; i < al.size(); i++) {
      		BookCar bc = al.get(i);
      		%>
      		 <tr>
		        <td width="100" height="30" align="right" valign="middle" class="txt1">商品名称：</td>
		        <td width="320" align="left" valign="middle" class="txt2"><%=bc.getBookname() %></td>
		        <td width="100" align="right" valign="middle" class="txt1">货号：</td>
		        <td width="180" align="left" valign="middle" class="txt2">ECS000<%=bc.getBookid() %></td>
		      </tr>
		      <tr>
		        <td height="30" align="right" valign="middle" class="txt1">装订类型：</td>
		        <td align="left" valign="middle" class="txt2">精装版</td>
		        <td align="right" valign="middle" class="txt1">数量：</td>
		        <td align="left" valign="middle" class="txt2"><%=bc.getBookbuynum() %></td>
		      </tr>
		      <tr>
		        <td height="30" align="right" valign="middle" class="txt1">小计：</td>
		        <td align="left" valign="middle" class="txt2">￥<%=bc.getBooktotalprice() %>元</td>
		        <td align="right" valign="middle" class="txt1">类型：</td>
		        <td align="left" valign="middle" class="txt2"><%=bc.getBooktype() %></td>
		      </tr>
      		<%
      	}
      %>
     
      <tr>
        <td height="30" align="right" valign="middle" class="txt1">合计：</td>
        <td colspan="3" align="left" valign="middle" class="txt2"><%=bo.getTotalprice() %></td>
        </tr>
      
    </table></td>
  </tr>
</table>
</body>
</html>
