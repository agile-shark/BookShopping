<%@ page language="java" import="java.util.*,com.shxt.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'highSearch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/search.css">
	<script type="text/javascript">
		function clear1() {
			document.getElementById("ser_text").value = "";
		}
		function clear2() {
			document.getElementById("min_price").value = "";
		}
		function clear3() {
			document.getElementById("max_price").value = "";
		}
	
		function returnSubmit(){
			var advancedSearchForm = document.getElementById("advancedSearchForm");
			var min_price = document.getElementById("min_price").value;
			var max_price = document.getElementById("max_price").value; 
			if(isNaN(min_price)||isNaN(max_price)){
				advancedSearchForm.min_price.value="0";
				advancedSearchForm.max_price.value="100";
				alert("价格区必须输入数字！");
			}else if(Number(min_price)>=Number(max_price)){
				advancedSearchForm.min_price.value="0";
				advancedSearchForm.max_price.value="100";
				alert("您输入的价格范围不正确！");
			}else{
				advancedSearchForm.submit();
			}
		}
	</script>
  </head>
  
  <%
  	BookInfoDAO info = new BookInfoDAO();
  	List<String> list = info.getBookType();
  	List<String> list1 = info.getBookPress();
   %>
  <body>
  
  <table align="center" class="pg">
  	<tr><td colspan="2"><jsp:include page="top.jsp"></jsp:include></td></tr>
  	<tr><td><jsp:include page="left1.jsp"></jsp:include></td>
  	<td valign="top">
  <div class="AreaR"> 
    
  <div class="box"> 
   <div class="box_1"> 
    <img src="images/highsearch.png" class="bd"/>
    <div class="boxCenterList"> 
      <form action="HighSearch" method="post" name="advancedSearchForm" id="advancedSearchForm"> 
    <table border="0" align="center" cellpadding="3"> 
    	
      <tr> 
      	<td><select name="attr" style="border:1px solid #ccc;">
      		<option value="book_name">书名</option>
      		<option value="book_author">作者名</option>
      		<option value="book_ISBN">ISBN</option>
      		<option value="book_zhuangding">装订版本</option>
      	</select></td>
      	<td><input type="text" name="ser_text" id="ser_text" value="请输入要查询的关键词" onfocus="clear1();" class="inputBg"/></td>
      </tr> 
      <tr> 
        <td><font size="1">出版社：</font></td> 
        <td><select name="bookpress" id="bookpress" style="border:1px solid #ccc;">
        <option value="">所有出版社</option> 
        <%for(int i = 0;i<list1.size();i++){ %>
        <option><%=list1.get(i) %></option>
        <%} %>
        </td> 
      </tr> 
      <tr> 
        <td><font size="1">图书分类：</font></td> 
        <td><select name="type" id="type" style="border:1px solid #ccc;"> 
            <option value="">所有类型</option> 
            <%for(int i = 0;i<list.size();i++){%>
            <option><%=list.get(i) %></option>
            <%} %>
        </td> 
      </tr> 
      <tr> 
        <td><font size="1">价格：</font></td> 
        <td><input name="min_price" type="text" id="min_price" class="inputBg" value="0" size="7" maxlength="8" onfocus="clear2();"/> 
          -
          <input name="max_price" type="text" id="max_price" class="inputBg" value="100" size="7" maxlength="8" onfocus="clear3();" /> 
        </td> 
      </tr> 
            <tr> 
      </tr> 
            
            <tr> 
        <td>&nbsp;</td> 
        </td> 
      </tr> 
      
      <tr> 
        <td colspan="4" align="center"><input type="hidden" name="action" value="form" /> 
         <!-- <input type="submit" value="立即搜索" /> --> 
         <img src="images/bg.png" style="cursor: pointer" onclick="returnSubmit()"/></td> 
      </tr> 
    </table> 
  </form> 
    </div> 
   </div> 
  </div> 
  </td>
  </tr>
  <tr><td colspan="2"><jsp:include page="footer.jsp"></jsp:include></td></tr>
  </table>
  </body>
</html>
