<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<BookInfo> al_best = new ArrayList<BookInfo>();
ArrayList<BookInfo> al_new = new ArrayList<BookInfo>();
ArrayList<BookInfo> al_hot = new ArrayList<BookInfo>();
BookInfoDAO bookinfo = new BookInfoDAO();
al_best = (ArrayList<BookInfo>)bookinfo.getBookList("book_is_best");
al_new = (ArrayList<BookInfo>)bookinfo.getBookList("book_is_new");
al_hot = (ArrayList<BookInfo>)bookinfo.getBookList("book_is_hot");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'right.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/my.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
	 <div id = "content_1">
	 <div class = "topNavigation"></div>
            <div class="upbookinfoConten">
            <%
            		for(int i=0;i<5;i++){ 
                  		BookInfo bi = new BookInfo(); 
               			bi = al_best.get(i); 
               			String bookname = bi.getBook_name(); 
               			 
               			if(bookname.length()>=7) { 
               				bookname = bookname.substring(0,6) + ".."; 
               			} 
                %> 
                   <div class="bookinfo"> 
                        <div class="bookimage"><a href="BookJump?id=<%=bi.getBook_id() %>"><img height="84" width="68" src="images/<%=bi.getBook_img() %>"></a>
                        </div> 
                            <div class="text"> 
                                <font size="2"><a href="BookJump?id=<%=bi.getBook_id() %>"><%=bookname %></a></font><br> 
                                <font color="#ff0000" size="2">￥ <%=bi.getBook_market_price() %></font>
                             </div>
                         </div>
                         <%} %>
                    </div>
            <div class = "downContent">
                
              
                
                    <div class = "downbookinfoConten">
                    <%
                   		for(int i=5;i<10;i++){
                   			BookInfo bi = new BookInfo();
                			bi = al_best.get(i);
                			String bookname = bi.getBook_name();
                			
                			if(bookname.length()>=7) {
                				bookname = bookname.substring(0,6) + "..";
                			}
                    %>
                       <div class="bookinfo">
                        <div class="bookimage"><a href ="BookJump?id=<%=bi.getBook_id()%>"><img src="images/<%=bi.getBook_img() %>" width="68" height="84" /></a></div>
                            <div class="text">
                                <font size="2px"><a href = "BookJump?id=<%=bi.getBook_id()%>"><%=bookname %></a></font><br />
                                <font color="#FF0000" size="2px">￥ <%=bi.getBook_market_price() %>元</font>
                            </div>
                   		 </div>
                    <%} %>
                    </div>
                </div> 
            <div class="more"><a href="More_BookInfo?type=best"><img src="images/more.jpg" /></a></div>
        </div>
        
        
        
       <div id = "content_2">
            <div class = "topNavigation"></div>
            <div class = "downContent">
                <div class = "upbookinfoConten">
                <%
                	for(int i=0;i<5;i++){
                		BookInfo ni = new BookInfo();
                		ni = al_new.get(i);
                		String bookname = ni.getBook_name();
                		int n = bookinfo.getBookNameLength(bookname);
                		//System.out.println(n);s
               			if(n>7) {
               				bookname = bookname.substring(0,7) + "..";
               				//bookname = bookinfo.getBookName(bookname,n);
               			}
                %>
                   <div class="bookinfo">
                        <div class="bookimage"><a href ="BookJump?id=<%=ni.getBook_id()%>"><img src="images/<%=ni.getBook_img() %>" width="68" height="84" /></a></div>
                            <div class="text">
                                <font size="2px"><a href = "BookJump?id=<%=ni.getBook_id()%>"><%=bookname %></a></font><br />
                                <font color="#FF0000" size="2px">￥ <%=ni.getBook_market_price() %>元</font>
                            </div>
                    </div>
                 <%} %>
                </div>
                
                
                    <div class = "downbookinfoConten">
                    <%
                   		for(int i=5;i<10;i++){
                   			BookInfo ni = new BookInfo();
                			ni = al_new.get(i);
                			String bookname = ni.getBook_name();
                			
                			if(bookname.length()>=7) {
                				bookname = bookname.substring(0,6) + "..";
                			}
                    %>
                       <div class="bookinfo">
                        <div class="bookimage"><a href = "BookJump?id=<%=ni.getBook_id() %>"><img src="images/<%=ni.getBook_img() %>" width="68" height="84" /></a></div>
                            <div class="text">
                                <font size="2px"><a href = "BookJump?id=<%=ni.getBook_id()%>"><%=bookname %></a></font><br />
                                <font color="#FF0000" size="2px">￥ <%=ni.getBook_market_price() %>元</font>
                            </div>
                   		 </div>
                    <%} %>
                    </div>
                </div> 
            <div class="more"><a href="More_BookInfo?type=new"><img src="images/more.jpg" /></a></div>
        </div>
        
        
        
        
        
        <div id = "content_3">
            <div class = "topNavigation"></div>
            <div class = "downContent">
                <div class = "upbookinfoConten">
                <%
                	for(int i=0;i<5;i++){
                		BookInfo hi = new BookInfo();
                		hi = al_hot.get(i);
                		String bookname = hi.getBook_name();
                		int n = bookinfo.getBookNameLength(bookname);
                		//System.out.println(n);s
               			if(n>7) {
               				bookname = bookname.substring(0,7) + "..";
               				//bookname = bookinfo.getBookName(bookname,n);
               			}
                %>
                   <div class="bookinfo">
                        <div class="bookimage"><a href = "BookJump?id=<%=hi.getBook_id() %>"><img src="images/<%=hi.getBook_img() %>" width="68" height="84" /></a></div>
                            <div class="text">
                                <font size="2px"><a href = "BookJump?id=<%=hi.getBook_id()%>"><%=bookname %></a></font><br />
                                <font color="#FF0000" size="2px">￥ <%=hi.getBook_market_price() %>元</font>
                            </div>
                    </div>
                 <%} %>
                </div>
                
                
                    <div class = "downbookinfoConten">
                    <%
                   		for(int i=5;i<10;i++){
                   			BookInfo hi = new BookInfo();
                			hi = al_hot.get(i);
                			String bookname = hi.getBook_name();
                			
                			if(bookname.length()>=7) {
                				bookname = bookname.substring(0,6) + "..";
                			}
                    %>
                       <div class="bookinfo">
                        <div class="bookimage"><a href = "BookJump?id=<%=hi.getBook_id() %>"><img src="images/<%=hi.getBook_img() %>" width="68" height="84" /></a></div>
                            <div class="text">
                                <font size="2px"><a href = "BookJump?id=<%=hi.getBook_id()%>"><%=bookname %></font><br />
                                <font color="#FF0000" size="2px">￥ <%=hi.getBook_market_price() %>元</font>
                            </div>
                   		 </div>
                    <%} %>
                    </div>
                </div> 
            <div class="more"><a href="More_BookInfo?type=hot"><img src="images/more.jpg" /></a></div>
        </div>
</body>
</html>
