<%@ page language="java" import="java.util.*,com.shxt.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
CarDAO cdao = (CarDAO)request.getSession().getAttribute("mycar");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<style type="text/css">
<!--
#left .STYLE1 {
	font-size: 12px;
	color: #666666;
}
#left .tbfont {
	line-height: 20px;
	padding-top: 2px;
	padding-left: 5px;
}
#left .t1 {
	border: thin solid #99FFFF;
}
#left .backg {
	background-image: url(images/kuang.png);
	background-repeat: no-repeat;
}
#left .STYLE2 {
	font-size: 12px;
	color: #0000FF;
	line-height: 20px;
	
}
#left .STYLE3 {
	font-size: 12px;
	color: black;
	font-weight: normal;
	
}
#left .t2 {
	border-bottom-width: thin;
	border-bottom-style: dashed;
	border-bottom-color: #CCCCCC;
}
#left .STYLE4 {color: #FF0000}
#left a{
	color: black;
	font-weight: normal;
}
#left a:link {
	text-decoration: none;
	color: #333333;
}
#left a:hover {
	text-decoration: none;
	color: red;
}
#left .fontspace {
	line-height: 20px;
	left: 10px;
	padding-left: 10px;
	padding-top: 10px;
}
#left body,td,th {
	color: #333333;
}
#left .leftspace {
	line-height: 16px;
	padding-left: 30px;
}
#left body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #FFFFFF;
}
-->
</style>

</head>
<body>
<div id = "left">
<table width="200" border="0" cellpadding="0" cellspacing="0" bgcolor="white">
  <tr>
    <td height="115" class="t1"><table width="200" border="0" cellpadding="0" cellspacing="0" bgcolor="#FEFEFE">
  <tr>
    <td height="32" valign="top"><img src="images/ECSHOP_03.jpg" /></td>
  </tr>
  <tr>
    <td height="46" align="left" class="fontspace"><span class="STYLE1"><font size="2px">欢迎光临酷星图书网，我们的宗旨：诚信经营，服务客户！</font></span></td>
  </tr>
  <tr>
    <td height="46"><a href="#">
    
    	<marquee scrolldelay="150">
    	<font color="red" size="2px">咨询电话：18943643561
    	<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0349-7063721</font>
    	</marquee>
    
    </a></td>
  </tr>
</table>
  <tr>
    <td height="4"></td>
  </tr>
  <tr>
    <td height="78" class="backg"><table width="180" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="40" rowspan="2" align="center"><img src="images/gowuche.png" /></td>
    <%
    	if(cdao == null){
    		%>
    		    <td><span class="STYLE2"><a href="Gouwuche?type=showMyCar">您的购物车中有0件商品，总计金额￥0.00元。</a></span></td>
    		<%
    	} else {
    		%>
    		    <td><span class="STYLE2"><a href="Gouwuche?type=showMyCar">您的购物车中有 <font color="red"><%=cdao.getNum() %></font> 件商品，总计金额 <font color="red">￥<%=cdao.getUserAllPrice() %>元。</font></a></span></td>
    		<%
    	}
    %>
  </tr>
</table>
    </td>
  </tr>
  <tr>
    <td height="4">&nbsp;</td>
  </tr>
  <tr>
    <td height="300" class="t1"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="105">
      <table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" class="t2">&nbsp;<img src="images/anniu.png" hspace="10" />&nbsp;&nbsp;<span class="STYLE3">图书类型</span></td>
  </tr>
  <tr>
    <td height="20" align="left" valign="bottom" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=jingji&name=types"><font size = "2px">经济类</font></a></span></td>
  </tr>
  <tr>
   <td align="left" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=computer&name=types"><font size = "2px">计算机类</font></a></span></td>
  </tr>
  <tr>
    <td align="left" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=english&name=types"><font size = "2px">英语类</font></a></span></td>
  </tr>
  <tr>
    <td align="left" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=math&name=types"><font size = "2px">数学类</font></a></span></td>
  </tr>
</table>
</td>
  </tr>
  <tr>
    <td><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" class="t2">&nbsp;<img src="images/anniu.png" hspace="10" />&nbsp;&nbsp;<span class="STYLE3">图书价格</span></td>
  </tr>
  <tr>
    <td height="20" align="left" valign="bottom" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=san&name=jiage"><font size = "2px">10-30元</font></a></span></td>
  </tr>
  <tr>
   <td align="left" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=wu&name=jiage"><font size = "2px">31-50元</font></a></span></td>
  </tr>
  <tr>
    <td align="left" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=qi&name=jiage"><font size = "2px">51-70元</font></a></span></td>
  </tr>
  <tr>
    <td align="left" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=dayuqi&name=jiage"><font size = "2px">70元以上</font></a></span></td>
  </tr>
</table></td>
  </tr>
  <tr>
    <td><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" class="t2">&nbsp;<img src="images/anniu.png" hspace="10" />&nbsp;&nbsp;<span class="STYLE3">图书出版社</span></td>
  </tr>
  <tr>
    <td height="20" align="left" valign="bottom" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=xindongfang&name=chubanshe"><font size = "2px">新东方出版社</font></a></span></td>
  </tr>
   <tr>
    <td height="20" align="left" valign="bottom" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=beijing&name=chubanshe"><font size = "2px">北京大学出版社</font></a></span></td>
  </tr>
  <tr>
   <td align="left" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=qinghua&name=chubanshe"><font size="2px">清华大学出版社</font></a></span></td>
  </tr>
  <tr>
    <td align="left" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=tongji&name=chubanshe"><font size = "2px">同济大学出版社</font></a></span></td>
  </tr>
  <tr>
    <td align="left" class="leftspace"><span class="STYLE3"><a href="SearchBookInfo?type=jixie&name=chubanshe"><font size = "2px">机械工业大学出版社</font></a></span></td>
  </tr>
</table></td>
  </tr>
</table>
 </td>
  </tr>
</table>
</div>
</body>
</html>