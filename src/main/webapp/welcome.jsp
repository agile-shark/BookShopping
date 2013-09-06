<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserInfo userinfo = (UserInfo)request.getSession().getAttribute("user");
PersonalDAO personal = new PersonalDAO();
String userid = userinfo.getUserid()+"";
System.out.println(userid);
//得到指定用户下的订单 
int num = personal.getPersonalBuyOrder(userid);
if(num==0) {
	num = 0;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>欢迎页</title>
    <link  href="css/welcome.css" type="text/css" rel="Stylesheet"/>
    <style type="text/css">
    	.myimage{
    		position:absolute;
    		margin-left:600px;
    	}
    </style>
</head>
<body>
<div id="bigDiv">
	
    <div id="welDiv">
       <div id="fontDiv"><span id="fontStyle"><b><span><%=userinfo.getUsername() %></span> 欢迎您回到 酷星商城</b></span></div>
       <div class="myimage"><img alt="用户头像" src="<%=userinfo.getUserimage() %>" width="80px" height="80px"></div>
    </div>
    
    <div class="preTime">您的注册时间: <%=userinfo.getRegistdate() %></div>
    <div class="preTime">您的等级是 注册用户,您还差 
    <%
    	if(num == 0){
    		%>
    		10000
    		<%
    	} else {
    		int n = 10000 - Integer.parseInt(userinfo.getUser_integration());
    		%>
    		<%=n %>
    		<%
    	}
    %>
     积分达到 vip</div>
    <div class="preTime">您还没有通过邮件认证  <a href="#" style="color:#006bd0;">点此发送认证邮件</a></div>
    <div id="user"><img alt ="" src="images/user.png" />用户中心公告</div>
    <div style="height :28px;"></div>
    <div class="left">
       <div class="leftbg"><b><span>您的账户</span></b></div>
       <div class="preTime">余额：￥0.00元</div>
       <div class="preTime">红包：共计0个，价值￥0.00元</div>
       <%
    	if(num == 0){
    		%>
    		<div class="preTime">积分： 【0】 积分</div>
    		<%
    	} else {
    		%>
    		<div class="preTime">积分： 【<%=userinfo.getUser_integration() %>】 积分</div>
    		<%
    	}
    %>
       
    </div>
    <div class="left">
       <div class="leftbg"><b><span>用户提醒</span></b></div>
       <div class="preTime">您最近30天内提交了 【<%=num %>】 个订单</div>
    </div>
</div>
</body>
</html>