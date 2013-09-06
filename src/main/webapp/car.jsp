<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<BookInfo> books = (ArrayList<BookInfo>)request.getAttribute("carList");
CarDAO cdao = (CarDAO)request.getSession().getAttribute("mycar");
BookInfoDAO binfo = new BookInfoDAO();
YouhuiDAO youhui = new YouhuiDAO();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		function checkNumT() {
			var booknum = document.getElementById("storeTNum").value;
			var num = document.getElementById("bookTnum").value;
			//alert(isNaN(num));
			if(isNaN(num)){
				alert("对不起，该处只能输入数字!");
				document.getElementById("bookTnum").value = 1;
			} else if(Number(num) > Number(booknum)) {
				alert("对不起，本书团购上限量为"+booknum+"本!");
				document.getElementById("bookTnum").value = 1;
			}
		}
		
		function checkNumY() {
			var booknum = document.getElementById("storeYNum").value;
			var num = document.getElementById("bookYnum").value;S
			//alert(isNaN(num));
			if(isNaN(num)){
				alert("对不起，该处只能输入数字!");
				document.getElementById("bookYnum").value = 1;
			} else if(Number(num) > Number(booknum)) {
				alert("对不起，本书优惠量上限为"+booknum+"本!");
				document.getElementById("bookYnum").value = 1;
			}
		}
	
		function checkNum() {
			var booknum = document.getElementById("storeNum").value;
			var num = document.getElementById("book_num").value;
			//alert(isNaN(num));
			if(isNaN(num)){
				alert("对不起，该处只能输入数字!");
				document.getElementById("book_num").value = 1;
			} else if(Number(num) > Number(booknum)) {
				alert("对不起，本书库存量不足！");
				document.getElementById("book_num").value = 1;
			}
		}
	</script>

  </head>
  
  <body>
	<table width="960px" border="0" align="center">
	  <tr>
	    <td height="49" colspan="2">
	    	<jsp:include page = "top.jsp"></jsp:include>
	    
	    </td>
	  </tr>
	  
	  
	  
	  <tr>
	    <td width="960px" height="251" valign="top">
	    	<form action="Gouwuche?type=update" method="post">
	    	<table width="960px" border="1" cellpadding="0" cellspacing="0" align = "center" bordercolor="#DDDDDD">
			  <tr height="35px">
			    <td align="center">&nbsp;图书</td>
			    <td align="center"><div align="center">商品属性</div></td>
			    <td width="88"><div align="center">市场价</div></td>
			    <td width="88"><div align="center">VIP价</div></td>
			    <td width="89"><div align="center">购物数量</div></td>
			    <td width="65"><div align="center">总计 </div></td>
			    <td width="70"><div align="center">操作</div></td>
			  </tr>
			  
			  <%
			  if(books==null || books.size()==0){
		 	       %>
			       <tr align="center" class="mycss">
			       <br><center><img src="images/err.gif"></img><font color="red" size="6">购物车里没有商品可以显示！</font></center>
				   </tr>
			       <%	
			       cdao.setUserAllPrice(0.0f);
		 	   }
		 	   else{
			  	for(int i=0;i<books.size();i++){
			  		BookInfo bi = books.get(i);
			   %>
			  <tr height="140px">
			    <td width="208px" height="120px" align="center">
			    <p><img src="images/<%=bi.getBook_img() %>" width="88" height="90px"></p>
			   <a href="BookJump?id=<%=bi.getBook_id() %>"><%=bi.getBook_name() %></a></td>
			    <td width="122px" align="center">&nbsp;<%=bi.getBook_type() %></td>
			    <td width="145px" align="right">&nbsp;￥<%=bi.getBook_market_price() %>元</td>
			    <td width="145px" align="right">&nbsp;￥<%=bi.getBook_user_price() %>元</td>
			    <td width="125px" align="center">
					<input name="id" type="hidden" value="<%=bi.getBook_id() %>">
			    <%
			    	if(bi.getBook_is_tuangou()==1) {
			    		%>
			    			<input id="storeTNum" type="hidden" value="<%=youhui.getYouhuiInfoByBookid(bi.getBook_id()+"").getTuangou_number() %>" />
					    	<input name="bookTnum" id="bookTnum" type="text" size="8" value="<%=cdao.getNumById(bi.getBook_id()+"") %>" onblur="checkNumT()"/>
			    		<%
			    	} else if(bi.getBook_is_youhui()==1) {
			    		%>
			    			<input id="storeYNum" type="hidden" value="<%=youhui.getYouhuiInfoByBookid(bi.getBook_id()+"").getYouhui_number() %>" />
					    	<input name="bookYnum" id="bookYnum" type="text" size="8" value="<%=cdao.getNumById(bi.getBook_id()+"") %>" onblur="checkNumY()"/>
			    		<%
			    	} else {
			    		%>
			    			<input id="storeNum" type="hidden" value="<%=bi.getBook_num() %>" />
					    	<input name="booknum" id="book_num" type="text" size="8" value="<%=cdao.getNumById(bi.getBook_id()+"") %>" onblur="checkNum()"/>
			    		<%
			    	}
			    %>
			    
			     </td>
			    
			    <td width="105px" align="right"> ￥<%=cdao.getOnePrice(bi.getBook_id()+"") %>元</td>
			    <td width="106px" align="center">
			    	<a href="BookJump?id=<%=bi.getBook_id() %>">查  看</a>&nbsp;&nbsp;
			    	<a href="Gouwuche?type=delete&id=<%=bi.getBook_id() %>" onclick="return window.confirm('是否真的要删除此商品!')">删  除</a>
			    </td>
			  </tr>
			  <%
			  	}}
			  %>
			  <tr>
			    <td height="35px" colspan="5">购物金额小计：￥<%=cdao.getUserAllPrice() %>元 ，比市场价：<%=cdao.getMarketAllPrice() %>元 ，节省了<%=cdao.getSavePrice() %>元</td>
			    <td colspan="3" align="right">
			      <a href="Gouwuche?type=delAll" onclick="return window.confirm('是否真的要全部删除?')" ><img src="images/clear_car.png" width="80" height="23" /></a>
			      <input type="image"  src="images/update_car.png" width="80" height="23" />
			    </td>
			  </tr>
			  <tr>
			    <td height="55" colspan="7">
			    &nbsp;
			    <a href="index.jsp"><img src="images/continue_buy.png" /></a>
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <a href="Gouwuche?type=buy">
			    	<img src="images/checkout.gif" width="135" height="36"/></a>
			    </td>
			  </tr>
			</table>
	    	</form>
	    </td>
	    
	    
	    
	    
	    
	  </tr>
	  <tr>
	    <td height="65px" colspan="2">
	    	<jsp:include page="footer.jsp"></jsp:include>
	    </td>
	  </tr>
	</table>
  
  
  
  
	
</body>
</html>
