<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
YouhuiDAO yhtg = new YouhuiDAO();
ArrayList<YouHuiBeanNew> al = (ArrayList<YouHuiBeanNew>)request.getAttribute("tuangou");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>团购信息</title>
    
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
				background-color: #FFFFFF;
				margin-left: 0px;
				margin-top: 5px;
				margin-right: 0px;
				margin-bottom: 0px;
			}
			.tableborder {
				border: 1px solid #c5e4ff;
			}
			.txt1 {
				font-family: "宋体";
				font-size: 12px;
				font-weight: bold;
				color: #CC0000;
			}
			.link1 {
				font-family: "宋体";
				font-size: 12px;
				color: #333333;
				text-decoration: none;
			}
			.padding2 {
				padding-left: 6px;
				line-height: 22px;
			}
			.tdcolor1 {
				background-color: #f2f2f2;
			}
			.padding1 {
				padding-top: 8px;
			}
			.txtpadding {
				padding-left: 6px;
				border: 1px solid #c5e4ff;
			}
			.txt2 {
				font-family: "宋体";
				font-size: 12px;
				color: #006bd0;
				padding-right: 10px;
			}
			.tdcolor2 {
				background-color: #FFFFFF;
			}
			-->
	</style>
  </head>
<body>
		<table width="960" height="293" border="0" align = "center">
			  <tr>
			    <td height="50" colspan="2">
			    	<jsp:include page="top.jsp"></jsp:include>
			    </td>
			  </tr>
			  <tr>
			    <td width="323">
			    	<jsp:include page="left.jsp"></jsp:include>
			    
			    </td>
			    
			    
			    
			    
			   <td width="627" valign="top" >
			    	<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
  				<tr>
    				<td height="250">
    				<table width="750" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder">
				      <tr>
				        <td height="34"><img src="image/tdbg.jpg" alt="tdbg" width="750" height="34" /></td>
				      </tr>
      					<tr>
		        <td height="225" align="right" valign="middle">
		        <%
		        	for(int i=0;i<al.size();i++) {
		        		BookInfoDAO bi = new BookInfoDAO();
        				YouHuiBeanNew tuangou = al.get(i);
        				BookInfo book = bi.getBookInfo(tuangou.getBookid());
        				float price1 = book.getBook_user_price()*9/10;
        				float price2 = book.getBook_user_price()*8/10;
		        		%>
		        		<table width="740" border="0" align="center" cellpadding="0" cellspacing="0" class="tdcolor1">
			            <tr>
			              <td width="150" height="210" align="center" valign="top" class="padding1">
			              <table width="135" border="0" cellpadding="0" cellspacing="0">
					                  <tr>
					                    <td height="125" align="center" valign="middle" class="tdcolor2">
					                    	<a href="BookJump?id=<%=book.getBook_id() %>&zhegou=tuangou">
					                    	<img alt="图书图片" src="images/<%=book.getBook_img() %>" width="121" height="111">
					                    	</a>
					                    </td>
					                  </tr>
			              </table></td>
		              	<td width="590" align="left" valign="middle"><table width="583" border="0" cellpadding="0" cellspacing="0" class="tdcolor2">
		                  <tr>
		                    <td height="79" align="left" valign="bottom" class="padding2">团购商品：TGSP8060<%=book.getBook_id() %><br />
				                     	 起止时间：<%=tuangou.getActivity_startdate() %> -- <%=tuangou.getActivity_stopdate() %><br />
				                     	 价格阶梯：50--500元</td>
				                  </tr>
				                  <tr>
				                    <td height="121" align="center" valign="top"><table width="573" border="0" cellpadding="0" cellspacing="0" class="tableborder">
				                        <tr>
				                          <td width="163" height="34" align="left" valign="middle" class="txtpadding">数量</td>
				                          <td width="410" align="left" valign="middle" class="txtpadding">价格</td>
				                        </tr>
				                        <tr>
				                          <td height="34" align="left" valign="middle" class="txtpadding">5</td>
				                          <td align="left" valign="middle" class="txtpadding">
				                          	￥<%=price1 %>元</td>
				                        </tr>
				                        <tr>
				                          <td height="34" align="left" valign="middle" class="txtpadding">10</td>
				                          <td align="left" valign="middle" class="txtpadding">￥<%=price2 %>元</td>
				                        </tr>
				                    </table></td>
				                  </tr>
				              </table></td>
				            </tr>
				        </table>
		        		<%
		        	}
		        %>
		 
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="20" align="right" valign="bottom" class="txt2">总计【<%=yhtg.getTuangouPage() %>】个记录 </td>
  </tr>
</table>
			    
			    
			    </td>
			  </tr>
			  
			  
			  
			  
			  
			  
			  
			  <tr>
			    <td height="54" colspan="2">
			    	<jsp:include page="xinshoushanglu.jsp"></jsp:include>
			    
			    </td>
			  </tr>
			  <tr>
			  	<td height = "54" colspan="2">
			  		<jsp:include page="footer.jsp"></jsp:include>
			  	</td>
			  </tr>
			</table>







</body>
 
</html>
