<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<BookInfo> bi = (ArrayList<BookInfo>)request.getAttribute("booklist");
//得到传过来的图书总页数
int pageCount = Integer.parseInt(request.getParameter("pageCount"));
//得到图书的总记录数
int pageSize = Integer.parseInt(request.getParameter("pageSize"));
//开始的时候应该是第一页
int pageNow = 1;
String s_pageNow = request.getParameter("pageNow");
if(s_pageNow==null){
	pageNow = 1;
} else {
	pageNow = Integer.parseInt(s_pageNow);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'booklist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.tushu{
			font-size: 12px;
			font-family: 宋体;
		}
		.weizhi{
			padding-left: 0px;
			padding-right:610px;
		}
	</style>

	<script type="text/javascript">
		function doUpdate() {
			var selects = document.getElementById("select");
			window.open("GetBookList?pageNow="+selects.value,"_self");
		}
		function checkAll() {
			var books = document.getElementsByName("bookisbn");
			var selectAll = document.getElementById("selectAll");
			for(var i=0;i<books.length;i++) {
				books[i].checked = selectAll.checked;
			}
		}
	</script>
  </head>
  
  <body>
    <table width="1140" border="10" bordercolor="#DDEEF2">
  <tr>
    <td align="left" height="50px">&nbsp; <b>酷星网管理中心</b>——<font color="#9CACAF"><b>商品列表</b></font></td>
  </tr>
  <tr>
    <td align="left" height="40px"> &nbsp;&nbsp;
    <form action="GetBookList?type=search" method="post">
    <img src="<%=basePath%>admin/img/icon_search.gif" width="26" height="22" /> &nbsp;
    	<select name="booktype">
        	<option value="0">图书所有类型</option>
             <option value="数学">数学</option>
            <option value="英语">英语</option>
            <option value="计算机">计算机</option>
            <option value="金融管理">金融管理</option>
            <option value="法律">法律</option>
        </select> &nbsp;
        <select name="bookpress">
        	<option value="0">图书出版社</option>
             <option value="机械工业大学出版社">机械工业大学出版社</option>
            <option value="同济大学出版社">同济大学出版社</option>
            <option value="清华大学出版社">清华大学出版社</option>
            <option value="北京大学出版社">北京大学出版社</option>
            <option value="新东方出版社">新东方出版社</option>
        </select> &nbsp;
         <select name="bookbuy">
        	<option value="0">全部书籍</option>
             <option value="book_is_new">新书推荐</option>
            <option value="book_is_best">精品书籍</option>
            <option value="book_is_hot">畅销书籍</option>
            <option value="book_is_youhui">优惠书籍</option>
            <option value="book_is_tuangou">团购书籍</option>
        </select> &nbsp;&nbsp;
        <input type="submit" value="搜  索" style="cursor:pointer;"/>
        </form>
    </td>
   
  </tr>
  <tr>
    <td align="left">
    <form action="GetBookList?type=deleteAll" method="post">
    <table width="1140" border="1" cellpadding="0" cellspacing="0" bordercolor="#EEF8F9">
    
      <tr align="center" bgcolor="#BBDDE5" height="30px">
        <td width="150px"><font size="2" color="#192E32"><input type="checkbox" id="selectAll" onclick="checkAll()"/>编号 </font></td>
        <td width="150px"><font size="2" color="#192E32">书籍名称 </font></td>
        <td><font size="2" color="#192E32">货号 </font></td>
        <td><font size="2" color="#192E32">价格 </font></td>
        <td><font size="2" color="#192E32">下架 </font></td>
        <td><font size="2" color="#192E32">新品 </font></td>
        <td><font size="2" color="#192E32">精品 </font></td>
        <td><font size="2" color="#192E32">热卖 </font></td>
        <td><font size="2" color="#192E32">优惠 </font></td>
        <td><font size="2" color="#192E32">团购 </font></td>
        <td><font size="2" color="#192E32">库存 </font></td>
        <td><font size="2" color="#192E32">操作 </font></td>
      </tr>
     
     <%
     	for(int i=0;i<bi.size();i++){
     		BookInfo book = bi.get(i);
     		%>
     		<tr class="tushu" height="30px">
	        <td align="center"><input type="checkbox" name="bookisbn" /><input type="hidden" name="booksisbn" value="<%=book.getBook_isbn() %>"/><%=book.getBook_isbn() %></td>
	        <td width="20px"><%=book.getBook_name() %></td>
	        <td>KXW000<%=book.getBook_id() %></td>
	        <td><%=book.getBook_user_price() %></td>
	        <%
	        	if(book.getBook_is_delete()==1){
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/yes.gif" width="14" height="14" /></td>
	        		<% 
	        	} else {
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/no.gif" width="14" height="14" /></td>
	        		<% 
	        	}
	        %>
	         <%
	        	if(book.getBook_is_new()==1){
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/yes.gif" width="14" height="14" /></td>
	        		<% 
	        	} else {
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/no.gif" width="14" height="14" /></td>
	        		<% 
	        	}
	        %>
	         <%
	        	if(book.getBook_is_best()==1){
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/yes.gif" width="14" height="14" /></td>
	        		<% 
	        	} else {
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/no.gif" width="14" height="14" /></td>
	        		<% 
	        	}
	        %>
	         <%
	        	if(book.getBook_is_hot()==1){
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/yes.gif" width="14" height="14" /></td>
	        		<% 
	        	} else {
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/no.gif" width="14" height="14" /></td>
	        		<% 
	        	}
	        %>
	         <%
	        	if(book.getBook_is_youhui()==1){
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/yes.gif" width="14" height="14" /></td>
	        		<% 
	        	} else {
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/no.gif" width="14" height="14" /></td>
	        		<% 
	        	}
	        %>
	         <%
	        	if(book.getBook_is_tuangou()==1){
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/yes.gif" width="14" height="14" /></td>
	        		<% 
	        	} else {
	        		%>
	        		<td align="center"><img src="<%=basePath%>admin/img/no.gif" width="14" height="14" /></td>
	        		<% 
	        	}
	        %>
	        <td align="center">
	        	<%=book.getBook_num() %>
	        </td>
	        <td align="center">
	        <a href="GetBookList" onclick="window.open('http://localhost:8080/BookShopping/admin/showbookinfo.jsp?bookid=<%=book.getBook_id() %>','orderDetail','width=704,height=700,top=100,left=100,scrollbars=1');"><img src="<%=basePath%>admin/img/icon_view.gif" width="16" height="16" alt="查看" style="cursor:pointer;"/></a> &nbsp;
	        <a href="<%=basePath%>admin/editbooklist.jsp?bookid=<%=book.getBook_id() %>"><img src="<%=basePath%>admin/img/icon_edit.gif" width="16" height="16" alt="编辑" style="cursor:pointer;"/></a> &nbsp;
	        <a href="GetBookList?bookid=<%=book.getBook_id() %>"><img src="<%=basePath%>admin/img/icon_trash.gif" width="16" height="16" alt="删除" style="cursor:pointer;" onclick="return window.confirm('是否真的要将此商品放到回收站里？')" /></a>
	        </td>
	      </tr>
     		<%
     	}
     %>
      
      <tr height="40px">
        <td colspan="12" align="right"><font color=#2F5275 size="2">
        <%
        	if(bi.size()!=0){
        		%>
        		<span class="weizhi"><input type="submit" value="下 线" /></span>
        		<%
        	}
        %>
        总计<%=pageSize %>个记录 &nbsp;分为<%=pageCount %>页 &nbsp;当前第<%=pageNow %>页 &nbsp;| &nbsp;
        <a href="GetBookList?pageNow=1">首页</a> 
        <%
        	if(pageNow > 1){
        		%>
        		 <a href="GetBookList?pageNow=<%=pageNow-1 %>">上一页</a> 
        		<%
        	}
        %>
       <%
       		if(pageNow < pageCount) {
				%>
				<a href="GetBookList?pageNow=<%=pageNow+1 %>">下一页</a> 
				<%       		
       		}
       %>
        
        <a href="GetBookList?pageNow=<%=pageCount %>">末页</a> </font>
        <select id="select" onchange="doUpdate()">
        	<%
        		for(int i=1;i<=pageCount;i++){
        			%>
        			<option value="<%=i %>"><%=i %></option>
        			<%
        		}
        	%>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
  </body>
</html>
