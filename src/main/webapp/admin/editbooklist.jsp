<%@ page language="java" import="java.util.*,com.shxt.admin.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//从跳转的页面得到bookid的值
String bookid = request.getParameter("bookid");
//调用dao层的方法
BookListDAO bl = new BookListDAO();
//得到指定图书的信息
BookInfo book = bl.getBookInfo(bookid);
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
	</style>
	<script language="javascript" type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		function bookuserpriceValidate() {
			var userprice = document.getElementById("bookuserprice").value;
			if(isNaN(userprice)) {
				alert("该处只能输入数字!");
				window.bookaddinfo.bookuserprice.value="";
				window.bookaddinfo.bookuserprice.focus();
			}
		}
		function bookmarketpriceValidate() {
			var marketprice = document.getElementById("bookmarketprice").value;
			if(isNaN(marketprice)) {
				alert("该处只能输入数字!");
				window.bookaddinfo.bookmarketprice.value="";
				window.bookaddinfo.bookmarketprice.focus();
			}
		}
		function weightValidate() {
			var weight = document.getElementById("weight").value;
			if(isNaN(weight)) {
				alert("该处只能输入数字!");
				window.bookaddinfo.weight.value="";
				window.bookaddinfo.weight.focus();
			}
		}
		function banciValidate() {
			var banci = document.getElementById("banci").value;
			if(isNaN(banci)) {
				alert("该处只能输入数字!");
				window.bookaddinfo.banci.value="";
				window.bookaddinfo.banci.focus();
			}
		}
		function bookpageValidate() {
			var bookpage = document.getElementById("bookpage").value;
			if(isNaN(bookpage)) {
				alert("该处只能输入数字!");
				window.bookaddinfo.bookpage.value="";
				window.bookaddinfo.bookpage.focus();
			}
		}
		function booktextValidate() {
			var booktext = document.getElementById("booktext").value;
			if(isNaN(booktext)) {
				alert("该处只能输入数字!");
				window.bookaddinfo.booktext.value="";
				window.bookaddinfo.booktext.focus();
			}
		}
		function booknumValidate() {
			var booknum = document.getElementById("booknum").value;
			if(isNaN(booknum)) {
				alert("该处只能输入数字!");
				window.bookaddinfo.booknum.value="";
				window.bookaddinfo.booknum.focus();
			}
		}
	</script>
  </head>
  
  <body>
  <table width="1140" border="10" bordercolor="#DDEEF2" align="left">
  <tr>
    <td align="left" height="50px">&nbsp; <b>酷星网管理系统</b>——<font color="#9CACAF"><b>修改图书列表</b></font></td>
  </tr>
  <tr>
    <td>
    <form action="EditBookInfo" method="post" name="bookaddinfo">
    <table width="1130" border="0" align="left">
      <tr>
        <td align="right" class="adminadd">图书名称：</td>
        <td>
        <input type="hidden" name="bookid" value="<%=book.getBook_id() %>"/>
        <input type="text" name="bookname" id="textfield" size="30px" height="20px" value="<%=book.getBook_name() %>"/>
        	 &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书作者：</td>
        <td><input type="text" name="bookauthor" id="textfield2" size="30px" height="20px" value="<%=book.getBook_author() %>"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书出版社：</td>
        <td>
        <input type="bookpress" value="<%=book.getBook_press() %>"/>
        </td>
      </tr>
     
      <tr>
        <td align="right" class="adminadd">图书出版日期：</td>
        <td>
        <input class="Wdate" type="text" onClick="WdatePicker()" value="<%=book.getBook_out_date() %>"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书库存量：</td>
        <td><input type="text" name="booknum" id="booknum" size="30px" height="20px" value="<%=book.getBook_num() %>" onblur="booknumValidate()"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书类别：</td>
        <td>
        	<input type="text" value="<%=book.getBook_type() %>" size="30px" height="20px"/>	
        </td>
      </tr>
      
      <tr>
        <td align="right" class="adminadd">图书页数：</td>
        <td><input type="text" name="bookpage" id="bookpage" size="30px" height="20px" value="<%=book.getBook_page() %>" onblur="bookpageValidate()"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书字数：</td>
        <td><input type="text" name="booktext" id="booktext" size="30px" height="20px" value="<%=book.getBook_text() %>" onblur="booktextValidate()"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书装订形式：</td>
        <td>
        <select name="zhuangding" id="zhuangding">
        	<option>精装版</option>
        	<option>普通版</option>
        </select>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书版次：</td>
        <td><font size="2">第
          <input type="text" name="banci" id="banci" size="10px" height="20px" value="<%=book.getBook_banci() %>" onblur="banciValidate()"/>
                      版次</font>
        &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">               
       </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书重量：</td>
        <td>
        <input type="text" name="weight" id="weight" size="19px" height="20px" value="<%=book.getBook_weight() %>" onblur="weightValidate()"/>
        <select>
        	<option>千克</option>
        	<option>克</option>
        </select>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书市场价：</td>
        <td><input type="text" name="bookmarketprice" id="bookmarketprice" size="30px" height="20px" value="<%=book.getBook_market_price() %>" onblur="bookmarketpriceValidate()"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书会员价：</td>
        <td><input type="text" name="bookuserprice" id="bookuserprice" size="30px" height="20px" value="<%=book.getBook_user_price() %>" onblur="bookuserpriceValidate()"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书是否下线：</td>
        <td>
        <select name="isxiaxian" id="select4">
        	<%
        		if(book.getBook_is_delete()==1) {
        			%>
        			<option value="1">是</option>
        			<option value="0">不是</option>
        			<%
        		} else {
        			%>
        			<option value="0">不是</option>
        			<option value="1">是</option>
        			<%
        		}
        	%>
        </select>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书是否推荐：</td>
        <td>
        <select name="istuijian" id="select5">
        	<%
        		if(book.getBook_is_best()==1) {
        			%>
        			<option value="1">是</option>
        			<option value="0">不是</option>
        			<%
        		} else {
        			%>
        			<option value="0">不是</option>
        			<option value="1">是</option>
        			<%
        		}
        	%>
        </select>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书是否新书：</td>
        <td>
        <select name="isnew" id="select6">
        	<%
        		if(book.getBook_is_new()==1) {
        			%>
        			<option value="1">是</option>
        			<option value="0">不是</option>
        			<%
        		} else {
        			%>
        			<option value="0">不是</option>
        			<option value="1">是</option>
        			<%
        		}
        	%>
        </select>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书是否畅销：</td>
        <td>
        <select name="ishot" id="select7">
        	<%
        		if(book.getBook_is_hot()==1) {
        			%>
        			<option value="1">是</option>
        			<option value="0">不是</option>
        			<%
        		} else {
        			%>
        			<option value="0">不是</option>
        			<option value="1">是</option>
        			<%
        		}
        	%>
        </select>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书是否团购：</td>
        <td>
        <select name="istuangou" id="select8">
        	<%
        		if(book.getBook_is_tuangou()==1) {
        			%>
        			<option value="1">是</option>
        			<option value="0">不是</option>
        			<%
        		} else {
        			%>
        			<option value="0">不是</option>
        			<option value="1">是</option>
        			<%
        		}
        	%>
        </select>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书是否优惠：</td>
        <td>
        <select name="isyouhui" id="select9">
        	<%
        		if(book.getBook_is_youhui()==1) {
        			%>
        			<option value="1">是</option>
        			<option value="0">不是</option>
        			<%
        		} else {
        			%>
        			<option value="0">不是</option>
        			<option value="1">是</option>
        			<%
        		}
        	%>
        </select>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书简介：</td>
        <td><textarea name="textarea" id="textarea" cols="50" rows="6">
        	<%=book.getBook_introduce() %>
        </textarea></td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td>
        <input type="submit" name="button" id="button" value="确 定" /> &nbsp;&nbsp;
        <input type="reset" name="button2" id="button2" value="重 置" />
        </td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
  </body>
</html>
