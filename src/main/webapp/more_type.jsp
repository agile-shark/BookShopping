<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//得到book列表
List<BookInfo> list = (List<BookInfo>)request.getAttribute("booklist");
String type = request.getParameter("type");
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
String totalPage = request.getParameter("pageCount");
if(totalPage == null ){
	pageCount = 1;
} else {
	pageCount = Integer.parseInt(totalPage);
}
//得到书籍的总记录数
int totalSize = 0;
String allSize = request.getParameter("allSize");
if(allSize == null ){
	totalSize = 0;
} else {
	totalSize = Integer.parseInt(allSize);
}
//将得到的sql语句传入到分页里，进行分页显示
String sql = (String)request.getAttribute("sql");
System.out.println("进了more_type.jsp页面里的sql语句："+sql);
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
	    			if(type.equals("leixing")){
	    				%>
	    				 <span>以图书类型进行分类</span>
	    				<%
	    			} else if(type.equals("jiage")) {
	    				%>
	    				 <span>以图书价格进行分类</span>
	    				<%
	    			} else if(type.equals("chubanshe")){
	    				%>
	    				 <span>以图书出版社进行分类</span>
	    				<%
	    			} else {
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
            
            	<span class="f_l f6" style="margin-right:10px;">总计 <b><%=totalSize %></b>  个记录</span>
  
  
   <a href="SearchBookInfo?sql=<%=sql %>&pageNow=<%=1 %>&totalSize=<%=totalSize %>&pageCount=<%=pageCount %>">【首页】|</a>  
  	<%
		if(pageNow>1){
			%>
				<a href="SearchBookInfo?sql=<%=sql %>&pageNow=<%=(pageNow-1) %>&totalSize=<%=totalSize %>&pageCount=<%=pageCount %>">【上一页】|</a>
			<%
		}  		
  	 %>
  		<%
  			for(int i=1;i<=pageCount;i++){
  		%>
                      <a href="SearchBookInfo?sql=<%=sql %>&pageNow=<%=i %>&totalSize=<%=totalSize %>&pageCount=<%=pageCount %>">【<%=i %>】|</a>
        <%}%>
     <%
		if(pageNow<pageCount){
			%>
				<a href="SearchBookInfo?sql=<%=sql %>&pageNow=<%=(pageNow+1) %>&totalSize=<%=totalSize %>&pageCount=<%=pageCount %>">【下一页】|</a>
			<%
		}  		
		if(pageNow<=pageCount){
			%>
				<a href="SearchBookInfo?sql=<%=sql %>&pageNow=<%=pageCount %>&totalSize=<%=totalSize %>&pageCount=<%=pageCount %>">【尾页】|</a>
			<%
		}
  	 %>
  	<font color="#0066CC"> 当前显示第 【<%=pageNow %>】 页</font>
            
            </div>
        </div>
    </center><br>
  </body>
</html>
