<%@ page language="java" import="java.util.*,com.shxt.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserDAO user = new UserDAO();
OrderDAO order = new OrderDAO();
//得到会员总数
int userNum = user.getUserNum();
//得到有订单的会员数
int orderUserNum = user.getOrderUserNum();
//得到订单总数
int orderNum = order.getNumOrders();
//算出会员购买率——有订单的会员数/会员总数
float buypate = (orderUserNum*100)/userNum;

//计算订单总金额
float allOrderPrice = order.getAllOrderPrice();

//计算每个会员订单数——订单总数/会员总数
float userByOrder = orderNum/userNum;

//每会员购物额
float userpate = (float)(allOrderPrice/userNum);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UserStat.jsp' starting page</title>
    
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
    <table width="1120" border="10" cellspacing="0" cellpadding="0" bordercolor="#DDEEF2">
  <tr>
    <td height="40px" bgcolor="#F4FAFB">&nbsp;<b><font size="+1">酷星书城 管理中心</font> ——<font color="#9CACAF" size="+1">用户统计</font></b></td>
  </tr>
  <tr>
    <td height="116">
    <table width="1136" border="1" cellspacing="0" cellpadding="0" bordercolor="#EEF8F9">
      <tr align="left" valign="middle" class="ziti">
        <td height="36px" bgcolor="#BBDDE5">会员购买率<font color="#666666">（会员购买率=有订单的会员数÷会员总数）</font></td>
        </tr>
      <tr class="ziti">
        <td height="30px" align="center"><table width="1136" border="1" cellspacing="0" cellpadding="0" bordercolor="#EEF8F9">
          <tr class="ziti">
            <td height="30"><div align="center">会员总数</div></td>
            <td height="30"><div align="center">有订单会员数</div></td>
            <td height="30"><div align="center">会员订单总数</div></td>
            <td height="30"><div align="center">会员购买率</div></td>
          </tr>
          <tr class="ziti">
            <td height="30"><div align="center"><%=userNum %></div></td>
            <td height="30"><div align="center"><%=orderUserNum %></div></td>
            <td height="30"><div align="center"><%=orderNum %></div></td>
            <td height="30"><div align="center"><%=buypate %>%</div></td>
          </tr>
        </table></td>
        </tr>
      <tr valign="middle" class="ziti">
        <td height="36" align="left" bgcolor="#BBDDE5">会员平均订单数和物额<font color="#666666">（会员订单数=会员订单总数÷会员总数）（会员购物额=会员购物总额÷会员总数）</font></td>
      </tr>
      <tr class="ziti">
        <td height="30px" align="center"><table width="1136" border="1" cellspacing="0" cellpadding="0" bordercolor="#EEF8F9">
            <tr class="ziti">
              <td height="30"><div align="center">会员购物总额</div><div align="center"></div><div align="center"></div>                <div align="center"></div></td>
              <td height="30"><div align="center">每会员订单数</div></td>
              <td height="30"><div align="center">每会员购物额</div></td>
            </tr>
            <tr class="ziti">
              <td height="30"><div align="center">￥<%=allOrderPrice %>元</div><div align="center"></div><div align="center"></div>                <div align="center"></div></td>
              <td height="30"><div align="center"><%=userByOrder %></div></td>
              <td height="30"><div align="center">￥<%=userpate %>元</div></td>
            </tr>
        </table></td>
      </tr>
      <tr valign="middle" class="ziti">
        <td height="36" align="left" bgcolor="#BBDDE5">匿名会员平均订单额及购物总额<font color="#666666">（匿名会员平均订单额=匿名会员购物总额÷匿名会员订单总数）</font></td>
      </tr>
      <tr>
        <td height="30px" align="center"><table width="1136" border="1" cellspacing="0" cellpadding="0" bordercolor="#EEF8F9">
            <tr class="ziti">
              <td height="30"><div align="center">匿名会员购物总额</div>
                  <div align="center"></div>
                <div align="center"></div>
                <div align="center"></div></td>
              <td height="30"><div align="center">匿名每会员订单总数</div></td>
              <td height="30"><div align="center">匿名会员平均订单额</div></td>
            </tr>
            <tr class="ziti">
              <td height="30"><div align="center">￥0.00</div>
                  <div align="center"></div>
                <div align="center"></div>
                <div align="center"></div></td>
              <td height="30"><div align="center">0</div></td>
              <td height="30"><div align="center">0</div></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
