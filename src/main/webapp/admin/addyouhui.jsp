<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//得到加入的优惠图书名称
ArrayList<String> booksname = (ArrayList<String>)request.getAttribute("booksname");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addyouhui.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.ziti{
			font-size:13px;
		}
	</style>
	<script type="text/javascript">
		function numCheck() {
			var num = document.getElementById("num").value;
			if(isNaN(num)) {
				numText.innerHTML = "<font color='red'><img src='img/error.gif'>数量输入只能为数字！</img></font>";
				return false;
			} else if(num.toString().length==0) {
				numText.innerHTML = "<font color='red'><img src='img/error.gif'>数量输入不能为空！</img></font>";
				return false;
			} else {
				numText.innerHTML = "<font color='green'><img src='img/success.gif'>数量上限可用！</img></font>";
				return true;
			}
		}
		function nameCheck() {
			var name = document.getElementById("name").value;
			if(name.toString().length==0) {
				nameText.innerHTML = "<font color='red'><img src='img/error.gif'>优惠活动名称不能为空！</img></font>";
				return false;
			} else {
				nameText.innerHTML = "<font color='green'><img src='img/success.gif'>优惠活动名称可用！</img></font>";
				return true;
			}
		}	
		function returnValidate() {
			return numCheck() && nameCheck();
		}
	</script>
	<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
    <table width="1120" border="10" cellspacing="0" cellpadding="0" bordercolor="#DDEEF2">
  <tr>
    <td height="40px" bgcolor="#F4FAFB">&nbsp;<b><font size="+1">酷星书城 管理中心</font> ——<font color="#9CACAF" size="+1">添加优惠活动</font></b></td>
  </tr>
  <tr>
    <td>
    <form action="AdminYouhuiCl?type=addYouhuiBook" method="post" onsubmit="return returnValidate()">
    <table width="1136" border="0" cellspacing="0" cellpadding="0">
      <tr class="ziti">
        <td colspan="2" height="26px">&nbsp;</td>
        </tr>
      <tr class="ziti">
        <td width="438" align="right" height="40px"><b>优惠活动名称：</b></td>
        <td width="300"><input name="activityname" type="text" id="name" size="40" height="20px" onblur="nameCheck()"/></td>
        <td><div id="nameText"></div></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>优惠开始时间：</b></td>
        <td><input name="start_time" type="text" id="textfield2" size="25" height="20px" class="Wdate"  onClick="WdatePicker()"/></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>优惠结束时间：</b></td>
        <td><input name="stop_time" type="text" id="textfield3" size="25" height="20px" class="Wdate"  onClick="WdatePicker()"/></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>享受优惠的会员等级：</b></td>
        <td><input type="checkbox" name="checkbox" id="checkbox" />
          非会员 
            &nbsp;<input type="checkbox" name="checkbox2" id="checkbox2" checked/>
            注册用户</td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>购买数量上限：</b></td>
        <td><input name="activitynum" type="text" id="num" size="25" height="20px" maxlength="5" onblur="numCheck()"/></td>
        <td><div id="numText"></div></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>优惠方式：</b></td>
        <td><select name="select" id="select">
          <option value="zengping">享受赠品（特惠品）</option>
          <option value="zengping2">享受现金减免</option>
          <option value="zengping">3享受价格折购</option>
        </select></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>优惠图书：</b></td>
        <td>
        	
        		<%
        			for(int i=0;i<booksname.size();i++) {
        				%>
        				<%=booksname.get(i) %>
        				<%
        			}
        		%>
        </td>
      </tr>
      <tr class="ziti">
        <td align="right" height="36px"><input type="submit" name="button" id="button" value="确 定" /> &nbsp;&nbsp;&nbsp;</td>
        <td> &nbsp;&nbsp;&nbsp;<input type="reset" name="button2" id="button2" value="重 置" /></td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
  </body>
</html>
