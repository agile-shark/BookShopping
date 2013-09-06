<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新手上路</title>
    
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
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		.link1 {	font-family: "宋体";
			font-size: 11px;
			color: #165485;
			text-decoration: none;
		}
		.txt3 {	font-family: "宋体";
			font-size: 12px;
			font-weight: bold;
			color: #5b84b2;
		}
		.tableborder2 {
			border: 1px solid #dcdcdc;
			font-family: "宋体";
			font-size: 14px;
			font-weight: normal;
			color: #383d41;
		}
		.tdbg {
			background-image: url(image/tdbg.jpg);
			background-repeat: repeat-x;
			background-position: left top;
		}
		
		-->
		</style>
  </head>
  
  <body>
		<table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2" align="center">
		  <tr>
		    <td align="right" valign="top"><table width="958" border="0" cellpadding="0" cellspacing="0">
		      <tr class="tdbg">
		        <td width="20" height="53" align="center" valign="middle" class="txt3"><img src="image/icon1.jpg" alt="icon" width="4" height="17" /></td>
		        <td width="88" align="left" valign="middle" class="txt3">新手上路</td>
		        <td width="20" align="center" valign="middle" class="txt3"><img src="image/icon1.jpg" alt="icon" width="4" height="17" /></td>
		        <td width="142" align="left" valign="middle" class="txt3">手机常识</td>
		        <td width="20" align="center" valign="middle" class="txt3"><img src="image/icon1.jpg" alt="icon" width="4" height="17" /></td>
		        <td width="142" align="left" valign="middle" class="txt3">配送与支付</td>
		        <td width="20" align="center" valign="middle" class="txt3"><img src="image/icon1.jpg" alt="icon" width="4" height="17" /></td>
		        <td width="92" align="left" valign="middle" class="txt3">会员中心</td>
		        <td width="20" align="center" valign="middle" class="txt3"><img src="image/icon1.jpg" alt="icon" width="4" height="17" /></td>
		        <td width="113" align="left" valign="middle" class="txt3">服务保证</td>
		        <td width="20" align="center" valign="middle" class="txt3"><img src="image/icon1.jpg" alt="icon" width="4" height="17" /></td>
		        <td width="261" align="left" valign="middle" class="txt3">联系我们</td>
		      </tr>
		      <tr>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td height="22" align="left" valign="top" class="link1">售后流程</td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">如何分辨原装电池</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">货到付款区域</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">资金管理</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">退换货原则</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">网站故障报告</a></td>
		      </tr>
		      <tr>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td height="22" align="left" valign="top" class="link1">订购流程</td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">如何分辨水货手机</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">配送支付只能查询</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">我的收藏</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">售后服务保证</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">选机咨询</a></td>
		      </tr>
		      <tr>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td height="30" align="left" valign="top" class="link1">订购方式</td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">如何享受全国联保</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">支付方式说明</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">我的订单</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">产品质量保证</a></td>
		        <td height="22" align="center" valign="top"><img src="image/icon2.jpg" alt="icon" width="3" height="9" /></td>
		        <td align="left" valign="top" class="link1"><a href="#" class="link1">投诉与建议</a></td>
		      </tr>
		    </table></td>
		  </tr>
		</table>
</body>
  
</html>
