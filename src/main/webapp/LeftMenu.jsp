<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <link  href="css/LeftMenu.css" type="text/css" rel="Stylesheet"/>
</head>
<body>
<div id="bigDiv">
    <div class="Div1">
       <a href ="welcome.jsp" target="right"><img alt="欢迎页" src="images/321_06.jpg" /> 欢迎页</a>
       <a href ="personInformation.jsp" target="right"><img alt="用户信息" src="images/321_10.jpg" /> 用户信息</a>
       <a href ="dingdan.jsp" target="right"><img alt="我的订单" src="images/321_15.jpg" /> 我的订单</a>
       <a href ="recieverInformation.jsp" target="right"><img alt="收货地址" src="images/321_19.jpg" /> 收货地址</a>
       <a href ="collection.jsp" target="right"><img alt="我的收藏" src="images/321_21.jpg" /> 我的收藏</a>
       <a href ="liuyan2.jsp" target="right"><img alt="我的留言" src="images/321_24.jpg" /> 我的留言</a>
       <a href ="quehuo.jsp" target="right"><img alt="缺货登记" src="images/321_30.jpg" /> 缺货登记</a>
       <a href ="mypinglun.jsp" target="right"><img alt="我的评论" src="images/321_38.jpg" /> 我的评论</a>
    </div>
    <div id="footer"><a href="SafeExit" target="top"><img alt ="返回首页面" src="images/safeExit.png"/></a></div>
</div>
</body>
</html>
