<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	BookInfoDAO bdao = new BookInfoDAO();
	List<String> book_type = bdao.getBookType();
	List<String> book_press = bdao.getBookPress();
	UserInfo user = (UserInfo)request.getSession().getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link href="css/style.css" rel="stylesheet" type="text/css">

	<script type="text/javascript">
		var xmlhttps;
		function createXmlHttpRequest3() {
			if (window.XMLHttpRequest) {// code for all new browsers
				xmlhttps = new XMLHttpRequest();
			} else if (window.ActiveXObject) {//code for IE5 and IE6
				xmlhttps = new ActiveXObject("Microsoft.XMLHTTP");
			}
			return xmlhttps;
		}
		function getType() {
			createXmlHttpRequest3();
			xmlhttps.onreadystatechange = onready3;
			var search = document.getElementById("searchSelect");
			xmlhttps.open("get", "GetResult?type=" + search.value, false);
			xmlhttps.send(null);
		}
		function onready3() {
			if (xmlhttps.readyState == 4) {
				if (xmlhttps.status == 200) {
					var myxml = xmlhttps.responseXML;
					var books = myxml.getElementsByTagName("book");
					var result = document.getElementById("result");
					result.length=0;
					for ( var i = 0; i < books.length; i++) {
						var bookcode = books[i].firstChild.firstChild.data;
						var bookvalue = books[i].lastChild.firstChild.data;
						var option = document.createElement("option");
						option.value = bookcode;
						option.text = bookvalue;
						try {
							result.add(option, null); // standards compliant
						} catch (ex) {
							result.add(option); // IE only
						}
					}
				}
			}
		}
	</script>
  </head>
  
  <body>
<div class="block clearfix">
 <div class="f_l"><a href="index.jsp"><img src = "img/logo.png"></a></div>
 <div class="f_r log">
   <ul>
   <li class="userInfo">
   <script type="text/javascript" src="js/transport.js"></script><script type="text/javascript" src="js/utils.js"></script>   <font size="2px">
   <%
   		if(user != null) {
   			%>
   				您好,<font color="red">
   			<%=user.getUsername() %>
   			</font>,欢迎您的回来！
   			<%
   			
   		} else {
   			%>
   			 欢迎光临酷星书店&nbsp;&nbsp;&nbsp;
   			 <a href="login.jsp?type=top"><img src = "img/bnt_log.gif"></a>
 			<a href="GetProvince"><img src = "img/bnt_reg.gif"></a>
   			<%
   		}
   %>
 </font>
   </li>
      <li id="topNav" class="clearfix">
      			<%
      				if(request.getSession().getAttribute("user")!=null) {
      					%>
      					<a href="Gouwuche?type=showMyCar" target="parent">查看购物车</a>
      					|
                            
                            <a href="Frameset.jsp">个人中心</a>
                         |
                            <a href="ZhuXiao">系统注销</a>
      					<%
      				} else {
      					%>
      					查看购物车
      					|
                            	个人中心
                         |
                            	系统注销
      					<%
      				}
      			%>
      			|
                            <a href="Youhui?activity_type=tuangou">团购中心</a>
                
   <div class="topNavR"></div>
   </li>
   </ul>
 </div>
</div>
<div class="blank"></div>
<div id="mainNav" class="clearfix">
  <a href="index.jsp" class="cur">酷星首页<span></span></a>
    <a href="More_BookInfo?type=best">精品书籍<span></span></a>
   <a href="More_BookInfo?type=hot">畅销书籍<span></span></a>
   <a href="More_BookInfo?type=new">新书推荐<span></span></a>
   <a href="More_BookInfo?type=1">所有图书<span></span></a>
   <a href="YouhuiM?activity_type=tuangou">团购图书<span></span></a>
   <a href="YouhuiM?type=youhui&activity_type=youhui">优惠活动<span></span></a>
   <a href="liuyan.jsp">酷星留言板<span></span></a>
   <a href="contact.jsp">联系我们<span></span></a>
   <a href="admin/index.jsp" target="_blank">进入后台<span></span></a>
 </div>
<div id="search" class="clearfix">
  <form id="searchForm" name="searchForm" method="get" action="top_search"  class="f_r" style="_position:relative; top:5px;">
    <select name="category" id="searchSelect" class="B_input" onchange="getType()">
    	<option value="1">选择查询类型</option>
    	<option value="book_type">按图书类型查询</option>
    	<option value="book_press">按图书出版社查询</option>
    </select>
    <select id="result" name="searchType">
    	<option value="1">选择你要选择的查询对象</option>
    </select>
   
   <input name="imageField" type="submit" value="" class="go" style="cursor:pointer;">
   <a href="highSearch.jsp"><font size="2px">高级搜索</font></a>
   </form>
</div>
</body>
</html>
