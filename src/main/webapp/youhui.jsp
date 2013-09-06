<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<YouHuiBeanNew> al = (ArrayList<YouHuiBeanNew>)request.getAttribute("youhui");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>优惠活动界面</title>
    
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
	color: #404040;
}
body {
	background-color: #FFFFFF;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.txt1 {
	font-family: "宋体";
	font-size: 12px;
	font-weight: bold;
	color: #404040;
	border: 1px solid #dddddd;
}
.txt2 {
	font-family: "宋体";
	font-size: 12px;
	line-height: 16px;
	padding-left: 7px;
	border: 1px solid #dddddd;
}
-->
</style>
</head>

<body>
<table width="960" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
	<td>
		<jsp:include page="top.jsp"></jsp:include>
	</td>
</tr>
  <tr>
    <td height="25" align="left" valign="top"><img src="img/tdbg.jpg" alt="tdbg" width="960" height="25" /></td>
  </tr>
  <tr>
    <td height="172" align="center" valign="bottom"><table width="960" border="0" cellspacing="0" cellpadding="0">
      <tr>
     	 <%
      		YouHuiBeanNew youhui = al.get(1);
      	 %>
        <td width="220" height="29" align="center" valign="middle" class="txt1">优惠活动名称：</td>
        <td colspan="3" align="left" valign="middle" class="txt2"><%=youhui.getActivity_title() %></td>
        </tr>
      <tr>
      	<%
      		YouHuiBeanNew youhui1 = al.get(1);
      	 %>
        <td height="29" align="center" valign="middle" class="txt1">优惠开始时间：</td>
        <td width="210" align="left" valign="middle" class="txt2"><%=youhui1.getActivity_startdate() %></td>
        <td width="309" align="center" valign="middle" class="txt1">金额上限：</td>
        <td width="223" align="left" valign="middle" class="txt2">500.00</td>
      </tr>
      <tr>
      	<%
      		YouHuiBeanNew youhui2= al.get(0);
      	 %>
        <td height="29" align="center" valign="middle" class="txt1">优惠结束时间：</td>
        <td align="left" valign="middle" class="txt2"><%=youhui2.getActivity_stopdate() %></td>
        <td align="center" valign="middle" class="txt1">金额下限：</td>
        <td align="left" valign="middle" class="txt2">50.00</td>
      </tr>
      <tr>
        <td height="47" align="center" valign="middle" class="txt1">优惠范围：</td>
        <td align="left" valign="middle" class="txt2">以下品牌：<br />
        <%
        	for(int i=0;i<al.size();i++) {
        		BookInfoDAO bi = new BookInfoDAO();
        		YouHuiBeanNew youhui3 = al.get(i);
        		BookInfo book = bi.getBookInfo(youhui3.getBookid());
         %>
         <%=book.getBook_name() %>
         <%} %>
          </td>
        <td align="center" valign="middle" class="txt1">享受优惠的会员等级</td>
        <td align="left" valign="middle" class="txt2">注册用户VIP</td>
      </tr>
      <tr>
        <td height="29" align="center" valign="middle" class="txt1">优惠方式：</td>
        <td colspan="3" align="left" valign="middle" class="txt2">享受价格折扣9折</td>
        </tr>
    </table></td>
  </tr>
  
  <%
  	for(int i=0;i<3;i++){
  		BookInfoDAO bi = new BookInfoDAO();
        YouHuiBeanNew youhui3 = al.get(i);
        BookInfo book = bi.getBookInfo(youhui3.getBookid());
   %>
  <tr>
  			<table width="960" border="1" align="center" height="120" cellpadding="0" cellspacing="0" bordercolor="#DDDDDD">
				  <tr height="20">
				    <td width="132" rowspan="2" align="center">
				    <a href="BookJump?id=<%=book.getBook_id() %>&zhegou=good"><img src="images/<%=book.getBook_img() %>"  width="100" height="100" /></a>
				    </td>
				    <td width="200"  align="center" valign="middle">图书简介 </td>
				    <td width="100" align="center" valign="middle">图书名称</td>
				    <td width="100" align="center" valign="middle">出版日期</td>
				    <td width="100" align="center" valign="middle">图书作者</td>
				    <td width="100" align="center" valign="middle">图书装订</td>
				    <td width="50" align="center" valign="middle">图书类型</td>
				    <td width="50" align="center" valign="middle">图书出版社</td>
				    
				  </tr>
				  <tr >
				    <td width="100" height="70"><iframe src="Introduction.jsp" frameborder="0" scrolling="auto" width="200" height="70"></iframe></td>
				    <td width="100"><%=book.getBook_name() %></td>
				    <td width="100"><%=book.getBook_out_date() %></td>
				    
				    <td width="100"><%=book.getBook_author() %></td>
				    <td width="100"><%=book.getBook_zhuangding() %></td>
				    <td width="100"><%=book.getBook_type() %></td>
				    <td width="100"><%=book.getBook_press() %></td>
				    
				  </tr>
			</table>
  </tr>
  <%} %>
  <tr >
  	<td >
  		<jsp:include page="xinshoushanglu.jsp"></jsp:include>
  	</td>
  </tr>
  
  
  <tr>
  	<td>
  		<jsp:include page="footer.jsp"></jsp:include>
  	</td>
  </tr>
</table>
</body>
</html>
