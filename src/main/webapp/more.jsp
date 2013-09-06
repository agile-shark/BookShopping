<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//得到book列表
List<BookInfo> list = (List<BookInfo>)request.getAttribute("booklist");
String type = request.getParameter("type");
String book_type = "book_is_best";
Common common = new Common();
//初始化开始显示的页数 
int pageNow = 1;
//得到该要显示的页面数
try{
	String s_pageNow = request.getAttribute("pageNow").toString();
	if(s_pageNow!=null){
		pageNow = Integer.parseInt(s_pageNow);
	}
	//System.out.println(s_pageNow);
}catch(Exception ex){}

//得到总共的页数
int pageCount = 1;
pageCount = common.getPageCount(10,type);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'more.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/moreStyle.css">


  </head>
  
  <body>
    <center>
        <div id="more">
            <div id="top">
            	<font id="title">
           		<%
	    			if(type.equals("book_is_best")){
	    				%>
	    				 <span>精品推荐</span>
	    				<%
	    			} else if(type.equals("book_is_new")) {
	    				%>
	    				 <span>最新书籍</span>
	    				<%
	    			} else if(type.equals("book_is_hot")){
	    				%>
	    				 <span>畅销书籍</span>
	    				<%
	    			} else if(type.equals("计算机")){
	    				%>
	    				 <span>计算机类书籍</span>
	    				<%
	    			} 
	    			else {
	    				%>
	    				 <span>所有书籍</span>
	    				<%
	    			}
    			%>
            	</font>
            </div>
            
            <div id="center" class="centerPadd">
             <div class="clearfix goodsBox" style="border:none;">
            	 	<%
                  		for(int i=0;i<list.size();i++){
                  			BookInfo bi = list.get(i);
                  	%>
                  	<div class="goodsItem">
                       <a href="BookJump?id=<%=bi.getBook_id() %>"><img src="images/<%=bi.getBook_img() %>" alt="<%=bi.getBook_name() %>" class="goodsimg"></a><br>
                       <p><a href="BookJump?id=<%=bi.getBook_id() %>" title=""><%=bi.getBook_name() %></a></p>
                                                               本店价<font class="shop_s">:￥<%=bi.getBook_market_price() %>元</font><br>
                       <a href="BookJump?id=<%=bi.getBook_id() %>">收藏</a> |
                       <a href="BookJump?id=<%=bi.getBook_id() %>">购买</a>
                       </div>
                    <%} %>
            </div>
            </div>
            <div id="bottom">
            
            	<span class="f_l f6" style="margin-right:10px;">总计 <b><%=common.getBookCount(type) %></b>  个记录</span>
  
  
   <a href="Page_GetBook?type=<%=type %>&pageNow=<%=1 %>">【首页】|</a>  
  	<%
		if(pageNow>1){
			%>
				<a href="Page_GetBook?type=<%=type %>&pageNow=<%=(pageNow-1) %>">【上一页】|</a>
			<%
		}  		
  	 %>
  		<%
  			for(int i=1;i<=pageCount;i++){
  		%>
                      <a href="Page_GetBook?type=<%=type %>&pageNow=<%=i %>">【<%=i %>】|</a>
        <%}%>
     <%
		if(pageNow<pageCount){
			%>
				<a href="Page_GetBook?type=<%=type %>&pageNow=<%=(pageNow+1) %>">【下一页】|</a>
			<%
		}  		
		if(pageNow<=pageCount){
			%>
				<a href="Page_GetBook?type=<%=type %>&pageNow=<%=pageCount %>">【尾页】|</a>
			<%
		}
  	 %>
  	<font color="#0066CC"> 当前显示第 【<%=pageNow %>】 页</font>
            
            </div>
        </div>
    </center><br>
  </body>
</html>
