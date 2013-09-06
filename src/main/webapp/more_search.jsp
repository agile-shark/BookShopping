<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.util.*,com.shxt.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
PagingBean pb = (PagingBean)request.getAttribute("pb");
String mysql = (String)request.getAttribute("mysql");
List<Map<String,Object>> list = pb.getList();
System.out.println("list         "+list.size());
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'more_search.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/moreStyle.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
 <body>
 <table align="center" cellspacing="0" cellpadding="0" bgcolor="#F1F8FE">
  	<tr><td colspan="2"><jsp:include page="top.jsp"></jsp:include></td></tr>
  	<tr><td><jsp:include page="left.jsp"></jsp:include></td>
  	<td valign="top">
  	<table>
  	<tr><td>
        <div>
            <div id="top">
            	<font id="title">
           		<span>高级搜索结果</span>
            	</font>
            </div>
            </td></tr>
            <tr><td align="left">
           <%if(list.size()>=0){ %>
 		<div id="center" class="centerPadd">
             <div class="clearfix goodsBox" style="border:none;">
             
            	 	<%
            	 	
                  		for(int i=0;i<list.size();i++){
                  	%>
                  	<div class="goodsItem">
                       <a href=""><img src="images/<%=list.get(i).get("BOOK_IMG") %>" alt="<%=list.get(i).get("BOOK_NAME") %>" class="goodsimg"></a><br>
                       <p><a href="" title=""><%=list.get(i).get("BOOK_NAME") %></a></p>
                                                               本店价<font class="shop_s">:￥<%=list.get(i).get("BOOK_USER_PRICE") %>元</font><br>
                       <a href="">收藏</a> |
                       <a href="">购买</a>
                       </div>
                    <%}%>
            </div>
            		<%}else if(list.size()==0){ %>
            		 <div align="center" valign="center">没有找到你要查询的书籍！请重新查询</div>
                    <%} %>
           </td> </tr>
           <tr><td>
            </div>
          <div id="bottom">
            
            	<span class="f_l f6" style="margin-right:10px;">总计 <b><%=pb.getRowall() %></b>  个记录</span>
  
  
   <a href="More_searchPaging?pagenow=1&sql=<%=mysql %>">【首页】|</a>  
   				<%if(pb.getPagenow()>1){ %>
				<a href="More_searchPaging?pagenow=<%=pb.getPagenow()-1 %>&sql=<%=mysql %>">【上一页】|</a>
				<%} %>
				<%for(int i = 0;i<5;i++){
					if(pb.getPagenow()+i<=pb.getPageall()){
				 %>
                      <a href="More_searchPaging?pagenow=<%=pb.getPagenow()+i %>&sql=<%=mysql %>">【<%=pb.getPagenow()+i %>】|</a>
                <%} }
                	if(pb.getPagenow()<pb.getPageall()){
                %>
				<a href="More_searchPaging?pagenow=<%=pb.getPagenow()+1 %>&sql=<%=mysql %>">【下一页】|</a>
				<%} %>
				<a href="More_searchPaging?pagenow=<%=pb.getPageall() %>&sql=<%=mysql %>">【尾页】|</a>
  	<font color="#0066CC"> 当前显示第 【<%=pb.getPagenow() %>】 页</font>
            
            </div>
            </td></tr>
            </table>
        </div>
    <br>
    </td></tr></table>
  </body>
</html>
