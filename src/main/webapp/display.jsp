<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.servlet.*" pageEncoding="utf-8"%>
<%@page import="com.shxt.dao.EvaluationDAO"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	BookInfo bi = (BookInfo)request.getAttribute("bookinfo");
	UserInfo user = (UserInfo)request.getSession().getAttribute("user");
	//得到优惠或折购 
	String cheap = request.getParameter("zhegou");
	//算出评论个数
	EvaluationDAO edao = new EvaluationDAO();
	int evaluateNum = edao.getEvaluateNum(bi.getBook_id()+"");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'display.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/display.css">
<style type="text/css">
	.txt{
		color:#a5a5a5;
	}
</style>
<script type="text/javascript">
	function clear1() {
		
		document.getElementById("biaotian").value="";
	}
</script>
</head>

<body>
<div id = "display">
<table width="709" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td width="709" height="360" align="left" valign="top">
    <table width="709" border="0" cellpadding="0" cellspacing="0" background="images/tablebg.jpg">
      <tr>
        <td width="225" height="345" align="right"><img src="images/icon1.png" alt="icon1" width="78" height="82" />
          <table width="213" border="0" cellpadding="0" cellspacing="0" class="table1">
          <tr>
            <td width="200" height="210" align="left" bgcolor="#FFFFFF"><img src="images/<%=bi.getBook_img()%>" width = "200px" height = "220px"/></td>
          </tr>
        </table>
          <p>&nbsp;</p></td>
        <td width="484" height="350" align="center" valign="top" class="border2"><table width="450" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="33" colspan="3" align="left" class="STYLE3">书名:<%=bi.getBook_name() %></td>
            </tr>
          <tr>
            <td width="225" height="36" align="left" class="borderbg2">ISBN:<%=bi.getBook_isbn() %></td>
            <td width="225" colspan="2" align="left" class="borderbg2">库存:<%=bi.getBook_num() %></td>
          </tr>
          <tr>
            <td height="36" align="left" class="borderbg2">作者:<%=bi.getBook_author() %></td>
            <td colspan="2" align="left" class="borderbg2">商品重量：<%=bi.getBook_weight() %></td>
          </tr>
          <tr>
            <td height="65" align="left" ><p class="borderbg21"><font color="red">市场价格：<%=bi.getBook_market_price() %>元</font></p>
              <p class="borderbg2">VIP价格：<%=bi.getBook_user_price() %></p></td>
            <td width="70" align="left" class="borderbg2">图书装订：<%=bi.getBook_zhuangding() %></td>
          </tr>
          <tr>
            <td height="36" align="left" class="borderbg2">出版社：<%=bi.getBook_press() %></td>
            <td colspan="2" align="left" class="borderbg2">图书版次：第<%=bi.getBook_banci() %>版</td>
          </tr>
          <tr>
            <td height="60" colspan="3" align="left" class="borderbg2">购买数量：
              <input name="textfield2" type="text" class="input2" value="1" readonly/>
              册&nbsp;&nbsp;&nbsp;
              <%
              	if(bi.getBook_is_tuangou()==1){
              		%>
              		<font color="red">为团购图书，按照团购的数量进行不同的折购价！</font>
              		<%
               	} else if(bi.getBook_is_youhui()==1){
               		%>
              		<font color="red">该书为优惠图书，折购价为【9】折！</font>
              		<%
               	}
              %>
              </td>
            </tr>
          <tr>
            
            <%
            	if(user == null){
            	%>
            	<td height="54" align="center" class="borderbg2">
            	<a href="login.jsp?type=showCar&id=<%=bi.getBook_id() %>"><img src = "images/bnt_cat.gif"/></a>
            	</td>
            	
            	<td height="54" align="center" class="borderbg2">
            	<img src = "images/shoucang.png"/>
            	</td>
            	<%
            	} else {
            		%>
            		<td height="54" align="center" class="borderbg2">
            		<a href="Gouwuche?type=showCar&id=<%=bi.getBook_id() %>"><img src = "images/bnt_cat.gif"/></a>
            		</td>
            		
            		<td height="54" align="center" class="borderbg2">
            		<a href="ShouCang?bookid=<%=bi.getBook_id() %>&userid=<%=user.getUserid() %>"><img src = "images/shoucang.png"/></a>
            		</td>
            		<%
            	}
            %>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="235" align="left" valign="top"><table width="709" border="0" cellpadding="0" cellspacing="0" bordercolor="#F0F0F0" class="border1">
      <tr>
        <td height="40" colspan="2" class="bannerbg1">商品属性</td>
        </tr>
      <tr>
        <td height="25" colspan="2" align="center" valign="middle" class="border1">商品属性</td>
        </tr>
      <tr>
        <td width="210" height="25" class="txt1">书的简介</td>
        <td class="txt2"><%=bi.getBook_introduce() %></td>
      </tr>
      <tr>
        <td width="210" height="25" class="txt1">书的出版日期</td>
        <td width="499" class="txt2"><%=bi.getBook_press() %></td>
      </tr>
      <tr>
        <td width="210" height="25" class="txt1">图书装订</td>
        <td class="txt2"><%=bi.getBook_zhuangding() %></td>
      </tr>
      <tr>
        <td width="210" height="25" class="txt1">是否是精品推荐的</td>
        <td class="txt2">
        <%
	        if(bi.getBook_is_best() == 1) {
	        	%>
	        		是精品推荐
	        	<%
	        } else {
	        	%>
	        		不是精品推荐
	        	<%
	        }
        %>
        </td>
      </tr>
      <tr>
        <td width="210" height="25" class="txt1">是否是最新的</td>
        <td class="txt2">
        <%
	        if(bi.getBook_is_new() == 1) {
	        	%>
	        		是精品推荐
	        	<%
	        } else {
	        	%>
	        		不是精品推荐
	        	<%
	        }
        %>
        </td>
      </tr>
      <tr>
        <td width="210" height="25" class="txt1">是否是最畅销的</td>
        <td class="txt2">
        <%
	        if(bi.getBook_is_hot() == 1) {
	        	%>
	        		是精品推荐
	        	<%
	        } else {
	        	%>
	        		不是精品推荐
	        	<%
	        }
        %>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="233"><table width="709" border="0" cellpadding="0" cellspacing="0" bordercolor="#F0F0F0" class="border1">
      <tr>
        <td height="40" colspan="3" class="bannerbg1">商品描述</td>
      </tr>
      <tr>
        <td height="25" colspan="3" align="center" valign="middle" class="border1">商品描述</td>
      </tr>
      <tr>
        <td width="15" height="143" class="border1">&nbsp;</td>
        <td width="110" class="border1">
          <p><img src="images/<%=bi.getBook_img() %>" width = "110px" height = "143px"/></p></td>
        <td height="143" align="left" valign="top" class="txt3">
			<%=bi.getBook_introduce() %>
		</td>
      </tr>
      
    </table></td>
  </tr>
  <tr>
    <td height="120" align="left" valign="top"><table width="709" border="0" cellpadding="0" cellspacing="0" class="border1">
      <tr>
        <td height="40" colspan="2" class="bannerbg1">商品标签</td>
        </tr>
      <tr>
        <td height="28" colspan="2" class="txt1">如：计算机</td>
        </tr>
      <tr>
        <td width="235" height="44" align="center"><input name="textfield" type="text" id="biaotian" class="txt" value="输入添加标签" maxlength="10" onfocus="clear1();"/></td>
        <td><input name="Submit" type="submit" class="btn1" value="添 加" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="82" valign="top"><table width="709" border="0" cellpadding="0" cellspacing="0" class="border1">
      <tr>
        <td height="40" class="bannerbg1">用户评论</td>
      </tr>
      <tr>
        <td height="40" class="txt2"><a href="evaluationMain.jsp?bookid=<%=bi.getBook_id() %>&evaluateNum=<%=evaluateNum %>" class="a"><font color="#3FAFEF">到目前为止共有 <b>【<%=evaluateNum %>】</b> 位用户评论。我也要进行评论！</font> </a></td>
      </tr>
    </table></td>
  </tr>
</table>
</div>
</body>
</html>
