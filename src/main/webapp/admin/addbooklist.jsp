<%@ page language="java" import="java.util.*,com.shxt.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
BookInfoDAO binfo = new BookInfoDAO();
//得到图书的所以出版社信息
ArrayList<String> bookpress = (ArrayList<String>)binfo.getBookPress();
request.getSession().setAttribute("bookpress",bookpress);
//得到图书的所以类型信息
ArrayList<String> booktype = (ArrayList<String>)binfo.getBookType();
request.getSession().setAttribute("booktype",booktype);

String photoimg = (String)request.getSession().getAttribute("images");
System.out.println("从session中得到的图片路径为："+photoimg);
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
		.adminadd1 {
			font-size: 13px;
			font-family: 宋体;
		}
	</style>
	<script type="text/javascript">
		function userpriceValidate() {
			var userprice = document.getElementById("bookuserprice").value;
			if(isNaN(userprice)) {
				alert("该处只能输入数字!");
				window.bookaddinfo.bookuserprice.value="";
				window.bookaddinfo.bookuserprice.focus();
			}
		}
		function marketpriceValidate() {
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
		function addtype() {
			document.getElementById("addtypes").style.visibility = "visible";
		}
		function deletetype() {
			document.getElementById("addtypes").style.visibility = "hidden";
		}
		function addpress() {
			document.getElementById("addpress").style.visibility = "visible";
		}
		function deletepress() {
			document.getElementById("addpress").style.visibility = "hidden";
		}
	</script>
	<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  </head>
  <body>
  <table width="1140" border="10" bordercolor="#DDEEF2" align="left">
  <tr>
    <td align="left" height="50px">&nbsp; <b>酷星网管理系统</b>——<font color="#9CACAF"><b>增加图书列表</b></font></td>
  </tr>
  <tr>
    <td>
    
    <form action="AddBookInfo" method="post" name="bookaddinfo">
    <table width="1130" border="0" align="left">
      <tr>
        <td align="right" class="adminadd">图书名称：</td>
        <td><input type="text" name="bookname" id="textfield" size="30px" height="20px"/>
        	 &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
       <tr>
        <td align="right" class="adminadd"><img src="admin/img/wenhao.png"/>图书编号：</td>
        <td><input type="text" name="bookid" id="textfield" size="30px" height="20px" readonly/>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">&nbsp;</td>
        <td class="adminadd1">
        <font color="#666666">如果您不输入图书编号，系统将自动生成一个唯一的编号</font>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书图片：</td>
        <td class="adminadd">
        <%
        	if(photoimg != null) {
        		%>
        		<img src="images/<%=photoimg %>" width="80px" height="80px"/> &nbsp;
        		<%
        	} else {
        		%>
        		<img src="image/dongdei.gif" width="80px" height="80px"/> &nbsp;
        		<%
        	}
        %>
        
        <a href="admin/bookimage.jsp">本地上传图片</a>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书作者：</td>
        <td><input type="text" name="bookauthor" id="textfield2" size="30px" height="20px"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">&nbsp;</td>
        <td class="adminadd1">
        <font color="#666666">多个作者名，中间用逗号隔开</font>
        </td>
      </tr>
      
      
      
      <tr>
        <td align="right" class="adminadd"><img src="admin/img/wenhao.png"/>图书出版社：</td>
        <td>
        <select name="bookpress" id="select">
        	<%
        		ArrayList<String> alpress = (ArrayList<String>)request.getSession().getAttribute("bookpress");
        		for(int i = 0; i < alpress.size(); i++) {
        			%>
        			<option value="<%=alpress.get(i) %>"><%=bookpress.get(i) %></option>
        			<%
        		}
        	%>
        </select> <input type="button" value="增 加" onclick="addpress()">
        <input type="button" value="取 消" onclick="deletepress()">
        </td>
      </tr>
     <tr style="visibility:hidden">
     	<td>&nbsp;</td>
     	<td  id="addpress">
        	<form action="AddBookInfoOne?type=press" method="post">
        	<input type="text" size="20px" name="press"/> <input type="submit"  value="确 定" onclick="deletepress()"/> <input type="reset" value="重置" />
        	</form>
     	</td>
     </tr>
     
      <tr>
        <td align="right" class="adminadd">图书出版日期：</td>
        <td>
        <input class="Wdate" type="text" onClick="WdatePicker()" name="bookoutdate"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书库存量：</td>
        <td><input type="text" name="booknum" id="booknum" size="30px" height="20px" maxlength="5" onblur="booknumValidate()"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">&nbsp;</td>
        <td class="adminadd1">
        <font color="#666666">只能输入数字</font>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd"><img src="admin/img/wenhao.png"/>图书类别：</td>
        <td>
        	<select name="booktype" id="booktype">
        		<%
        		ArrayList<String> altype = (ArrayList<String>)request.getSession().getAttribute("booktype");
        		for(int i = 0; i < altype.size(); i++) {
        			%>
        			<option value="<%=altype.get(i) %>"><%=booktype.get(i) %></option>
        			<%
        		}
        		%>
        	</select> <input type="button" value="增 加" onclick="addtype()">
        <input type="button" value="取 消" onclick="deletetype()">
        </td>
      </tr>
      
      <tr style="visibility:hidden">
     	<td>&nbsp;</td>
     	<td  id="addtypes">
        	<form action="AddBookInfoOne?type=type" method="post">
        	<input type="text" size="20px" name="type"/> <input type="submit" value="确 定" onclick="deletetype()"/> <input type="reset" value="重置" />
        	</form>
     	</td>
     </tr>
      
      
      <tr>
        <td align="right" class="adminadd">图书页数：</td>
        <td><input type="text" name="bookpage" id="bookpage" size="30px" height="20px" maxlength="6" onblur="bookpageValidate()"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
       <tr>
        <td align="right" class="adminadd">&nbsp;</td>
        <td class="adminadd1">
        <font color="#666666">只能输入数字</font>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书字数：</td>
        <td><input type="text" name="booktext" id="booktext" size="30px" height="20px" maxlength="9" onblur="booktextValidate()"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
       <tr>
        <td align="right" class="adminadd">&nbsp;</td>
        <td class="adminadd1">
        <font color="#666666">只能输入数字</font>
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
          <select name="bookbanci">
          	<option>1</option>
          	<option>2</option>
          	<option>3</option>
          	<option>4</option>
          	<option>5</option>
          	<option>6</option>
          	<option>7</option>
          </select>
          &nbsp;版次
        </font>
        &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">               
       </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书重量：</td>
        <td>
        <input type="text" name="weight" id="weight" size="19px" height="20px" onblur="weightValidate()" maxlength="5"/>
        <select>
        	<option>千克</option>
        	<option>克</option>
        </select>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
       <tr>
        <td align="right" class="adminadd">&nbsp;</td>
        <td class="adminadd1">
        <font color="#666666">只能输入整数或浮点型的数字</font>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书市场价：</td>
        <td><input type="text" name="bookmarketprice" id="bookmarketprice" size="30px" maxlength="6" height="20px" onblur="marketpriceValidate()"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">&nbsp;</td>
        <td class="adminadd1">
        <font color="#666666">只能输入整数或浮点型的数字</font>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书会员价：</td>
        <td><input type="text" name="bookuserprice" id="bookuserprice" size="30px" maxlength="6" height="20px" onblur="userpriceValidate()"/>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">&nbsp;</td>
        <td class="adminadd1">
        <font color="#666666">只能输入整数或浮点型的数字</font>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd">图书是否下线：</td>
        <td>
        <select name="isxiaxian" id="select4">
        	<option value="0">没有下线</option>
        	<option value="1">已经下线</option>
        </select>
         &nbsp;&nbsp;<img alt="图片" src="<%=basePath%>/admin/img/must.png">
        </td>
      </tr>
      
      
      
      <tr>
        <td align="right" class="adminadd">加入推荐：</td>
        <td class="adminadd1">
        <input type="checkbox" value="新 书" name="tuijian" checked readonly="readonly"/>新 书&nbsp;<input type="checkbox" value="精 品" name="tuijian"/>精 品&nbsp;<input type="checkbox" value="畅 销" name="tuijian"/>畅 销
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd"><img src="admin/img/wenhao.png"/>图书是否团购：</td>
        <td>
        <select name="istuangou" id="select8">
        	<option value="0">不是</option>
        	<option value="1">是</option>
        </select>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd"><img src="admin/img/wenhao.png"/>图书是否优惠：</td>
        <td>
        <select name="isyouhui" id="select9">
       	 	<option value="0">不是</option>
        	<option value="1">是</option>
        </select>
        </td>
      </tr>
      <tr>
        <td align="right" class="adminadd"><img src="admin/img/wenhao.png"/>图书简介：</td>
        <td><textarea name="textarea" id="textarea" cols="50" rows="6"></textarea></td>
      </tr>
      <tr>
        <td align="right" class="adminadd">&nbsp;</td>
        <td class="adminadd1">
        <font color="#666666">仅供用户进行查看到信息</font>
        </td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td>
        <input type="submit" name="button" id="button" value="确 定" /> &nbsp;&nbsp;
        <input type="submit" name="button2" id="button2" value="重 置" />
        </td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
  </body>
</html>
