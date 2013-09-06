<%@ page language="java" import="java.util.*,com.shxt.admin.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//从显示页面得到图书id号
String bookid = request.getParameter("bookid");
//调用dao层的方法将book的信息查询出来
BookListDAO bi = new BookListDAO();
String sql = "select * from bookshopping where bookid="+bookid;
BookInfo book = bi.getBookInfo(bookid);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editbooklist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.adminadd {
			font-size: 13px;
			font-weight: bold;
			font-family: 宋体;
		}
		.admintext {
			font-size: 13px;
			font-family: 宋体;
		}
	</style>

  </head>
  
  <body>
  <table width="1140" border="10" bordercolor="#DDEEF2" align="left">
  <tr>
    <td align="left" height="50px" valign="middle"><br><br>&nbsp; <b>酷星网管理系统</b>——<font color="#9CACAF"><b>显示图书信息</b></font></td>
  </tr>
  <tr>
    <td>
    <table width="920" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr height="30px">
        <td align="right" class="adminadd">图书名称：</td>
        <td class="admintext">
        <%=book.getBook_name() %>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书图片：</td>
        <td>
        <div id="imgPreview" style='width:120px; height:120px;'>
          <img id="img1" src="<%=basePath%>/images/<%=book.getBook_img() %>" width="120" height="120" />
        </div>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书作者：</td>
        <td class="admintext">
        <%=book.getBook_author() %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书出版社：</td>
        <td class="admintext">
        <%=book.getBook_press() %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书出版日期：</td>
        <td class="admintext">
        <%=book.getBook_out_date() %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书库存量：</td>
        <td class="admintext">
        <%=book.getBook_num() %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书类别：</td>
        <td class="admintext">
        	<%=book.getBook_type() %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书页数：</td>
        <td class="admintext">
        <%=book.getBook_page() %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书字数：</td>
        <td class="admintext">
        <%=book.getBook_text() %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书装订形式：</td>
        <td class="admintext">
        <%=book.getBook_zhuangding() %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书版次：</td>
        <td class="admintext">
        <%=book.getBook_banci() %>          
       </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书重量：</td>
        <td class="admintext">
        <%=book.getBook_weight() %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书市场价：</td>
        <td class="admintext">
        <%=book.getBook_market_price() %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书会员价：</td>
        <td class="admintext">
        <%=book.getBook_user_price() %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书是否下线：</td>
        <td class="admintext">
        <%
        	int n = book.getBook_is_delete();
        	if(n == 1){
        		%>
        		该图书已经下线
        		<%
        	} else {
        		%>
        		该图书没有下线
        		<%
        	}
        %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书是否推荐：</td>
        <td class="admintext">
         <%
        	int n1 = book.getBook_is_best();
        	if(n1 == 1){
        		%>
        		该图书是推荐图书
        		<%
        	} else {
        		%>
        		该图书不是推荐图书
        		<%
        	}
        %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书是否新书：</td>
        <td class="admintext">
        <%
        	int n2 = book.getBook_is_new();
        	if(n2 == 1){
        		%>
        		该图书是新图书
        		<%
        	} else {
        		%>
        		该图书不是新图书
        		<%
        	}
        %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书是否畅销：</td>
        <td class="admintext">
        <%
        	int n3 = book.getBook_is_hot();
        	if(n1 == 1){
        		%>
        		该图书是畅销图书
        		<%
        	} else {
        		%>
        		该图书不是畅销图书
        		<%
        	}
        %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书是否团购：</td>
        <td class="admintext">
        <%
        	int n4 = book.getBook_is_tuangou();
        	if(n4 == 1){
        		%>
        		该图书是团购图书
        		<%
        	} else {
        		%>
        		该图书不是团购图书
        		<%
        	}
        %>
        </td>
      </tr>
      <tr height="30px">
        <td align="right" class="adminadd">图书是否优惠：</td>
        <td class="admintext">
       <%
        	int n5 = book.getBook_is_best();
        	if(n5 == 1){
        		%>
        		该图书是优惠图书
        		<%
        	} else {
        		%>
        		该图书不是优惠图书
        		<%
        	}
        %>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书简介：</td>
        <td class="admintext"><textarea name="textarea" id="textarea" cols="50" rows="6">
        	<%=book.getBook_introduce() %>
        </textarea></td>
      </tr>
     
    </table></td>
  </tr>
</table>
  </body>
</html>
