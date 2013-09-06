<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
BookInfoDAO book = new BookInfoDAO();
//得到从servlet传过来的值
ArrayList<BookInfo> booklist = (ArrayList<BookInfo>)request.getAttribute("bookInfo");

int num = 0;
String n = request.getParameter("num");
if(n!=null) {
	num = Integer.parseInt(n);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addyouhuibook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.ziti{
			font-size: 13px;
		}
	</style>
	
	<script type="text/javascript">
		function selectbooks() {
			var selectAll = document.getElementById("selectAll");
			var checkboxs = document.getElementsByName("checkboxs");
			for(var i=0;i<checkboxs.length;i++) {
				checkboxs[i].checked = selectAll.checked;
			}
		}
	</script>

  </head>
  
  <body>
    <table width="1120" border="10" cellspacing="0" cellpadding="0" bordercolor="#DDEEF2">
  <tr>
    <td height="40px" bgcolor="#F4FAFB"> <b><font size="+1">酷星书城 管理中心</font> ——<font color="#9CACAF" size="+1">选择要加入团购的图书</font></b></td>
  </tr>
  <tr class="ziti">
    <td bgcolor="#F4FAFB" height="40px"> &nbsp;
    <form action="AdminTuangouCl?type=search" method="post">
    <img src="admin/img/search.png" width="25" height="21" />
    	&nbsp;图书类型：
        <select name="select" id="select">
        	<option>选择要查询的类型...</option>
        	<%
        		List<String> al = book.getBookType();
        		for(int i = 0; i < al.size(); i++) {
        			%>
        			<option><%=al.get(i) %></option>
        			<%
        		}
        	%>
    	</select>
        &nbsp;&nbsp;
    <input type="submit" name="button2" id="button2" value="搜 索" />
     &nbsp;&nbsp;&nbsp;&nbsp;<font color="#9CACAF">搜索要加入团购图书的图书类型</font>
     </form>
    </td>
  </tr>
  <tr>
    <td>
    <form action="AdminTuangouCl?type=addAll" method="post">
    <table width="1136" border="1" cellspacing="0" cellpadding="0" bordercolor="#EEF8F9">
      <tr class="ziti">
        <td height="36px" align="center" bgcolor="#BBDDE5">
            <input type="checkbox" name="bookid" id="selectAll" onclick="selectbooks()"/> 编 号
		</td>
        <td align="center" bgcolor="#BBDDE5">图书展示</td>
        <td align="center" bgcolor="#BBDDE5">图书名称</td>
        <td align="center" bgcolor="#BBDDE5">图书市场价</td>
        <td align="center" bgcolor="#BBDDE5">图书用户价</td>
        <td align="center" bgcolor="#BBDDE5">图书出版社</td>
        <td align="center" bgcolor="#BBDDE5">图书版次</td>
      </tr>
      <%
      	if(booklist != null) {
      		for(int i=0;i<booklist.size();i++) {
      			BookInfo books = booklist.get(i);
      			%>
      			<tr class="ziti">
			        <td align="center"><input type="checkbox" name="checkboxs" value="<%=books.getBook_id() %>"/>
			        	<%=books.getBook_id() %>  
					</td>
			        <td align="center" height="40px">
			        	<img alt="图书图片" src="images/<%=books.getBook_img() %>" width="40px" height="30px;">
			        </td>
			        <td align="center">
			        <input type="hidden" value="<%=books.getBook_name() %>" name="bookname"/>
			        <%=books.getBook_name() %></td>
			        <td align="center">￥<%=books.getBook_market_price() %>元</td>
			        <td align="center">￥<%=books.getBook_user_price() %>元</td>
			        <td align="center"><%=books.getBook_press() %></td>
			        <td align="center">
			        	第 <%=books.getBook_banci() %> 版
			        </td>
			      </tr>
      			<%
      		}
      	}
      %>
      
      <tr  class="ziti">
        <td align="center" height="36px"><input type="submit" name="button" id="button" value="加入团购图书" /></td>
        <td colspan="6" align="right"> 总计<%=num %>个记录&nbsp;&nbsp;&nbsp;</td>
        </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
  </body>
</html>
