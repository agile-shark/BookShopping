<%@ page language="java" import="java.util.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//得到管理员的信息 
AdminBean ab = (AdminBean)request.getSession().getAttribute("admin");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="<%=basePath%>admin/js/prototype.lite.js" type="text/javascript"></script>
	<script src="<%=basePath%>admin/js/moo.fx.js" type="text/javascript"></script>
	<script src="<%=basePath%>admin/js/moo.fx.pack.js" type="text/javascript"></script>
	<style>
	body {
		font:12px Arial, Helvetica, sans-serif;
		color: #000;
		background-color: #EEF2FB;
		margin: 0px;
	}
	#container {
		width: 182px;
	}
	H1 {
		font-size: 12px;
		margin: 0px;
		width: 182px;
		cursor: pointer;
		height: 30px;
		line-height: 20px;	
	}
	H1 a {
		display: block;
		width: 182px;
		color: #000;
		height: 30px;
		text-decoration: none;
		moz-outline-style: none;
		background-image: url(<%=basePath%>admin/images/menu_bgS.gif);
		background-repeat: no-repeat;
		line-height: 30px;
		text-align: center;
		margin: 0px;
		padding: 0px;
	}
	.content{
		width: 182px;
		height: 26px;
		
	}
	.MM ul {
		list-style-type: none;
		margin: 0px;
		padding: 0px;
		display: block;
	}
	.MM li {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 12px;
		line-height: 26px;
		color: #333333;
		list-style-type: none;
		display: block;
		text-decoration: none;
		height: 26px;
		width: 182px;
		padding-left: 0px;
	}
	.MM {
		width: 182px;
		margin: 0px;
		padding: 0px;
		left: 0px;
		top: 0px;
		right: 0px;
		bottom: 0px;
		clip: rect(0px,0px,0px,0px);
	}
	.MM a:link {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 12px;
		line-height: 26px;
		color: #333333;
		background-image: url(<%=basePath%>admin/images/menu_bg1.gif);
		background-repeat: no-repeat;
		height: 26px;
		width: 182px;
		display: block;
		text-align: center;
		margin: 0px;
		padding: 0px;
		overflow: hidden;
		text-decoration: none;
	}
	.MM a:visited {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 12px;
		line-height: 26px;
		color: #333333;
		background-image: url(<%=basePath%>admin/images/menu_bg1.gif);
		background-repeat: no-repeat;
		display: block;
		text-align: center;
		margin: 0px;
		padding: 0px;
		height: 26px;
		width: 182px;
		text-decoration: none;
	}
	.MM a:active {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 12px;
		line-height: 26px;
		color: #333333;
		background-image: url(<%=basePath%>admin/images/menu_bg1.gif);
		background-repeat: no-repeat;
		height: 26px;
		width: 182px;
		display: block;
		text-align: center;
		margin: 0px;
		padding: 0px;
		overflow: hidden;
		text-decoration: none;
	}
	.MM a:hover {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 12px;
		line-height: 26px;
		font-weight: bold;
		color: #006600;
		background-image: url(<%=basePath%>admin/images/menu_bg2.gif);
		background-repeat: no-repeat;
		text-align: center;
		display: block;
		margin: 0px;
		padding: 0px;
		height: 26px;
		width: 182px;
		text-decoration: none;
	}
	</style>
</head>

<body>
<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
  <tr>
    <td width="182" valign="top"><div id="container">
      <h1 class="type"><a href="javascript:void(0)">书籍管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=basePath%>admin/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="GetBookList" target="main">书籍列表</a></li>
          <li><a href="<%=basePath%>admin/addbooklist.jsp" target="main">添加新书</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">订单管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=basePath%>admin/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="<%=basePath %>admin/dingdanlist.jsp" target="main">订单列表</a></li>
          <li><a target="main" href="<%=basePath %>admin/unconfirmorder.jsp">未确认订单</a></li>
          <li><a href="<%=basePath %>admin/unpayedorder.jsp" target="main">未付款订单</a></li>
          <li><a href="<%=basePath %>admin/unoutgoodsorder.jsp" target="main">未发货列表</a></li>
          <li><a href="<%=basePath %>admin/successorder.jsp" target="main">成功订单列表</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">促销管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=basePath%>admin/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="<%=basePath %>admin/tuangou.jsp" target="main">团购管理</a></li>
          <li><a href="<%=basePath %>admin/youhui.jsp" target="main">优惠活动</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">用户管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=basePath%>admin/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="<%=request.getContextPath()%>/GetUserList" target="main">会员管理</a></li>
          <li><a href="<%=request.getContextPath()%>/GetMessageList" target="main">留言管理</a></li>
          <li><a href="<%=request.getContextPath()%>/GetEvaList" target="main">评论管理</a></li>
        </ul>
      </div>
    </div>
        <h1 class="type"><a href="javascript:void(0)">报表统计</a></h1>
      <div class="content">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="<%=basePath%>admin/images/menu_topline.gif" width="182" height="5" /></td>
            </tr>
          </table>
        <ul class="MM">
            <li><a href="admin/UserStat.jsp" target="main">用户统计</a></li>
          <li><a href="OrderFormStats" target="main">订单统计</a></li>
          <li><a href="OrderFormStat" target="main">销售概况</a></li>
          <li><a href="OrderFormPaiHangStats" target="main">销售排行</a></li>
        </ul>
      </div>
      <%
      	if(ab.getAdminname().equals("liangyongxingadmin")) {
      		%>
      		  <h1 class="type"><a href="javascript:void(0)">权限管理</a></h1>
		      <div class="content">
		          <table width="100%" border="0" cellspacing="0" cellpadding="0">
		            <tr>
		              <td><img src="<%=basePath%>admin/images/menu_topline.gif" width="182" height="5" /></td>
		            </tr>
		          </table>
		        <ul class="MM">
		            <li><a href="<%=request.getContextPath()%>/GetAdminList" target="main">管理员列表</a></li>
		          <li><a href="<%=request.getContextPath()%>/admin/addadmin.jsp" target="main">添加管理员</a></li>
		        </ul>
		      </div>
      		<%
      	}
      %>
      
     <h1 class="type"><a href="javascript:void(0)">个人管理</a></h1>
      <div class="content">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="<%=basePath%>admin/images/menu_topline.gif" width="182" height="5" /></td>
            </tr>
          </table>
        <ul class="MM">
            <li><a href="http://www.865171.cn" target="main">修改口令</a></li>
          <li><a href="http://www.865171.cn" target="main">退出系统</a></li>
        </ul>
      </div>
        <script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 400}
		);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
        </td>
  </tr>
</table>
  </body>
</html>
