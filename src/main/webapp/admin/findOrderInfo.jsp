<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//得到商品的id号
String orderId = request.getParameter("orderid");

ShowOrderDAO show = new ShowOrderDAO();
UserDAO user = new UserDAO();

//得到订单详细信息 
BookOrder bo = show.getBookOrderById(orderId);

//通过orderid得到userid
String userid = bo.getUserid();

//得到购物车里的信息
ArrayList<BookCar> al = show.getBookCar(orderId);

//通过用户的id号来得到用户信息
UserInfo userInfo = user.getUserById(userid);

//通过具体的id得到图书信息的工具类实例化 
BookInfoDAO bdao = new BookInfoDAO();

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findOrderInfo.jsp' starting page</title>
    
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
	    <td height="40px">&nbsp;<b><font size="+1">酷星书城 管理中心</font> —— <font size="+1" color="#9CACAF">订单信息</font></b></td>
	  </tr>
	  <tr>
	    <td><table width="1136" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#EEF8F9">
	      <tr>
	        <td colspan="4" align="center"><img src="admin/img/orderInfo1.png" width="1136" height="32" /></td>
	        </tr>
	      <tr class="ziti">
	        <td width="150" align="right"  height="30px"><b>订单号：</b></td>
	        <td width="269"><%=bo.getOrderid() %></td>
	        <td width="171" align="right"><b>订单状态：</b></td>
	        <td width="540">
	        <%
	        	if(bo.getIsConfirmed()==1) {
	        		%>
	        		  已确认，
	        		<%
	        	} else {
	        		%>
	        		  未确认，
	        		<%
	        	}
	        %>
	        <%
	        	if(bo.getIspayed()==1) {
	        		%>
	        		  已付款，
	        		<%
	        	} else {
	        		%>
	        		  未付款，
	        		<%
	        	}
	        %>
	        <%
	        	if(bo.getSendstatus()==1) {
	        		%>
	        		  已发货
	        		<%
	        	} else {
	        		%>
	        		  未发货
	        		<%
	        	}
	        %>
	        </td>
	      </tr>
	      <tr class="ziti">
	        <td align="right"  height="30px"><b>购货人:</b></td>
	        <td><%=userInfo.getUsername() %></td>
	        <td align="right"><b>下单时间：</b></td>
	        <td><%=bo.getOrderdate() %></td>
	      </tr>
	      <tr class="ziti">
	        <td align="right"  height="30px"><b>支付方式：</b></td>
	        <td><%=bo.getPaymode() %></td>
	        <td align="right"><b>订单来源：</b></td>
	        <td>酷星网上书城</td>
	      </tr>
	      <tr class="ziti">
	        <td align="right"  height="30px"><b>配送方式：</b></td>
	        <td><%=bo.getSendmode() %></td>
	        <td colspan="2">&nbsp;</td>
	      </tr>
	      <tr class="ziti">
	        <td align="right"  height="30px"><b>发货单号：</b></td>
	        <td align="left">ESC<%=bo.getOrderid() %></td>
	        <td colspan="2">&nbsp;</td>
	      </tr>
	    </table></td>
	  </tr>
	  <tr>
	    <td><table width="1136" border="1" cellspacing="0" cellpadding="0" bordercolor="#EEF8F9">
	      <tr>
	        <td colspan="4" align="center"><img src="admin/img/orderInfo2.png" width="1136" height="32" /></td>
	        </tr>
	      <tr class="ziti">
	        <td width="148" align="right" height="30px"><b>发票类型：</b></td>
	        <td width="267">增值税发票</td>
	        <td width="177" align="right"><b>发票内容：</b></td>
	        <td width="538">图书</td>
	      </tr>
	      <tr class="ziti">
	        <td align="right" height="30px"><b>缺货处理：</b></td>
	        <td>等待所以商品备齐后再发</td>
	        <td align="right"><b>贺卡：</b></td>
	        <td>
	   		<%
	   			if(bo.getIscard() ==1) {
	   				%>
	   				配有贺卡
	   				<%
	   			} else {
	   				%>
	   				没有贺卡
	   				<%
	   			}
	   		%>     
	        </td>
	      </tr>
	      <tr class="ziti">
	        <td align="right" height="30px"><b>包装：</b></td>
	        <td>
	        <%
	   			if(bo.getIspackage() ==1) {
	   				%>
	   				精品包装
	   				<%
	   			} else {
	   				%>
	   				没有包装
	   				<%
	   			}
	   		%>     
	        </td>
	        <td align="right"><b>贺卡祝福语：</b></td>
	        <td>无</td>
	      </tr>
	    </table></td>
	  </tr>
	  <tr>
	    <td><table width="1136" border="1" cellspacing="0" cellpadding="0" bordercolor="#EEF8F9">
	      <tr>
	        <td colspan="4" align="center"><img src="admin/img/orderInfo3.png" width="1136" height="32" /></td>
	        </tr>
	      <tr class="ziti">
	        <td width="146" align="right" height="30px"><b>收货人：</b></td>
	        <td width="268"><%=userInfo.getUsername() %></td>
	        <td width="179" align="right"><b>电子邮件：</b></td>
	        <td width="537"><%=userInfo.getUseremail() %></td>
	      </tr>
	      <tr class="ziti">
	        <td align="right" height="30px"><b>收货地址：</b></td>
	        <td><%=userInfo.getSendaddress() %></td>
	        <td align="right"><b>邮政编码：</b></td>
	        <td><%=userInfo.getUserpostcode() %></td>
	      </tr>
	      <tr class="ziti">
	        <td align="right" height="30px"><b>联系电话：</b></td>
	        <td><%=userInfo.getUserphone() %></td>
	        <td align="right"><b>QQ号码：</b></td>
	        <td><%=userInfo.getUserqq() %></td>
	      </tr>
	      <tr class="ziti">
	        <td align="right" height="30px"><b>标志性建筑：</b></td>
	        <td><%=userInfo.getUserhothouse() %></td>
	        <td align="right"><b>最佳送货时间：</b></td>
	        <td><%=userInfo.getBestsendgoodstime() %></td>
	      </tr>
	    </table></td>
	  </tr>
	  <tr>
	    <td><table width="1136" border="1" cellspacing="0" cellpadding="0"  bordercolor="#EEF8F9">
	      <tr>
	        <td colspan="8" align="center"><img src="admin/img/orderInfo4.png" width="1136" height="32" /></td>
	        </tr>
	      <tr class="ziti">
	        <td align="center" height="30px"><b>图书名称</b></td>
	        <td align="center"><b>货号</b></td>
	        <td align="center"><b>价格</b></td>
	        <td align="center"><b>数量</b></td>
	        <td align="center"><b>出版社</b></td>
	        <td align="center"><b>作者</b></td>
	        <td align="center"><b>库存量</b></td>
	        <td align="center"><b>小计</b></td>
	      </tr>
	      <%
	      	float allPrice = 0.0f;
	      	for(int i = 0; i < al.size(); i++) {
	      		BookCar bc = al.get(i);
	      		//通过具体的booid得到图书信息
	      		BookInfo book = bdao.getBookInfo(bc.getBookid());
	      		%>
	      		 <tr class="ziti">
			        <td align="center" height="30px"><%=book.getBook_name() %></td>
			        <td align="center">KXS100<%=book.getBook_id() %></td>
			        <td align="center">￥<%=book.getBook_user_price() %>元</td>
			        <td align="center"><%=bc.getBookbuynum() %></td>
			        <td align="center"><%=book.getBook_press() %></td>
			        <td align="center"><%=book.getBook_author() %></td>
			        <td align="center"><%=book.getBook_num() %></td>
			        <td align="center">￥<%=bc.getBooktotalprice() %>元</td>
			      </tr>
	      		<%
	      		allPrice += bc.getBooktotalprice();
	      	}
	      %>
	     
	      <tr class="ziti">
	        <td colspan="8" align="right">合计：￥<%=allPrice %>元 &nbsp;&nbsp; </td>
	        </tr>
	    </table></td>
	  </tr>
	  <tr>
	    <td><table width="1136" border="1" cellspacing="0" cellpadding="0" bordercolor="#EEF8F9">
	      <tr>
	        <td align="center"><img src="admin/img/orderInfo5.png" width="1136" height="32" /></td>
	      </tr>
	      <tr class="ziti">
	      	<%
	      		float packages = 0.0f;
	      		float cards = 0.0f;
	      		if(bo.getIscard()==1){
	      			cards = 5.00f;
	      		} 
	      		if(bo.getIspackage()==1) {
	      			packages = 5.00f;
	      		}
	      	%>
	        <td align="right" height="30px">商品总金额：￥<%=allPrice %>元 -折扣：￥0.00元 + 发票税额：￥0.00元 + 配送费用：￥15.00元 + 报价费用：￥0.00元 + 包装费用：￥<%=packages %>元 + 贺卡费用：￥<%=cards %>元 &nbsp;&nbsp;&nbsp;&nbsp;</td>
	      </tr>
	      <tr class="ziti">
	        <td align="right" height="30px">=订单总金额：￥<%=(allPrice+packages+cards) %>元 &nbsp;&nbsp;&nbsp;&nbsp;</td>
	      </tr>
	    </table></td>
	  </tr>
	  <tr>
	    <td align="center"><table width="1136" border="1" cellspacing="0" cellpadding="0"  bordercolor="#EEF8F9">
	      <tr>
	        <td align="center"><img src="admin/img/orderInfo6.png" width="1136" height="32" /></td>
	      </tr>
	      <tr class="ziti">
	        <td height="30px">
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前可执行操作：
	        <%
	        	if(bo.getSendstatus()==0) {
	        		if(bo.getIspayed()==0){
	        			if(bo.getIsConfirmed()==0){
	        				%>
			        		<a href="ModifyOrder?orderid=<%=bo.getOrderid() %>&type=confirm">
			        		<input type="button" value="确 认" /> 
			        		</a>
			        		<%
	        			} else {
	        				%>
	        				<a href="ModifyOrder?orderid=<%=bo.getOrderid() %>&type=pay">
			        		<input type="submit" value="付 款" /> 
			        		</a>
			        		<%
	        			}
	        		} else {
	        			%>
	        			<a href="ModifyOrder?orderid=<%=bo.getOrderid() %>&type=out">
		        		<input type="submit" value="发  货" /> 
		        		</a>
		        		<%
	        		}
	        	} else {
	        		%>
	        		<font color="red">订单已经生成，您可以<a href="admin/dingdanlist.jsp">打印订单信息</a> 或是 <a href="admin/dingdanlist.jsp">返回订单列表</a></font>
	        		<%
	        	}
	        %>
	        </td>
	      </tr>
	    </table></td>
	  </tr>
	</table>
  </body>
</html>
