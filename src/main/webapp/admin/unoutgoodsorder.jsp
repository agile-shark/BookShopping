<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//定义一页显示的记录数
int pageSize = 7;

int pageNow = 1;
//从servlet中得到传过来的pageNow
String pagenow = request.getParameter("pageNow");
if(pagenow!=null){
	pageNow = Integer.parseInt(pagenow);
}
OrderDAO order = new OrderDAO();
ArrayList<BookOrder> al = order.getAllOrdersByUnOutGoods(pageNow,pageSize);
UserDAO user = new UserDAO();
//获取订单数量 
int num = order.getNumOrdersByUnOutGoods();
//计算出总页数
int pageCount = 1;
if(num%6==0) {
	pageCount = num/pageSize;
} else {
	pageCount = num/pageSize+1;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dingdanlist.jsp' starting page</title>
    
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
}
body {
	background-color: #ddeef2;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="admin/style/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE2 {
	font-size: 14px;
	font-weight: bold;
	color: #9cacaf;
}
.STYLE3 {
	font-size: 14px;
	font-weight: bold;
}
.STYLE5 {color: #808080}
.STYLE7 {color: #335b64}
.STYLE8 {color: #192e32}
-->
</style>
<script type="text/javascript">
	function selectTotal(){
		var selectAll = document.getElementById("selectAll");
		var boxs = document.getElementsByName("checkboxs");
		for(var i=0;i<boxs.length;i++) {
			boxs[i].checked = selectAll.checked;
		}
	}
</script>
</head>

<body>
<table width="100%" height="458" border="0" cellpadding="0" cellspacing="0" class="bigtbleborder">
  <tr>
    <td height="58" align="center" valign="middle"><table width="98%" border="0" cellpadding="0" cellspacing="0" class="topborder">
      <tr>
        <td width="82" height="36" align="left" valign="middle"><font size="3"><b>酷星SHOP</b></font></td>
        <td width="128" align="left" valign="middle"><span class="STYLE3">管理中心-</span><span class="STYLE2">订单列表</span></td>
        <td height="36">&nbsp;</td>
        <td width="90" align="left" valign="middle"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="47" align="center" valign="middle">
    
    
    
    <form action="SearchOrderType" method="post">
    <table width="98%" border="0" cellpadding="0" cellspacing="0" class="topborder">
      <tr>
        <td width="34" height="36" align="center" valign="middle">
        <img src="admin/img/checktubiao.jpg" alt="tubiao" width="21" height="17" />
        </td>
        <td width="52" align="left" valign="middle" class="STYLE5">订单状态</td>
        <td width="92" align="left" valign="middle" height="20px">
		<select name="select" class="select_1">
		  <option value="out">待发货</option>
		  <option value="confirmed">待确认</option>
          <option value="payed">待付款</option>
          <option value="success">已完成</option>
        </select>
        </td>
        <td width="61" align="left" valign="middle"><input name="Submit" type="submit" class="btn_1" value="搜索" /></td>
        <td align="left" valign="middle"><span class="STYLE7"> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;</span></td>
      </tr>
    </table>
    </form>
    
    
    
    </td>
  </tr>
  <tr>
    <td height="321" align="center" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="31" align="left" valign="top">
        <table width="100%" cellpadding="0" cellspacing="0" bordercolor="#eef8f9" bgcolor="#bbdde5">
          <tr>
            <td width="192" height="31" align="center" valign="middle" class="tble_1">
            <input type="checkbox" name="checkbox" id="selectAll" value="checkbox" onclick="selectTotal()"/>
              <a href="#" class="STYLE8">订单号</a></td>
            <td width="132" align="center" valign="middle" class="tble_1"><a href="#" class="STYLE8">下单时间</a><img src="img/tubiao_2.jpg" alt="tubiao" width="7" height="6" /></td>
            <td align="center" valign="middle" class="tble_1"><span ><a href="#" class="STYLE8">收货人</a></span></td>
            <td width="115" align="center" valign="middle" class="tble_1"><a href="#" class="STYLE8">总金额</a></td>
            <td width="90" align="center" valign="middle" class="tble_1"><a href="#" class="STYLE8">应付金额</a></td>
            <td width="198" align="center" valign="middle" class="tble_1">订单状态</td>
            <td width="52" align="center" valign="middle" class="tble_1">操作</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="285" align="center" valign="top">
        <form action="ModifyOrderAll?type=out" method="post">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tbleboder">
        <%
        	if(al.size()!=0) {
        	for(int i=0;i<al.size();i++) {
        		BookOrder bookorder = al.get(i);
        		%>
        		<tr>
		            <td width="192" height="50" class="tble_2">
		            <input type="checkbox" name="checkboxs" value="<%=bookorder.getOrderid() %>" />
		              <a href="admin/findOrderInfo.jsp?orderid=<%=bookorder.getOrderid() %>" class="STYLE8"><%=bookorder.getOrderid() %></a></td>
		            <td width="132" class="tble_2"><p><%=user.getUserById(bookorder.getUserid()).getUsername() %></p>
		              <p><%=user.getUserById(bookorder.getUserid()).getRegistdate() %></p></td>
		            <td class="tble_2"><p><a href="#" class="STYLE8"><%=user.getUserById(bookorder.getUserid()).getUseremail() %></a>[TEL:<%=user.getUserById(bookorder.getUserid()).getUserphone() %>]</p>
		              <p><%=user.getUserById(bookorder.getUserid()).getSendaddress() %></p></td>
		            <td width="115" class="tble_2">￥<%=bookorder.getTotalprice() %>元</td>
		            <%
		            	if(bookorder.getIspayed()==1) {
		            		%>
		            		<td width="90" class="tble_2">￥<%=bookorder.getTotalprice() %>元</td>
		            		<%
		            	}
		            %>
		             <%
		            	if(bookorder.getIspayed()==0) {
		            		%>
		            		<td width="90" class="tble_2">￥0.00元</td>
		            		<%
		            	}
		            %>
		            <%
		            	if(bookorder.getIsConfirmed()==1) {
		            		if(bookorder.getIspayed()==1){
		            			%>
		            			<td width="198" class="tble_2">已确认，已付款，发货中</td>
		            			<%
		            		} else {
		            			%>
		            			<td width="198" class="tble_2">已确认，未付款，未发货</td>
		            			<%
		            		}
		            	} else{
		            		%>
	            			<td width="198" class="tble_2">未确认，未付款，未发货</td>
	            			<%
		            	}
		            %>
		            
		            <td width="52" class="tble_2"><a href="admin/findOrderInfo.jsp?orderid=<%=bookorder.getOrderid() %>" class="STYLE8">查看</a></td>
		          </tr>
        		<%
        	}
        }
        %>
          <tr>
            <td height="29" colspan="7"> &nbsp;&nbsp;
             <%
            	if(al.size() != 0) {
            		%>
            		<input name="Submit2" type="submit" class="btn_2" value="发 货" style="cursor:pointer;"/>       
            		<%
            	}
            %>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 总计<%=num %>个记录 &nbsp;当前第  <%=pageNow %> 页
             &nbsp;&nbsp;&nbsp;&nbsp;
             <a href="SearchOrderType?select=out&pageNow=1">首 页</a> &nbsp;
             <%
             	if(pageNow>1){
             		%>
             		<a href="SearchOrderType?select=out&pageNow=<%=pageNow-1 %>">上一页</a> &nbsp;
             		<%
             	}
             %>
              <%
             	if(pageNow<pageCount){
             		%>
             		<a href="SearchOrderType?select=out&pageNow=<%=pageNow+1 %>">下一页</a> &nbsp; 
             		<%
             	}
             %>
             <a href="SearchOrderType?select=out&pageNow=<%=pageCount %>">尾 页</a> 
              </td>
            </tr>
        </table>
        </form>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="32" align="center" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="32" align="left" valign="top"></td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
